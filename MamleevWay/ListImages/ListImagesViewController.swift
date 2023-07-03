//
//  ListImagesViewController.swift
//  MamleevWay
//
//  Created by Mamleev Andrey on 27.06.2023.
//

import Foundation
import UIKit
import SnapKit

class ListImagesViewController: UIViewController {
    
    private let viewModel: ListImagesViewModelProtocol
    private let dataSource = ListImagesDataSource()
    private let listContainerView = ListImagesContainerView()
    private var currentPage = 0
    private var isLoadingData = false
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.color = UIColor.gray
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    init(viewModel: ListImagesViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configureUI()
        configureLayout()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        listContainerView.tableView.delegate = self
        listContainerView.tableView.dataSource = dataSource
    }
    
    private func configureLayout() {
        view.addSubview(listContainerView)
        view.addSubview(spinner)
        
        spinner.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        listContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func bind() {
        spinner.startAnimating()
        
        viewModel.getImages(page: currentPage) { [weak self] list in
            DispatchQueue.main.async {
                self?.spinner.stopAnimating()
                self?.dataSource.list = list
                self?.listContainerView.tableView.reloadData()
            }
        }
    }
}

extension ListImagesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < dataSource.list.count else { return }
        
        let list = dataSource.list[indexPath.row]
        viewModel.showImage(image: list)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastRowIndex = dataSource.list.count - 1
        if indexPath.row == lastRowIndex && !isLoadingData {
            currentPage += 1
            isLoadingData = true
            
            spinner.startAnimating()
            
            viewModel.getImages(page: currentPage) { [weak self] newList in
                DispatchQueue.main.async {
                    self?.spinner.stopAnimating()
                    self?.dataSource.list.append(contentsOf: newList)
                    self?.listContainerView.tableView.reloadData()
                    self?.isLoadingData = false
                }
            }
        }
    }
}
