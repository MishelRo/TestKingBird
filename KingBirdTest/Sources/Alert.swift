//
//  Alert.swift
//  KingBirdTest
//
//  Created by User on 16.02.2021.
//

import UIKit
class Alert {
    static func addAlert(title: String, message: String, complession: @escaping()->Void)->UIAlertController{
        let alert  = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            complession()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            alert.dismiss(animated: true, completion: {})}
        alert.addAction(action)
        alert.addAction(cancel)
        return alert
    }
}
