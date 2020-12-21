//
//  ActionView.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 11/29/20.
//

import SwiftUI

struct ActionView: View {
    @Binding var componet: Componets
    @State var views = [Views]()
    var body: some View {
        VStack {
        Text("Transition to...")
            ForEach(Array(views.enumerated()), id: \.element) { i, view in
            Button(action: {
                componet.action.append("Segue")
                componet.action.append("\(i)")
               
            }) {
                Blur()
                    .frame(width: 75, height: 75, alignment: .leading)
                Text(view.title)
                    .font(.headline)
            }
    }
        }
}
}

