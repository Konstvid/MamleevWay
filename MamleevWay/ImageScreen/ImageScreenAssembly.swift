//
//  ImageScreenAssembly.swift
//  MamleevWay
//
//  Created by Mamleev Andrey on 27.06.2023.
//

import Foundation

class ImageScreenAssembly {
    
    func build(image: Image) -> ImageScreenViewController {
        let router = ImageScreenRouter()
        let viewModel = ImageScreenViewModel(router: router, image: image)
        let vc = ImageScreenViewController(viewModel: viewModel)
        return vc
    }
}
