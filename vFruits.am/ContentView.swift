//
//  ContentView.swift
//  vFruits.am
//
//  Created by Karen Mirakyan on 02.12.20.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        
        NavigationView {
            
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                        
                    }
                
                Text( "Favourites" )
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Favourites")
                        
                    }
                
                Text( "Cart" )
                    .tabItem {
                        Image(systemName: "cart")
                        Text("Cart")
                        
                    }
                
                Text( "My Profile" )
                    .tabItem {
                        Image(systemName: "person")
                        Text("My Profile")
                        
                    }
            }.accentColor(Color(red: 255/255, green: 213/255, blue: 59/255))
            .navigationBarTitle(Text( "vFruits" ), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
