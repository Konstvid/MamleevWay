//
//  ListImagesContainerView.swift
//  MamleevWay
//
//  Created by Mamleev Andrey on 27.06.2023.
//

import UIKit

class ListImagesContainerView: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ListImagesCell.self, forCellReuseIdentifier: ListImagesCell.reuseID())
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
