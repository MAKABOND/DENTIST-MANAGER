//
//  ProfileScreen.swift
//  DENTIST MANAGER
//
//  Created by MAKAR4IK BOND on 9.03.21.
//

import UIKit
import SnapKit

class ProfileScreen: UIViewController {
    private var userKey: String = "userData"

    static let shared = ProfileScreen()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        let person = TBFileManager.shared.unArchiveWithNSCoding(with: self.userKey)
        
        let nameText: UILabel = {
            let name = UILabel()
            name.text = person?.name
            name.textAlignment = .center
            return name
        }()
        let surnameText: UILabel = {
            let surname = UILabel()
            surname.text = person?.surname
            surname.textAlignment = .center
            return surname
        }()
        let phoneText: UILabel = {
            let phone = UILabel()
            phone.text = person?.phoneNumber
            phone.textAlignment = .center
            return phone
        }()
        
        super.viewDidLoad()
        
        setupNavigationBar()
        
        view.addSubview(UIViews.shared.imageView)
        view.addSubview(UIViews.shared.setImage)
        view.addSubview(nameText)
        view.addSubview(surnameText)
        view.addSubview(phoneText)
        
        view.backgroundColor = .white
        
        title = "Profile"
        setConstraintsProfile()
    }
    
    
    // MARK: - Methods
    @objc func editButton() {
        present(LoginPage(), animated: true, completion: nil)
    }
    
    private func setupNavigationBar() {
        let editButton = UIBarButtonItem(
            title: "Edit",
            style: .plain,
            target: self,
            action: #selector(self.editButton))
        self.navigationItem.rightBarButtonItems = [editButton].reversed()
    }

    // MARK: - Constrainst
    func setConstraintsProfile() {
        UIViews.shared.imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(120)
            make.left.right.equalToSuperview().inset(50)
            make.height.equalTo(300)
        }
        
        
    }
    
}
