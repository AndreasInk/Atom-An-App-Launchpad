//
//  BlurView.swift
//  Debatev2
//
//  Created by Andreas Ink on 11/21/20.
//


import SwiftUI
struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemUltraThinMaterialLight
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
