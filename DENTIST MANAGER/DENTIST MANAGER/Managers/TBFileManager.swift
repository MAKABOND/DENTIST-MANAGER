//
//  FileManager.swift
//  DENTIST MANAGER
//
//  Created by MAKAR4IK BOND on 12.03.21.
//

import Foundation

class TBFileManager {
    // MARK: - Static Properties
    static let shared = TBFileManager()
    
    // MARK: - Variables
    private var directoryURL: URL
    
    // MARK: - Init
    init() {
        self.directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    // MARK: - Methods
    @discardableResult
    func archiveWithNSCoding(with path: String, model: TBProfile?) -> Bool {
        let localPath = self.directoryURL.appendingPathComponent(path)
        guard let model = model else { return false }
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: model,
                                                        requiringSecureCoding: false)
            try data.write(to: localPath)
            return true
        } catch {
            Swift.debugPrint("Archiving error!")
            return false
        }
    }
    
    func unArchiveWithNSCoding(with path: String) -> TBProfile? {
        let localPath = self.directoryURL.appendingPathComponent(path)
        do {
            let data = try Data(contentsOf: localPath)
            return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? TBProfile
        } catch {
            Swift.debugPrint("Unarchiving error")
            return nil
        }
    }
}
