//
//  ListImagesCell.swift
//  MamleevWay
//
//  Created by Mamleev Andrey on 27.06.2023.
//

import UIKit
import SDWebImage

class ListImagesCell: UITableViewCell {
    
    private lazy var imageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0, 1]
        return gradient
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(list: Image) {
        if let url = list.urls?.regular {
            imageIcon.sd_setImage(with: URL(string: url))
        }
    }
    
    func configLayout() {
        contentView.addSubview(imageIcon)
        imageIcon.layer.addSublayer(gradient)
        
        imageIcon.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(5)
        }
    }
    
    class func reuseID() -> String {
        NSStringFromClass(ListImagesCell.self).components(separatedBy: ".").last ?? ""
    }
}
