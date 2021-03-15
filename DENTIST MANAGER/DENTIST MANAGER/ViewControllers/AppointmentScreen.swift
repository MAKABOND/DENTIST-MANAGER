//
//  AppointmentScreen.swift
//  DENTIST MANAGER
//
//  Created by MAKAR4IK BOND on 9.03.21.
//

import UIKit
import SnapKit
import MessageUI
import skpsmtpmessage

class AppointmentScreen: UIViewController, SKPSMTPMessageDelegate {
    
    static let shared = AppointmentScreen()
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
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Appointment"
        
        view.addSubview(dataPicker)
        view.addSubview(UIViews.shared.dataPickerButton)
        view.addSubview(UIViews.shared.reasonField)
        
        UIViews.shared.dataPickerButton.addTarget(self, action: #selector(pickedDate), for: .touchUpInside)
        dataPickerConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Methods
    @objc func pickedDate(sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .full
        timeFormatter.timeStyle = .short
        
        let strDate = timeFormatter.string(from: dataPicker.date)
        print(strDate)
         
        
        let person = TBFileManager.shared.unArchiveWithNSCoding(with: self.userKey)
        sendEmail(subject: "Appointment", body: "\((person?.name)!) \((person?.surname)!) \n \((person?.phoneNumber)!) \n want's appointment on: \n\(strDate) \nreason: \((UIViews.shared.reasonField.text)! )")
        
        let alert = UIAlertController(title: "Appointment", message: "You tried to appointment on: \n \(strDate) \n wait a call back to confirmation", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func sendEmail(subject: String, body: String) {
        let message = SKPSMTPMessage()
        message.relayHost = "smtp.gmail.com"
        message.login = "dentistapp777@gmail.com"
        message.pass = "12Makar12"
        message.requiresAuth = true
        message.wantsSecure = true
        message.relayPorts = [587]
        message.fromEmail = "dentistapp777@gmail.com"
        message.toEmail = "eri.makar12@gmail.com"
        message.subject = subject
        let messagePart = [kSKPSMTPPartContentTypeKey: "text/plain; charset=UTF-8", kSKPSMTPPartMessageKey: body]
        message.parts = [messagePart]
        message.delegate = self
        message.send()
    }

    func messageSent(_ message: SKPSMTPMessage!) {
        print("Successfully sent email!")
    }

    func messageFailed(_ message: SKPSMTPMessage!, error: Error!) {
        print("Sending email failed!")
        
        let alert = UIAlertController(title: "Error", message: "Mail failed", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Constraints
    func dataPickerConstraints() {
        self.dataPicker.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(200)
        }
        
        UIViews.shared.dataPickerButton.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(100)
            make.height.equalTo(50)
        }
        
        UIViews.shared.reasonField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(120)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(140)
        }
    }
}
