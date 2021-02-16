//
//  ErrorHandler.swift
//  KingBirdTest
//
//  Created by User on 16.02.2021.
//

import Foundation
enum Error: Int{
    case noInternet = 0
    case parseError = 1
    case otherError = 2
}
class ErrorHandler{
    static func erorGenerator(errorType: Error, error: NSError?)-> NSError{
        var error = NSError()
        switch errorType{
        case .noInternet:
            error = NSError(domain: "", code: errorType.rawValue,
                            userInfo: [error.localizedDescription: "Нет интеренета"])
        case .parseError:
            error = NSError(domain: "", code: errorType.rawValue,
                            userInfo: [error.localizedDescription: "Ошибка данных"])
        case .otherError:
            error = NSError(domain: "", code: errorType.rawValue,
                            userInfo: [error.localizedDescription: "Неизвестная ошибка"])
        }
         return error
    }
}
