//
//  DefaultsManager.swift
//  DENTIST MANAGER
//
//  Created by MAKAR4IK BOND on 12.03.21.
//

import Foundation

class DefaultsManager {
    static let shared = DefaultsManager()
    static let defaults = UserDefaults.standard
    
    @discardableResult
    func archiveToUDWithNSCoding(for key: String, model: TBProfile?) -> Bool {
        guard let model = model else { return false }
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: model, requiringSecureCoding: false)
            DefaultsManager.defaults.setValue(data, forKey: key)
            return true
        } catch {
            Swift.debugPrint("UserDefaults archiving error")
            return false
        }
    }
    
    func unarchiveFromUDWithNSCoding(for key: String) -> TBProfile? {
        guard let data = DefaultsManager.defaults.data(forKey: key) else { return nil }
        do {
            return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? TBProfile
        } catch {
            Swift.debugPrint("UserDefaults unarchiving error")
            return nil
        }
    }
}
