//
//
//  DENTIST MANAGER
//
//  Created by MAKAR4IK BOND on 15.02.21.
//

import UIKit
import SnapKit

class LoginPage: BasicScrollViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Variables
    private var userKey: String = "userData"
    static let shared1 = LoginPage()
    var model: TBProfile?
    let viewScrool: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Enter info about"
        view.backgroundColor = .white
        setupNavigationBar()
        
        UIViews.shared.setImage.addTarget(self, action: #selector(choosePhoto), for: .touchUpInside)
        self.mainScroll.addSubview(viewScrool)
        self.viewScrool.addSubview(UIViews.shared.setImage)
        self.viewScrool.addSubview(UIViews.shared.imageView)
        self.viewScrool.addSubview(UIViews.shared.loginButton)
        self.viewScrool.addSubview(UIViews.shared.nameField)
        self.viewScrool.addSubview(UIViews.shared.surNameField)
        self.viewScrool.addSubview(UIViews.shared.phoneField)
        
        UIViews.shared.loginButton.addTarget(self,
                                             action: #selector(didTapButton),
                                             for: .touchUpInside)
        
        setConstraintsLoginPage()
    }
    
    // MARK: - Methods
    private func setupNavigationBar() {
        let editButton = UIBarButtonItem(
            barButtonSystemItem: .camera,
            target: self,
            action: #selector(self.choosePhoto))
        self.navigationItem.rightBarButtonItems = [editButton].reversed()
    }
    
    @objc func didTapButton() {
        if UIViews.shared.nameField.hasText == false ||
            UIViews.shared.surNameField.hasText == false ||
            UIViews.shared.phoneField.hasText == false {
            let alert = UIAlertController(title: "Error", message: "Fill all the fields", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            self.model = TBProfile(name: UIViews.shared.nameField.text!,
                                   surname: UIViews.shared.surNameField.text!,
                                   phoneNumber: UIViews.shared.phoneField.text!,
                                   image: UIViews.shared.imageView.image!)
            TBFileManager.shared.archiveWithNSCoding(with : self.userKey, model: self.model)
            startTabBar()
        }
    }
    
    @objc func choosePhoto() {
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a sourse", preferredStyle: .actionSheet)
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        actionSheet.addAction(UIAlertAction(title: "Photo gallery",
                                            style: .default,
                                            handler: { (action: UIAlertAction) in
                                                imagePickerController.sourceType = .photoLibrary
                                                self.present(imagePickerController, animated: true, completion: nil)
                                            }))
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        UIViews.shared.imageView.image = image
        
        picker.dismiss(animated: true)
    }
    
    // MARK: - Constraints
    func setConstraintsLoginPage() {
        self.viewScrool.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalTo(self.mainScroll.snp.width)
            make.height.equalTo(self.mainScroll.snp.height).priority(750)
        }
        
        UIViews.shared.imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(50)
            make.left.right.equalToSuperview().inset(50)
            make.height.equalTo(300)
        }
        
        UIViews.shared.loginButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(40)
            make.left.right.equalToSuperview().inset(50)
        }
        
        UIViews.shared.nameField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(400)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        UIViews.shared.surNameField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(490)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        UIViews.shared.phoneField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(580)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
    
    // MARK: - Tab Bar
    func startTabBar() {
        let tabBarVC = UITabBarController()
        let vc1 = UINavigationController(rootViewController: MainScreen())
        let vc2 = UINavigationController(rootViewController: AppointmentScreen())
        let vc3 = UINavigationController(rootViewController: ProfileScreen())
        
        vc1.title = "Home"
        vc2.title = "Appointment"
        vc3.title = "Profile"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3], animated: false)
        
        guard let items = tabBarVC.tabBar.items else { return }
        
        let images = ["house","magnifyingglass.circle","person.circle"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
}

