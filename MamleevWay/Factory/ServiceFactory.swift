//
//  ServiceFactory.swift
//  MamleevWay
//
//  Created by Mamleev Andrey on 27.06.2023.
//

import Foundation

protocol ServiceFactoryProtocol {
    var networkService: NetworkServiceProtocol { get }
}

class ServiceFactory: ServiceFactoryProtocol {
    
    static var shared = ServiceFactory()
    
    let networkService: NetworkServiceProtocol
    
    init() {
        networkService = NetworkService()
    }
}
