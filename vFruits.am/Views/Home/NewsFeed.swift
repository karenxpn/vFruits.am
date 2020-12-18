//
//  NewsFeed.swift
//  vFruits.am
//
//  Created by Karen Mirakyan on 02.12.20.
//

import SwiftUI

struct NewsFeed: View {
    
    @EnvironmentObject var homeVM: HomeViewModel
    
    var body: some View {
        ScrollView( .horizontal, showsIndicators: false ) {
            LazyHStack( alignment: .top) {
                ForEach(self.homeVM.newsFeed, id: \.id ) { news in
                    Image( news.url )
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.size.width * 0.6, height: UIScreen.main.bounds.size.height * 0.2)
                        .cornerRadius(15)
                        .padding(.vertical)
                        .padding(.horizontal, 5)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 0.3 )
        .background( LinearGradient(gradient: Gradient(colors: [Color(red: 255/255, green: 181/255, blue: 51/255), Color(red: 255/255, green: 227/255, blue: 36/255)]), startPoint: .top, endPoint: .bottom))
    }
}

struct NewsFeed_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeed()
    }
}
