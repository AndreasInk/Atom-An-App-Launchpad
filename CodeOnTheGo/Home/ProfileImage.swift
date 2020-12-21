//
//  ProfileImage.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 12/6/20.
//

import SwiftUI

struct ProfileImage: View {
    var body: some View {
       Image("demopic")
        .resizable()
      
        .overlay(
                   Circle()
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color("b"), Color("blue")]), startPoint: .topLeading, endPoint: .bottom), lineWidth: 5)
                )
     //   .clipShape( Circle())
        
                   
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage()
    }
}
