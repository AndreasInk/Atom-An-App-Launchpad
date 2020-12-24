//
//  LoginView.swift
//  CodeOnTheGo
//
//  Created by Rehatbir Singh on 12/24/2020.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            
            Text("Login")
                .font(.largeTitle)
            
            Spacer()
            
            // Credentials
            VStack {
                
                HStack {
                    Text("Email:")
                    TextField("Your Email Address", text: $email)
                }
                .padding(.horizontal)
                
                HStack {
                    Text("Password:")
                    TextField("Your Account Password", text: $password)
                }
                .padding(.horizontal)
                
            }
            
            Spacer()
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
