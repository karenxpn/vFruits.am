//
//  ProductViewModel.swift
//  vFruits.am
//
//  Created by Karen Mirakyan on 03.12.20.
//

import Foundation
struct ProductViewModel: Identifiable {
    var id: String
    var product: ProductModel
    
    init( product: ProductModel) {
        self.product = product
        self.id = product._id
    }
    
    var name: String {
        self.product.nameAm
    }
    
    var image: String {
        self.product.photo
    }
}
