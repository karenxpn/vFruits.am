//
//  HomeView.swift
//  vFruits.am
//
//  Created by Karen Mirakyan on 02.12.20.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeVM = HomeViewModel()
    
    // Top List is the news, promos etc. scrolling horizontally
    // Category Slider with its products grid
    
    // Create @Published variable in view model currentCategoryTab and its child grid of products
    
    var body: some View {
        VStack {
            NewsFeed().environmentObject( self.homeVM )
            
            Group {
                SearchBar().environmentObject( self.homeVM )
                
                CategoryList().environmentObject(self.homeVM)

                ProductsGrid().environmentObject(self.homeVM)
            }.offset(y: -25)
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
