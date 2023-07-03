//
//  ImageScreenRouter.swift
//  MamleevWay
//
//  Created by Mamleev Andrey on 27.06.2023.
//

import Foundation

protocol ImageScreenRouterProtocol {
    func dismiss()
}

class ImageScreenRouter: ImageScreenRouterProtocol {
    
    weak var moduleController: ImageScreenViewController?
    
    func dismiss() {
        moduleController?.dismiss(animated: true, completion: nil)
    }
}
