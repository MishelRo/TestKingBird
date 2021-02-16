//
//  NetworkManager.swift
//  KingBirdTest
//
//  Created by User on 14.02.2021.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol{
    func getData(urlString: String, complession: @escaping(AFDataResponse<Any>)->(), error: @escaping(NSError)->())
}

class NetworkManager: NetworkManagerProtocol {
    static var shared = NetworkManager()
    private init() {}
    
    let params = ["sol": 1000,
                  "page": 1,
                  "api_key": Constants.api_key] as [String: Any]
    
    func getData(urlString: String, complession: @escaping(AFDataResponse<Any>)->(), error: @escaping(NSError)->()) {
        AF.request(urlString, method: .get, parameters: params, encoding: URLEncoding.default,
                   headers: nil, interceptor: .none, requestModifier: .none).responseJSON { (responce) in
                    switch responce.result {
                    case .success(_):
                        complession(responce)
                    case .failure(let erors):
                        error(erors as NSError)
                    }
    }
}
}
