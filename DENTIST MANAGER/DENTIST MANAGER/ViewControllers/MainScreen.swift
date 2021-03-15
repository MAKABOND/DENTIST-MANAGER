//
//  MainScreen.swift
//  DENTIST MANAGER
//
//  Created by MAKAR4IK BOND on 9.03.21.
//

import UIKit


class MainScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(UIViews.shared.homeImageView)
        setConstraints()
        
    }
    func setConstraints() {
        UIViews.shared.homeImageView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview().inset(0)
            make.height.equalTo(400)
        }
    }
}
