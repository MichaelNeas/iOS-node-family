//
//  HTTPService.swift
//  practiceapp
//
//  Created by Michael Neas on 3/10/19.
//  Copyright © 2019 Farce Productions. All rights reserved.
//

import Foundation
import UIKit

class HTTPService {
    //    URLSession is technically both a class and a suite of classes for handling HTTP/HTTPS-based requests:
    //    .default: Creates a default configuration object that uses the disk-persisted global cache, credential and cookie storage objects.
    //    .ephemeral: Similar to the default configuration, except that all session-related data is stored in memory. Think of this as a “private” session.
    //    .background: Lets the session perform upload or download tasks in the background. Transfers continue even when the app itself is suspended or terminated by the system.
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var errorMessage: String?
    
    func getThePeople(searchTerm: String?, completion: @escaping (([Person], String?) -> ()) ) {
        // For a new user query, you cancel the data task if it already exists, because you want to reuse the data task object for this new query. 
        dataTask?.cancel()
        // To include the user’s search string in the query URL, you create a URLComponents object from the iTunes Search base URL, then set its query string: this ensures that characters in the search string are properly escaped. 
        if var urlComponents = URLComponents(string: "http://localhost:3000") {
            //urlComponents.query = "media=music&entity=song&term=\(searchTerm)"
            // The url property of urlComponents might be nil, so you optional-bind it to url.
            guard let url = urlComponents.url else { return }
            // From the session you created, you initialize a URLSessionDataTask with the query url and a completion handler to call when the data task completes. 
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer { self.dataTask = nil }
                // If the HTTP request is successful, you call the helper method updateSearchResults(_:), which parses the response data into the tracks array. 
                if let error = error {
                    self.errorMessage = "DataTask error: " + error.localizedDescription + "\n"
                    completion([], self.errorMessage)
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    //self.updateSearchResults(data)
                    let personArray = try? JSONDecoder().decode([Person].self, from: data)
                    if let people = personArray {
                        completion(people, nil)
                    } else { 
                        self.errorMessage = "No data" 
                        completion([], self.errorMessage)
                    }
                    
                }
            }
            // All tasks start in a suspended state by default; calling resume() starts the data task. 
            dataTask?.resume()
        }
    }
    
    func getPlaceholder(size: Int, color: String, completion: @escaping (UIImage) -> ()) {
        guard let url = URL(string: "https://via.placeholder.com/\(size)/\(color)") else { return }
        
        DispatchQueue.global().async {
            //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            do {
                let data = try Data(contentsOf: url) 
                guard let image = UIImage(data: data) else { return }
                DispatchQueue.main.async {
                    completion(image)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
