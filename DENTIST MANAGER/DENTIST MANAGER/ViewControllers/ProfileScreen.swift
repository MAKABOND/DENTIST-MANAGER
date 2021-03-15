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
        super.viewDidLoad()
        title = "Profile"
        let person = TBFileManager.shared.unArchiveWithNSCoding(with: self.userKey)
        UIViews.shared.nameText.text = person?.name
        UIViews.shared.surnameText.text = person?.surname
        UIViews.shared.phoneText.text = person?.phoneNumber
        UIViews.shared.imageView.image = person?.image

        setupNavigationBar()
        
        view.addSubview(UIViews.shared.imageView)
        view.addSubview(UIViews.shared.nameText)
        view.addSubview(UIViews.shared.surnameText)
        view.addSubview(UIViews.shared.phoneText)
        
        view.backgroundColor = .white
        
        setConstraintsProfile()
    }
    
    
    // MARK: - Methods
    @objc func editButton() {
        present(LoginPage(), animated: true, completion: nil)
        let person = TBFileManager.shared.unArchiveWithNSCoding(with: self.userKey)
        UIViews.shared.nameField.text = person?.name
        UIViews.shared.surNameField.text = person?.surname
        UIViews.shared.phoneField.text = person?.phoneNumber
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
        
        UIViews.shared.nameText.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(460)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        UIViews.shared.surnameText.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(550)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        UIViews.shared.phoneText.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(640)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
}
