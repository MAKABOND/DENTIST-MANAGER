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
        button.setTitle("SUMBIT", for: .normal)
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
        image.image = UIImage(named: "unnamed")
        image.layer.cornerRadius = 155
        image.layer.borderWidth = 1
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        return image
    }()
    
    let setImage: UIButton = {
        let button = UIButton()
        button.setTitle("CHANGE PHOTOCARD", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    // MARK: - UI Elements Home
    var homeImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "homaImage")
        // image.layer.cornerRadius = 155
        // image.layer.borderWidth = 1
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        
        return image
    }()
    
    // MARK: - UI Elements Appointment
    let reasonField: UITextField = {
        let reason = UITextField()
        reason.backgroundColor = .white
        reason.placeholder = "  Descripe the reason of applointment"
        reason.layer.cornerRadius = 25
        reason.layer.borderWidth = 1
        reason.clearButtonMode = .whileEditing
        reason.leftViewMode = .always
        reason.clipsToBounds = true
        reason.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        
        return reason
    }()
    
    let dataPickerButton: UIButton = {
        let button = UIButton()
        button.setTitle("SEND REQUEST FOR APPOINTMENT", for: .normal)
        button.backgroundColor = .systemGray6
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        
        return button
    }()
    // MARK: - UI Elements Profile Screen
    let nameText: UILabel = {
        let name = UILabel()
        name.text = LoginPage.shared1.model?.name
        name.layer.cornerRadius = 25
        name.layer.borderWidth = 1
        name.textAlignment = .center
        
        return name
    }()
    
    let surnameText: UILabel = {
        let surname = UILabel()
        surname.text = LoginPage.shared1.model?.surname
        surname.layer.cornerRadius = 25
        surname.layer.borderWidth = 1
        surname.textAlignment = .center
        
        return surname
    }()
    
    let phoneText: UILabel = {
        let phone = UILabel()
        phone.text = LoginPage.shared1.model?.phoneNumber
        phone.layer.cornerRadius = 25
        phone.layer.borderWidth = 1
        phone.textAlignment = .center
        
        return phone
    }()
}
