//
//  ViewController.swift
//  KingBirdTest
//
//  Created by User on 14.02.2021.
//

import UIKit

protocol ViewControllerProtocol{
    func reloadData()
}

class ViewController: UIViewController,  ViewControllerProtocol {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    static  var shared = ViewController()
    var viewModel = ViewModel.shared
    var deletedManager = DeletedManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conteinerRegister()
        viewModel.delegate = self
        collectionView.delegate = self
        start()
        self.view.addGestureRecognizer(longPressRecognizer())
    }
    
    func start() {
        viewModel.loading { [weak self](errors) in
            guard let self = self else {return}
            let alert = Alert.addAlert(title: "Error", message: errors.localizedDescription) {}
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func longPressRecognizer()->UILongPressGestureRecognizer{
        UILongPressGestureRecognizer(target: self, action: #selector(handleLongTap))
    }
    
    func alert(complession: @escaping()->Void) {
        let alert = Alert.addAlert(title: "Внимание",
                                   message: "Выбранное вами фото будет удалено!") { complession() }
        self.present(alert, animated: true, completion: nil)
    }
    
    func conteinerRegister() {
        container = FactoryConrainers.factoryRootContainer(with: [.services])
    }
    
    func reloadData(){
        collectionView.reloadData()
    }
    
    @objc func handleLongTap(gesture : UILongPressGestureRecognizer!) {
        if gesture.state != .ended { return }
        let lock = gesture.location(in: self.collectionView )
        if let indexPath = self.collectionView.indexPathForItem(at: lock) {
            let id = viewModel.photo[indexPath.row].id
            alert {
                self.viewModel.deleteObjects(id: id)
            }
        }
    }
}

