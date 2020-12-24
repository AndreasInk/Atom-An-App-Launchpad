//
//  LoginView.swift
//  CodeOnTheGo
//
//  Created by Rehatbir Singh on 12/24/2020.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State var loginStatus = ""
    
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
                
                HStack {
                    Text("Password:")
                    TextField("Your Account Password", text: $password)
                }
                
            }
            .padding()
            
            Button(action: self.login) {
                Text("Login")
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(
                LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
            )
            
            Text(loginStatus)
            
            Spacer()
            
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: self.email, password: self.password, completion: {result, error in
            
            if let error = error {
                print(error)
                self.loginStatus = error.localizedDescription
                self.password = ""
            } else {
                print("\(self.email) has been logged in!")
                self.loginStatus = "Login Successful!"
                self.email = ""
                self.password = ""
            }
            
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
