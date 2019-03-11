//
//  PersonInfoViewController.swift
//  practiceapp
//
//  Created by Michael Neas on 3/2/19.
//  Copyright © 2019 Farce Productions. All rights reserved.
//

import UIKit

class PersonInfoViewController: UIViewController {
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var tableView: UITableView!
        
    let httpService = HTTPService()
    var people: [Person] = []
    var images: [UIImage] = []
    let colors = ["FFFF00", "ff0000", "228B22", "800080", "ffa500"] 
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.httpService.getThePeople(searchTerm: nil) { people, err in
            DispatchQueue.main.async {
                if err != nil {
                    print(err!)
                } else {
                    self.people = people
                    self.getImagesForPeople(amount: people.count)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func getImagesForPeople(amount: Int) {
        for _ in 1...amount {
            httpService.getPlaceholder(size: 70, color: colors.randomElement()!) { image in
                self.images.append(image)
                self.tableView.reloadData()
            }
        }
    }
}

extension PersonInfoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = people[indexPath.row]
        let personCell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonInfoCell
        personCell.setPerson(person)
        if images.count >= indexPath.row + 1 { 
            personCell.imageView?.image = images[indexPath.row]
        }
        return personCell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            people.remove(at: indexPath.row)
            images.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
}

extension PersonInfoViewController: UITextFieldDelegate {
    
}
