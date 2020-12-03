//
//  ProductModel.swift
//  vFruits.am
//
//  Created by Karen Mirakyan on 03.12.20.
//

import Foundation
struct ProductModel: Codable {
    var _id: String
    var price: Int
    var maxOrder: Decimal
    var minOrder: Decimal
    var isActive: Bool
    var discount: Int
    var unit: String
    var nameAm: String
    var photo: String
    var descriptionAm: String?
}
