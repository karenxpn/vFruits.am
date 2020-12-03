//
//  ProductListModel.swift
//  vFruits.am
//
//  Created by Karen Mirakyan on 03.12.20.
//

import Foundation
struct ProductListModel: Codable {
    var status: String
    var results: Int
    var data: [ProductModel]
}
