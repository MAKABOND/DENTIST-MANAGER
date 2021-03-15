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
        
        title = "PROMOTION"
        view.backgroundColor = .white
        
        view.addSubview(UIViews.shared.homeImageView)
        view.addSubview(UIViews.shared.lineImageView)
        view.addSubview(UIViews.shared.lebedevImageView)
        setConstraints()
        
    }
    
    func setConstraints() {
        UIViews.shared.homeImageView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview().inset(0)
            make.height.equalTo(400)
        }
        
        UIViews.shared.lineImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(280)
            make.left.equalToSuperview().inset(130)
            make.right.equalToSuperview().inset(0)
            make.height.equalTo(100)
        }
        
        UIViews.shared.lebedevImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(400)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(200)
        }
    }
}
