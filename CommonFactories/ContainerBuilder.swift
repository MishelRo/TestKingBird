//
//  ContainerBuilder.swift
//  QRDynamic
//
//  Created by Aleksandr Khlebnikov on 03.07.2020.
//  Copyright © 2020 VTB. All rights reserved.
//

import Foundation
import Swinject

/// Строитель наполнения контейнера
final class ContainerBuilder {
    
    // MARK: - Private Properties
    private var container: Container!
    
    // MARK: - Lifecycle
    
    init() {
        self.container = Container(defaultObjectScope: .container)
        container.register(NetworkManagerProtocol.self) { _ in NetworkManager.shared }
    }
    
    // MARK: - Building
    
    @discardableResult
    func addAlerts() -> ContainerBuilder {
//        ErrorHandlerConfigurator().assemble(container: container)
        return self
    }
    
    @discardableResult
    func addServices() -> ContainerBuilder {
        

        container.register(FetchDataProtocol.self) { _ in
            ServicesContainer.shared.resolve(_protocol: FetchDataProtocol.self)!
        }
        
        container.register(ViewModelProtocol.self) { _ in
            ServicesContainer.shared.resolve(_protocol: ViewModelProtocol.self)!
        }
        container.register(CoreDataManagerProtocol.self) { _ in
            ServicesContainer.shared.resolve(_protocol:CoreDataManagerProtocol.self)!
        }
        container.register(DeletedManagerProtocol.self) { _ in
            ServicesContainer.shared.resolve(_protocol: DeletedManagerProtocol.self)!
        }
        container.register(ViewControllerProtocol.self) { _ in
            ServicesContainer.shared.resolve(_protocol: ViewControllerProtocol.self)!
        }
        
        
        
        return self
    }
    
    @discardableResult
    func addAnalytics() -> ContainerBuilder {
       
        self
    }
    
    @discardableResult
    func addLogging() -> ContainerBuilder {
//        container.register(Logger.self) { _ in
//            CashLogger.shared
//        }
        return self
    }
    
    func build() -> Container {
        self.container
    }
    
}
