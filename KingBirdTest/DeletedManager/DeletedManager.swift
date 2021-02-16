//
//  DeletedManager.swift
//  KingBirdTest
//
//  Created by User on 14.02.2021.
//
protocol DeletedManagerProtocol{
    func addToIgnore(id: Int)
    func arrayOfDeletedIds()->[Int]
  
}

import Foundation
class DeletedManager: DeletedManagerProtocol {

    static var shared = DeletedManager()
    
    func addToIgnore(id: Int) {
        var array =  self.arrayOfDeletedIds()
        array.append(id)
        UserDefaults.standard.set(array, forKey: Constants.deleted_key)
    }
    
    func arrayOfDeletedIds()->[Int]{
        UserDefaults.standard.object(forKey: Constants.deleted_key) as? [Int] ?? [Int]()
    }
    
    private init() {}
}
