//
//  ContentView.swift
//  SwiftUI-LottieAnimation
//
//  Created by Ikmal Azman on 12/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State var startAnimation : Bool = true
    
    var body: some View {
        HStack {
            Spacer()
            
            LottieView(lottieFile: .merchant,animationShouldPlay: $startAnimation)
                .frame(height: 100, alignment: .center)
            
            closeView
        }
        .frame(height: 100)
        .padding()
    }
    
    private var closeView : some View {
        Image(systemName: "xmark")
            .imageScale(.large)
            .foregroundColor(.accentColor)
            .frame(maxHeight: .infinity, alignment: .topTrailing)
            .onTapGesture {
                startAnimation.toggle()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
