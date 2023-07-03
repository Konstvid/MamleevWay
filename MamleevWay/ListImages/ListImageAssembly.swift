//
//  ListImagesAssemble.swift
//  MamleevWay
//
//  Created by Mamleev Andrey on 27.06.2023.
//

import Foundation

class ListImagesAssemble: BaseAssembly {
    
    func build() -> ListImagesViewController {
        let router = ListImagesRouter()
        let viewModel = ListImagesViewModel(router: router, networkService: serviceFactory.networkService)
        let vc = ListImagesViewController(viewModel: viewModel)
        router.moduleController = vc
        return vc
    }
}
