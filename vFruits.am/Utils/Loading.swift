//
//  Loading.swift
//  vFruits.am
//
//  Created by Karen Mirakyan on 06.12.20.
//

import SwiftUI

struct Loading: View {
    @State private var shouldAnimate = false
    
    var body: some View {
        HStack {
            Circle()
                .fill(Colors().yellow)
                .frame(width: 20, height: 20)
                .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever())
            Circle()
                .fill(Colors().yellow)
                .frame(width: 20, height: 20)
                .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.3))
            Circle()
                .fill(Colors().yellow)
                .frame(width: 20, height: 20)
                .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.6))
        }.onAppear {
            self.shouldAnimate = true
        }
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}
