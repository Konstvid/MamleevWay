//
//  ImageScreenViewController.swift
//  MamleevWay
//
//  Created by Mamleev Andrey on 27.06.2023.
//

import UIKit

class ImageScreenViewController: UIViewController {
    
    private let viewModel: ImageScreenViewModelProtocol
    private let imageScreenContainerView = ImageScreenContainerView()
    
    init(viewModel: ImageScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configereUI()
        configureLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configereUI() {
        view.addSubview(imageScreenContainerView)
        imageScreenContainerView.setUp(image: viewModel.image)
    }
    
    private func configureLayout() {
        imageScreenContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
