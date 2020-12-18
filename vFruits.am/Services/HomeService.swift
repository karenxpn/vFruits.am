//
//  HomeService.swift
//  vFruits.am
//
//  Created by Karen Mirakyan on 02.12.20.
//

import Foundation
import Alamofire
import Combine

protocol HomeServiceProtocol {
    func fetchCategories() -> AnyPublisher<[CategoryModel], AFError>
    func fetchProductsByCategoryID( id: String ) -> AnyPublisher<ProductListModel, AFError>
}

class HomeService {
    static let shared: HomeServiceProtocol = HomeService()
        
    private init() {}
}


extension HomeService: HomeServiceProtocol {
    
    func fetchNewsFeed( token: String, completion: @escaping( [NewsFeedModel]? ) -> ()) {
        
        // TODO
        
        let arr = [NewsFeedModel(id: "1", url: "news"),
                   NewsFeedModel(id: "2", url: "news"),
                   NewsFeedModel(id: "3", url: "news"),
                   NewsFeedModel(id: "4", url: "news"),
                   NewsFeedModel(id: "5", url: "news")]
        
        DispatchQueue.main.async {
            completion( arr )
        }
    }
    
    
    func fetchCategories() -> AnyPublisher<[CategoryModel], AFError> {
        
        let url = "\(Credentials().BASE_URL)/categories"
        
        return AF.request(url,
                          method: .get)
            .publishDecodable(type: CategoryDataModel.self)
            .value()
            .map{ $0.data }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchProductsByCategoryID( id: String ) -> AnyPublisher<ProductListModel, AFError> {
        
        
        let url = "\(Credentials().BASE_URL)/products?category=\(id)"

        return AF.request(url,
                   method: .get)
            .publishDecodable(type: ProductListModel.self)
            .value()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
