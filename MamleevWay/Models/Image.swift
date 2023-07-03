//
//  Image.swift
//  MamleevWay
//
//  Created by Mamleev Andrey on 27.06.2023.
//

import Foundation

struct Image: Decodable {
    
    let urls: ImageURL?
    let height: CGFloat?
}

struct ImageURL: Decodable {
    
    let regular: String?
}
