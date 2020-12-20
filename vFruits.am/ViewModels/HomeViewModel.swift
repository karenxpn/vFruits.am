//
//  HomeViewModel.swift
//  vFruits.am
//
//  Created by Karen Mirakyan on 02.12.20.
//

import Foundation
import Combine

protocol HomeViewModelProtocol {
    var newsFeed: [NewsFeedModel] { get }
    var categoryList: [CategoryViewModel] { get }
    var categoryProducts: [ProductViewModel] { get }
}

class HomeViewModel: ObservableObject {
    @Published var newsFeed = [NewsFeedModel]()
    @Published var categoryList = [CategoryViewModel]()
    @Published var search: String = ""
    @Published var currentCategoryTabID: String = ""
    @Published var categoryProducts = [ProductViewModel]()
    @Published var loading: Bool = false
    
    var cancellable = Set<AnyCancellable>()
    var dataManager: HomeServiceProtocol
    
    init(dataManager: HomeServiceProtocol = HomeService.shared) {
        self.dataManager = dataManager
        
        initiallyGetNewsFeedAndCategoryList()
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    
    func initiallyGetNewsFeedAndCategoryList() {
        self.loading = true
        Publishers.Zip( dataManager.fetchCategories(), dataManager.fetchNewsFeed(token: ""))
            .sink { (error) in
                switch error {
                    case .failure(let error ):
                        print(error.localizedDescription)
                    default:
                        self.loading = false
                }
            } receiveValue: { (categoryArray, newsFeed) in
                self.categoryList = categoryArray.map( CategoryViewModel.init )
                self.currentCategoryTabID = self.categoryList[0].id
                self.getProductsByCategory()
                
                self.newsFeed = newsFeed

            }.store(in: &self.cancellable)
    }
    
    
    func getProductsByCategory() {
        self.loading = true
        
        dataManager.fetchProductsByCategoryID(id: self.currentCategoryTabID)
            .sink { (completion) in
                switch completion {
                    case .failure(let error):
                        print(error.localizedDescription)
                    default:
                        self.loading = false
                }
            } receiveValue: { (productListModel) in
                self.categoryProducts = productListModel.data.map( ProductViewModel.init )
            }.store(in: &self.cancellable)
    }
}
