//
//  HomeService.swift
//  vFruits.am
//
//  Created by Karen Mirakyan on 02.12.20.
//

import Foundation
import Alamofire

class HomeService {
    func fetchNewsFeed( token: String, completion: @escaping( [NewsFeedModel]? ) -> ()) {
        let arr = [NewsFeedModel(id: "1", url: "news"),
                   NewsFeedModel(id: "2", url: "news"),
                   NewsFeedModel(id: "3", url: "news"),
                   NewsFeedModel(id: "4", url: "news"),
                   NewsFeedModel(id: "5", url: "news")]
        
        DispatchQueue.main.async {
            completion( arr )
        }
    }
    
    func fetchCategories( completion: @escaping ( CategoryDataModel? ) -> ()) {
        guard let url = URL(string: "\(Credentials().BASE_URL)/categories" ) else {
            DispatchQueue.main.async {
                completion( nil )
            }
            return
        }
        
        AF.request(url,
                   method: .get).responseDecodable(of: CategoryDataModel.self) { (response) in
                        DispatchQueue.main.async {
                            completion( response.value )
                        }
                   }
    }
    
    func fetchProductsByCategoryID( id: String, completion: @escaping( ProductListModel? ) -> ()) {
        
        guard let url = URL(string: "\(Credentials().BASE_URL)/products?category=\(id)" ) else {
            DispatchQueue.main.async {
                completion( nil )
            }
            return
        }
        
        AF.request(url,
                   method: .get).responseDecodable(of: ProductListModel.self) { (response) in
                        DispatchQueue.main.async {
                            completion( response.value )
                        }
                   }

    }
}
