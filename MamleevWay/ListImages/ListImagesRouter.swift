//
//  ListImagesRouterProtocol.swift
//  MamleevWay
//
//  Created by Mamleev Andrey on 27.06.2023.
//

import Foundation
import UIKit

protocol ListImagesRouterProtocol {
    func showImageScreenViewController(image: Image)
    func show(error: Error)
}

class ListImagesRouter: ListImagesRouterProtocol {
    
    weak var moduleController: UIViewController?
    
    func showImageScreenViewController(image: Image) {
        let vc = ImageScreenAssembly().build(image: image)
        moduleController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func show(error: Error) {
        let alert = UIAlertController(
            title: "Error",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        moduleController?.present(alert, animated: true, completion: nil)
    }
}
