//
//  SelectedProduct.swift
//  vFruits.am
//
//  Created by Karen Mirakyan on 03.12.20.
//

import SwiftUI
import SDWebImageSwiftUI

struct SelectedProduct: View {
    
    let product: ProductViewModel
    
    var body: some View {
        ZStack {
            SelectedProductBackground()
            
            VStack( alignment: .leading) {
                
                WebImage(url: URL(string: product.image))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.size.width * 0.8, height: UIScreen.main.bounds.size.height * 0.35, alignment: .center)
                    .cornerRadius(30)
                
                
                
                Text( "\(product.price) AMD" )
                    .foregroundColor(Color.gray)
                
                Text( product.name)
                    .foregroundColor(Color.gray)
                
                
                Text( product.unit)
                    .foregroundColor(Color.gray)
                
                Text( "Related Items" )
                    .foregroundColor(Color.black)
                    .padding(.top, 30)
                
                
                Spacer()
                
            }.padding()
        }.navigationBarTitle(Text( product.name), displayMode: .inline)
    }
}

struct SelectedProductBackground: View {
    var body: some View {
        
        VStack {
            Rectangle()
                .fill(Colors().yellow)
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height/12)
            
            
            Ellipse()
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height/9)
                .offset(y: -UIScreen.main.bounds.size.height/15)
            
            Spacer()
        }
        
    }
}

struct SelectedProduct_Previews: PreviewProvider {
    static var previews: some View {
        SelectedProduct(product: ProductViewModel(product: ProductModel(_id: "1", price: 550, maxOrder: 12, minOrder: 1, isActive: true, discount: 0, unit: "kg", nameAm: "mirg", photo: "https://firebasestorage.googleapis.com/v0/b/flyshop-4e6ea.appspot.com/o/uploaded%2FC7A38E16-9187-4EA3-8D4A-9AFAA974CFDE.jpg?alt=media&token=9aed576d-06f0-435d-b707-5220eae510fe", descriptionAm: "desc")))
    }
}
