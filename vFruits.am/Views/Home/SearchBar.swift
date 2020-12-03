//
//  SearchBar.swift
//  vFruits.am
//
//  Created by Karen Mirakyan on 02.12.20.
//

import SwiftUI

struct SearchBar: View {
    
    @EnvironmentObject var homeVM: HomeViewModel
    
    var body: some View {
        HStack {
            TextField("Search...", text: self.$homeVM.search)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
        }.padding(.horizontal)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
