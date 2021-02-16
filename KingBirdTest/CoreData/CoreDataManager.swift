//
//  CoreDataManager.swift
//  KingBirdTest
//
//  Created by User on 14.02.2021.
//
protocol CoreDataManagerProtocol{
    func savePhoto(_photo: [Photo])
    func getDataFromCoreData(complession: @escaping([Photo]) -> (), errorComplession: @escaping(NSError)->()) 
}

import UIKit
import Foundation
import CoreData
class CoreDataManager: CoreDataManagerProtocol{
    
    static var shared = CoreDataManager()
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var deletedManager: DeletedManagerProtocol!{
        container.resolve(DeletedManagerProtocol.self)
    }
    
    func savePhoto(_photo: [Photo]){
        DispatchQueue.main.async { [unowned self] in
            for item in _photo {
                let save = CoreDataPhoto(entity: CoreDataPhoto.entity(), insertInto: context)
                save.id = Int64(item.id)
                save.imgSrc = item.imgSrc
                appDelegate.saveContext()
            }
        }
    }
    
    func getDataFromCoreData(complession: @escaping([Photo]) -> (), errorComplession: @escaping(NSError)->()) {
        var arrayOfSavedPhotos = [Photo]()
        let fetchRequest = NSFetchRequest<CoreDataPhoto>(entityName: "CoreDataPhoto")
        do{
            let result = try self.context.fetch(fetchRequest)
            for item in result {
                let element = Photo(id: Int(item.id), imgSrc: item.imgSrc)
                arrayOfSavedPhotos.append(element)
                let filter = self.deletedManager.arrayOfDeletedIds()
                let filteredPhotos = arrayOfSavedPhotos.filter { !filter.contains($0.id) }
                complession(filteredPhotos)
            }
        } catch {
            let errors = NSError()
            errorComplession(ErrorHandler.erorGenerator(errorType: .otherError, error: errors as NSError))
        }
    }
}
