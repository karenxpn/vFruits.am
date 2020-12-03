//
//  CategoryModel.swift
//  vFruits.am
//
//  Created by Karen Mirakyan on 02.12.20.
//

import Foundation
struct CategoryModel: Codable {
    var _id: String
    var order: Int
    var productsCount: Int
    var isActive: Bool
    var nameAm: String
}
