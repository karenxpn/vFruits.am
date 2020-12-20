//
//  HomeService.swift
//  vFruits.am
//
//  Created by Karen Mirakyan on 02.12.20.
//

import Alamofire
import Combine

protocol HomeServiceProtocol {
    func fetchCategories() -> AnyPublisher<[CategoryModel], Error>
    func fetchProductsByCategoryID( id: String ) -> AnyPublisher<ProductListModel, AFError>
    func fetchNewsFeed( token: String ) -> AnyPublisher<[NewsFeedModel], Error>
}

class HomeService {
    static let shared: HomeServiceProtocol = HomeService()
        
    private init() {}
}

extension HomeService: HomeServiceProtocol {
    
    func fetchNewsFeed( token: String ) -> AnyPublisher<[NewsFeedModel], Error> {
        
        // TODO
        
        let arr = [Just( NewsFeedModel(id: "1", url: "news") ),
                   Just( NewsFeedModel(id: "2", url: "news") ),
                   Just( NewsFeedModel(id: "3", url: "news") ),
                   Just( NewsFeedModel(id: "4", url: "news") ),
                   Just( NewsFeedModel(id: "5", url: "news") )]
        
        return Publishers.MergeMany(arr)
            .collect()
            .mapError{ $0 as Error }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    func fetchCategories() -> AnyPublisher<[CategoryModel], Error> {
        
        let url = "\(Credentials().BASE_URL)/categories"
        
        return AF.request(url,
                          method: .get)
            .publishDecodable(type: CategoryDataModel.self)
            .value()
            .map{ $0.data }
            .mapError{ $0 as Error }
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
