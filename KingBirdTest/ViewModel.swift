//
//  ViewModel.swift
//  KingBirdTest
//
//  Created by User on 14.02.2021.
//
protocol ViewModelProtocol{
    func loading(complession: @escaping(NSError)->())
    func deleteObjects(id: Int)
    var photo: [Photo]{get set}
    var delegate: ViewControllerProtocol! {get set}
}

import Foundation

class ViewModel: ViewModelProtocol{
    
    static  var shared = ViewModel()
    var photo = [Photo]()
    var firstLoad = true
    var delegate: ViewControllerProtocol!
    var fetchDataManager: FetchDataProtocol!{
        container.resolve(FetchDataProtocol.self)}
    var coreDataManager: CoreDataManagerProtocol!{
        container.resolve(CoreDataManagerProtocol.self)}
    var deletedManager: DeletedManagerProtocol!{
        container.resolve(DeletedManagerProtocol.self)}
    
    func loading(complession: @escaping(NSError)->()) {
        let userDefoult = UserDefaults.standard
        if userDefoult.bool(forKey: Constants.user_key) {
            coreDataManager.getDataFromCoreData {  [weak self] (photo) in
                guard let self = self else {return}
                self.photo = photo} errorComplession: { (error) in
                complession(error)}
            self.delegate.reloadData()
        } else {
            fetchDataManager.getPhoto { [weak self](responce) in
                guard let self = self else {return}
                self.photo = responce.photos
                self.delegate.reloadData()
                userDefoult.set(true, forKey: Constants.user_key)
                self.coreDataManager.savePhoto(_photo: responce.photos)} error: { (errors) in
                    complession(errors)
                }
        }
    }
    
    func deleteObjects(id: Int){
        deletedManager.addToIgnore(id: id)
        coreDataManager.getDataFromCoreData {  [weak self] (photo) in
            guard let self = self else {return}
            self.photo = photo }
            errorComplession: { (error) in }
        self.delegate.reloadData()}
    
    private init(){}
}




