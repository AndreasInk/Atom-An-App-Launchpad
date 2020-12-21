//
//  Header.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 12/6/20.
//

import SwiftUI

struct Header: View {
    @Binding var code: Bool
    @Binding var settings: Bool
    @Binding var profile: Bool
    var body: some View {
        HStack {
            Button(action: {
                code.toggle()
            }) {
                ZStack {
                    
                Circle()
                    .foregroundColor(Color("b"))
                    .shadow(color: Color("b"), radius: 3)
                    .frame(width: 50)
                    Image(systemName: "plus")
                        .foregroundColor(Color("dark"))
            }
            }
            Button(action: {
                settings.toggle()
            }) {
                ZStack {
                Circle()
                    .frame(width: 50)
                    .foregroundColor(Color("b"))
                    .shadow(color: Color("b"), radius: 3)
                    Image(systemName: "gear")
                        .foregroundColor(Color("dark"))
            }
            }
            Spacer()
            Button(action: {
                
            }) {
            ProfileImage()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(color: Color("b"), radius: 3)
            }
        } .padding(.horizontal)
    }
}


