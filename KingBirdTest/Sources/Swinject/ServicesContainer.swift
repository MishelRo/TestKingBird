//
//  SwinjectConteiner.swift
//  KingBirdTest
//
//  Created by User on 14.02.2021.
//
import Swinject
import Foundation
class ServicesContainer{
  static  var shared = ServicesContainer()
    init(
        api: FetchDataProtocol = FetchDataManager.shared,
        network: NetworkManagerProtocol = NetworkManager.shared,
        viewModel:  ViewModelProtocol = ViewModel.shared,
        coreData: CoreDataManagerProtocol = CoreDataManager.shared,
        deletedManager: DeletedManagerProtocol = DeletedManager.shared,
        viewController: ViewControllerProtocol = ViewController.shared
    ) {
        container.register(FetchDataProtocol.self) { _  in FetchDataManager.shared }
        container.register(NetworkManagerProtocol.self) { _ in NetworkManager.shared }
        container.register(ViewModelProtocol.self) { _ in ViewModel.shared }
        container.register(CoreDataManagerProtocol.self) {  _ in CoreDataManager.shared }
        container.register(DeletedManagerProtocol.self) { _ in DeletedManager.shared }
        container.register(ViewControllerProtocol.self) { _ in ViewController.shared }
    }
    
    func resolve<Protocol>(_protocol: Protocol.Type)->Protocol?{
        container.resolve(_protocol)
    }
}
