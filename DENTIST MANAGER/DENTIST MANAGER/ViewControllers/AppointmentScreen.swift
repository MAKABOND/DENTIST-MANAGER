//
//  AppointmentScreen.swift
//  DENTIST MANAGER
//
//  Created by MAKAR4IK BOND on 9.03.21.
//

import UIKit
import SnapKit
import MessageUI

class AppointmentScreen: UIViewController {
    
    private var userKey: String = "userData"
    // MARK: - UI Elements declaration
    private let dataPicker: UIDatePicker = {
        
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .inline
        picker.minuteInterval = 15
        
        let components = Calendar.current.dateComponents([.day, .month, .year], from: Date())
        let today = Calendar.current.date(from: components)!
        picker.minimumDate = today

        return picker
    }()
    
    private let dataPickerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Try to appointment", for: .normal)
        button.backgroundColor = .lightGray
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Appointment"
        
        view.addSubview(dataPicker)
        view.addSubview(dataPickerButton)
        
        dataPickerButton.addTarget(self, action: #selector(pickedDate), for: .touchUpInside)
        dataPickerConstraints()
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated:true)
        }
    }
    
    // MARK: - Methods
    @objc func pickedDate(sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .full
        timeFormatter.timeStyle = .short
        
        let strDate = timeFormatter.string(from: dataPicker.date)
        print(strDate)
        
        let alert = UIAlertController(title: "Appointment", message: "You tried to appointment on: \n \(strDate) \n wait a call back to confirmation", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Constraints
    func dataPickerConstraints() {
        self.dataPicker.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview().inset(10)
        }
        
        self.dataPickerButton.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(100)
        }
    }
    
}
