//
//  Appicon.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 12/7/20.
//

import SwiftUI

struct AppIcon: View {

    @State var title = ""
    var body: some View {
        VStack {
        Image("demopic")
            .resizable()
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color("b"), Color("blue")]), startPoint: .topLeading, endPoint: .bottom), lineWidth: 10)
            )
        //   .clipShape( Circle())
        Text(title)
            .font(Font.custom("Montserrat-SemiBold", size: 14.0))
            .foregroundColor(Color("light"))
        }
    }
}
