//
//  PersonModel.swift
//  practiceapp
//
//  Created by Michael Neas on 3/10/19.
//  Copyright © 2019 Farce Productions. All rights reserved.
//

import Foundation

struct Person: Codable {
    var id: UInt
    var name: String
    var age: UInt
    var weight: Double
}
