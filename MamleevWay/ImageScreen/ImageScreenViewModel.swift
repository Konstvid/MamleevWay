//
//  ImageScreenViewModel.swift
//  MamleevWay
//
//  Created by Mamleev Andrey on 27.06.2023.
//

import Foundation

protocol ImageScreenViewModelProtocol {
    var image: Image { get }
}

class ImageScreenViewModel: ImageScreenViewModelProtocol {
    
    let router: ImageScreenRouterProtocol
    var image: Image
    
    init(router: ImageScreenRouterProtocol, image: Image) {
        self.router = router
        self.image = image
    }
}
