//
//  TabBar.swift
//  DENTIST MANAGER
//
//  Created by MAKAR4IK BOND on 13.03.21.
//

import Foundation
import UIKit
class TabBar: UIViewController {
    
    static let shared = TabBar()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTabBar()
    }
    
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
