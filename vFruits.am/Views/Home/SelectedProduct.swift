//
//  SelectedProduct.swift
//  vFruits.am
//
//  Created by Karen Mirakyan on 03.12.20.
//

import SwiftUI

struct SelectedProduct: View {
    
    let product: ProductViewModel
    
    var body: some View {
        Text(product.name)
            .navigationBarTitle(Text( product.name), displayMode: .inline)
    }
}

//struct SelectedProduct_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectedProduct()
//    }
//}
