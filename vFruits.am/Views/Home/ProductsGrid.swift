//
//  ProductsGrid.swift
//  vFruits.am
//
//  Created by Karen Mirakyan on 03.12.20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductsGrid: View {
    
    @EnvironmentObject var homeVM: HomeViewModel
    
    var body: some View {
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
        
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach( self.homeVM.categoryProducts, id: \.id) { product in
                    NavigationLink(destination: SelectedProduct(product: product)) {
                        ZStack {
                            WebImage(url: URL(string: product.image ))
                                .resizable()
                                .scaledToFill()
                                .cornerRadius(10)
                                .frame(width: UIScreen.main.bounds.size.width/2 - 20, height: UIScreen.main.bounds.size.height/8 )

                            Text( product.name )
                                .font(.custom( "McLaren-Regular", size: 16))
                                .foregroundColor(.gray)
                                .offset(y: -UIScreen.main.bounds.size.height/18)
                            
                        }.padding([.top, .bottom], 12)
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(color: Color.gray, radius: 8, x: 8, y: 8)
                    }

                }
            }
    }
}

struct ProductsGrid_Previews: PreviewProvider {
    static var previews: some View {
        ProductsGrid()
    }
}
