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
    
    var price: String {
        "\(self.product.price)"
    }
    
    var maxOrder: Decimal {
        self.product.maxOrder
    }
    
    var minOrder: Decimal {
        self.product.minOrder
    }
    
    var unit: String {
        self.product.unit
    }
}
