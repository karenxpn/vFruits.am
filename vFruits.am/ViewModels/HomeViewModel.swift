//
//  HomeViewModel.swift
//  vFruits.am
//
//  Created by Karen Mirakyan on 02.12.20.
//

import Foundation
class HomeViewModel: ObservableObject {
    @Published var newsFeed = [NewsFeedModel]()
    @Published var categoryList = [CategoryViewModel]()
    @Published var search: String = ""
    @Published var currentCategoryTabID: String = ""
    @Published var categoryProducts = [ProductViewModel]()
    
    init() {
        HomeService().fetchNewsFeed(token: "") { (response) in
            if let response = response {
                self.newsFeed = response
            }
        }
        
        HomeService().fetchCategories { (response) in
            if let response = response {
                self.categoryList = response.data.map( CategoryViewModel.init )
                self.currentCategoryTabID = self.categoryList[0].id
                self.getProductsByCategory()
            }
        }
    }
    
    func getProductsByCategory() {
        HomeService().fetchProductsByCategoryID(id: self.currentCategoryTabID) { response in
            if let response = response {
                self.categoryProducts = response.data.map( ProductViewModel.init )
            }
        }
    }
}
