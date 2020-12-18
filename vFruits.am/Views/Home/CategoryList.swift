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
                    
                    VStack( spacing: 3) {
                        Text( category.name )
                            .lineLimit(1)
                            .fixedSize(horizontal: false, vertical: true)
                            .foregroundColor(self.homeVM.currentCategoryTabID == category.id ? Color.yellow : Color.black)
                            .padding(.horizontal)
                        
                        
                    }.onTapGesture {
                        self.homeVM.currentCategoryTabID = category.id
                        self.homeVM.getProductsByCategory()
                    }
                }
            }.padding(.horizontal)
            .padding(.bottom, 3)
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
