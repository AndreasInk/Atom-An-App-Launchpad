//
//  FrameView.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 12/2/20.
//

import SwiftUI

struct FrameView: View {
    @Binding var componet: Componets
    var body: some View {
        VStack {
           
            Stepper(value: $componet.height, in: 0...1000) {
                Text("Height: \(componet.height)")
            }
        }
    }
}

