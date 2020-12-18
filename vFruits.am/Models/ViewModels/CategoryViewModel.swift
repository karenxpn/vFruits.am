//
//  CategoryViewModel.swift
//  vFruits.am
//
//  Created by Karen Mirakyan on 02.12.20.
//

import Foundation
struct CategoryViewModel: Identifiable {
    var id: String
    var categoryModel: CategoryModel
    
    init( categoryModel: CategoryModel ) {
        self.categoryModel = categoryModel
        self.id = categoryModel._id
    }
    
    var name: String {
        self.categoryModel.nameAm
    }
}
