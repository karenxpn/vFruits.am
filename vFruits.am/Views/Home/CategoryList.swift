//
//  CategoryList.swift
//  vFruits.am
//
//  Created by Karen Mirakyan on 02.12.20.
//

import SwiftUI

struct CategoryList: View {
    @EnvironmentObject var homeVM: HomeViewModel

    var body: some View {
        ScrollView( .horizontal, showsIndicators: false ) {
            HStack {
                ForEach( self.homeVM.categoryList, id: \.id ) { category in
                    
                    VStack {
                        Text( category.name )
                            .padding(.horizontal)
                        
                        Rectangle()
                            .fill(self.homeVM.currentCategoryTabID == category.id ? Color.yellow : Color.black)
                            .frame(height: 1)
                        
                    }.onTapGesture {
                        self.homeVM.currentCategoryTabID = category.id
                        self.homeVM.getProductsByCategory()
                    }
                }
            }.padding(.horizontal)
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
