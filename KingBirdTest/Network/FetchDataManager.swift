//
//  API.swift
//  KingBirdTest
//
//  Created by User on 14.02.2021.
//

import Foundation
protocol FetchDataProtocol {
    func getPhoto(complession: @escaping(ResponceModel)->(), error: @escaping(NSError)->())
}

class FetchDataManager: FetchDataProtocol {
    static var shared = FetchDataManager()
    var networkManager: NetworkManagerProtocol!{
        container.resolve(NetworkManagerProtocol.self)
    }
    
    
    func getPhoto(complession: @escaping(ResponceModel)->(), error: @escaping(NSError)->()) {
        networkManager.getData(urlString: Constants.urlString) {  (responce) in
            let decoder = JSONDecoder()
            guard let data  = responce.data else {return}
            do{
                let result = try decoder.decode(ResponceModel.self, from: data)
                complession(result)
            }catch {}
        } error: { (errors) in
            error(errors)
        }
    }
    
    private init(){}
}
