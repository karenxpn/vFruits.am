//
//  vFruits_amApp.swift
//  vFruits.am
//
//  Created by Karen Mirakyan on 02.12.20.
//

import SwiftUI

@main
struct vFruits_amApp: App {
    
    init() {
        let newAppearance = UINavigationBarAppearance()
        newAppearance.configureWithOpaqueBackground()
        newAppearance.backgroundColor = UIColor(red: 255/255, green: 181/255, blue: 51/255, alpha: 1.0)
        newAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white, .font: UIFont( name: "McLaren-Regular", size: 20)!]
        UINavigationBar.appearance().standardAppearance = newAppearance
        
    }
    
    var body: some Scene {
        WindowGroup {
            
            // check if the user is logged or no
            // if logged -> ContentView
            // else -> AuthView
            ContentView()
        }
    }
    
}
