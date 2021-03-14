//
//  Profile.swift
//  DENTIST MANAGER
//
//  Created by MAKAR4IK BOND on 11.03.21.
//

import Foundation

struct PropertyKey {
    static let name = "Name"
    static let surname = "Surname"
    static let phoneNumber = "PhoneNumer"
}

class TBProfile: NSObject, NSCoding {
    // MARK: - Variables
    var name: String
    var surname: String
    var phoneNumber: String
    
    // MARK: - Initialization
    init(name: String, surname: String, phoneNumber: String) {
        self.name = name
        self.surname = surname
        self.phoneNumber = phoneNumber
    }
    
    // MARK: - NSCoding
    func encode(with coder: NSCoder) {
        coder.encode(self.name, forKey: PropertyKey.name)
        coder.encode(self.surname, forKey: PropertyKey.surname)
        coder.encode(self.phoneNumber, forKey: PropertyKey.phoneNumber)
    }
    required init(coder: NSCoder) {
        self.name = coder.decodeObject(forKey: PropertyKey.name) as! String
        self.surname = coder.decodeObject(forKey: PropertyKey.surname) as! String
        self.phoneNumber = coder.decodeObject(forKey: PropertyKey.phoneNumber) as! String
    }
}
