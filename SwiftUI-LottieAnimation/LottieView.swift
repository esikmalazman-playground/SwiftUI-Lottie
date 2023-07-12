//
//  LottieView.swift
//  SwiftUI-LottieAnimation
//
//  Created by Ikmal Azman on 12/07/2023.
//

import SwiftUI
import Lottie

enum LottieFile {
    case none
    case loading
    case merchant
}

extension LottieFile {
    var name : String {
        switch self {
        case .none :
            return ""
        case .loading:
            return "verificationLoading"
        case .merchant:
            return "merchant"
        }
    }
}

struct LottieView : UIViewRepresentable {
    var lottieFile : LottieFile = .none
    var loopMode : LottieLoopMode = .loop
    
    @Binding var animationShouldPlay : Bool
    var animationView : LottieAnimationView = LottieAnimationView()
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        
        animationView.animation = LottieAnimation.named(lottieFile.name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if animationShouldPlay {
            animationView.play()
            animationView.isHidden = false
        } else {
            animationView.stop()
            animationView.isHidden = true
        }
    }
}
