//
//  ListImagesViewModel.swift
//  MamleevWay
//
//  Created by Mamleev Andrey on 27.06.2023.
//

import Foundation

protocol ListImagesViewModelProtocol {
    func getImages(page: Int, completion: @escaping ([Image]) -> ())
    func showImage(image: Image)
}

class ListImagesViewModel: ListImagesViewModelProtocol {
    
    private let router: ListImagesRouterProtocol
    private let networkService: NetworkServiceProtocol
    
    init(router: ListImagesRouterProtocol, networkService: NetworkServiceProtocol) {
        self.router = router
        self.networkService = networkService
    }
    
    func getImages(page: Int, completion: @escaping ([Image]) -> ()) {
        
        networkService.getImages(page: page) { [ weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    completion(image)
                case .failure(let error):
                    self?.router.show(error: error)
                }
            }
        }
    }
    
    func showImage(image: Image) {
        router.showImageScreenViewController(image: image)
    }
}
