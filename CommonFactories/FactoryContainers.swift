//
//  FactoryContainers.swift
//  QRDynamic
//
//  Created by Skibin Alexander on 02.07.2020.
//  Copyright © 2020 VTB. All rights reserved.
//

import Foundation
import Swinject

/// Набор функциональности для контейнера
enum FactoryConrainersType {
    case alerts
    case services
    case analitycs
    case logging
}

/// Фабрика контейнеров
struct FactoryConrainers {
    
    // MARK: - Static
    
    static func factoryRootContainer(with types: [FactoryConrainersType]) -> Container {
        let builder = ContainerBuilder()
        
        if types.contains(.alerts) {
            builder.addAlerts()
        }
        
        if types.contains(.services) {
            builder.addServices()
        }
        
        if types.contains(.analitycs) {
            builder.addAnalytics()
        }
        
        if types.contains(.logging) {
            builder.addLogging()
        }
        
        return builder.build()
    }
}
