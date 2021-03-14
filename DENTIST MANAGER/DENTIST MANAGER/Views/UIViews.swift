//
//  UIViews.swift
//  DENTIST MANAGER
//
//  Created by MAKAR4IK BOND on 13.03.21.
//

import Foundation
import UIKit

class UIViews {
    
    // MARK: - UI Elements Declaration LOGIN PAGE
    static let shared = UIViews()
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    let nameField: UITextField = {
        let name = UITextField()
        name.backgroundColor = .white
        name.placeholder = "   Enter your name"
        name.borderStyle = .line
        name.layer.cornerRadius = 25
        name.clearButtonMode = .whileEditing
        name.layer.borderWidth = 1
        
        name.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        name.leftViewMode = .always
        name.clipsToBounds = true
        
        return name
    }()
    
    let surNameField: UITextField = {
        let surname = UITextField()
        surname.backgroundColor = .white
        surname.placeholder = "   Enter your surname"
        surname.borderStyle = .line
        surname.layer.cornerRadius = 25
        surname.layer.borderWidth = 1
        surname.clearButtonMode = .whileEditing
        
        surname.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        surname.leftViewMode = .always
        surname.clipsToBounds = true
        
        return surname
    }()
    
    let phoneField: UITextField = {
        let phone = UITextField()
        phone.backgroundColor = .white
        phone.placeholder = "   Enter your phone number"
        phone.borderStyle = .line
        phone.layer.cornerRadius = 25
        phone.layer.borderWidth = 1
        phone.clearButtonMode = .whileEditing
        phone.keyboardType = .phonePad
        
        phone.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        phone.leftViewMode = .always
        phone.clipsToBounds = true
        
        return phone
    }()
    
    var imageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 155
        image.layer.borderWidth = 1
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        return image
    }()
    
    let setImage: UIButton = {
        let button = UIButton()
        button.setTitle("Set Image", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
}
