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
        getCategories()
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    func getCategories() {
        self.loading = true
        dataManager.fetchCategories().sink(receiveCompletion: { (completion) in

            switch completion {
                case .failure(let error):
                    self.categoryList.removeAll(keepingCapacity: false)
                    print(error.localizedDescription)
                default:
                    self.loading = false
                    
            }
            
        }, receiveValue: { (categorydataModel) in
            self.categoryList = categorydataModel.map( CategoryViewModel.init )
            self.currentCategoryTabID = self.categoryList[0].id
            self.getProductsByCategory()
        }).store(in: &self.cancellable)
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
