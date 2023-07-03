//
//  ImageScreenContainerView.swift
//  MamleevWay
//
//  Created by Mamleev Andrey on 27.06.2023.
//

import UIKit

class ImageScreenContainerView: UIView {

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.maximumZoomScale = 5.0
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        return scrollView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    init() {
        super.init(frame: .zero)
        configureUI()
        configureLayout()
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
        doubleTapGesture.numberOfTapsRequired = 2
        scrollView.addGestureRecognizer(doubleTapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(image: Image) {
        if let url = image.urls?.regular {
            imageView.sd_setImage(with: URL(string: url))
        }
    }
    
    private func configureUI() {
        backgroundColor = .white

        scrollView.addSubview(imageView)
        addSubview(scrollView)
    }
    
    private func configureLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.centerX.equalTo(scrollView)
            $0.centerY.equalTo(scrollView).offset(-50)
            $0.width.height.equalToSuperview()
        }
    }
    
    @objc private func handleDoubleTap(_ gesture: UITapGestureRecognizer) {
        if scrollView.zoomScale == scrollView.minimumZoomScale {
            scrollView.setZoomScale(scrollView.maximumZoomScale, animated: true)
        } else {
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
        }
    }
}

extension ImageScreenContainerView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
