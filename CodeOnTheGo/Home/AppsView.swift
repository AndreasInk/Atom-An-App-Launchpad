//
//  AppsView.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 12/7/20.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore
struct AppsView: View {
    @State var apps = [Apps(id: UUID(), title: "Title", views: [Views]())]
    @State var app = Apps(id: UUID(), title: "Title", views: [Views]())
    @State var edit = false
    @EnvironmentObject var userData: UserData
    @State var hasLoaded = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("black"), Color("dark")]), startPoint: .topLeading, endPoint: .bottom)
                    .ignoresSafeArea()
                    .onAppear() {
                        self.loadData(){ userData in
                            
                            self.apps = userData
                            withAnimation() {
                            hasLoaded = true
                            }
                        }
                    }
                VStack {
                    LeadingText(text: "Your Apps")
                .font(Font.custom("Montserrat-SemiBold", size: 20.0))
                .foregroundColor(Color("light"))
                .padding(.bottom, 110)
                if hasLoaded {
                   
                
                  
                    
                    ScrollView {
        ForEach(Array(apps.enumerated()), id: \.element) { i, app in
            Button(action: {
                edit = true
                self.app = app
            }) {
                AppIcon(title: app.title)
                    .frame(width: geo.size.width/2.5, height: geo.size.width/2)
                    .padding()
            }
            
        }
                    }
                    .transition(.slide)
                    
                  
                }
                    Spacer()
                    Button(action: {
                        apps.append(Apps(id: UUID(), title: "Test", views: [Views]()))
                        hasLoaded = true
                        do {
                            let db = Firestore.firestore()
                            try db.collection("users" + "/" + userData.userID + "/" + "apps" + "/").document( app.id.uuidString).setData(from: app)
                        } catch let error {
                            print("Error writing website to Firestore: \(error)")
                        }
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color("b"))
                                .shadow(color: Color("b"), radius: 3)
                                .frame(height: 60)
                        Image(systemName: "plus")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color("dark"))
                            
                    }
                    }
                    
                    } .padding()
                if edit {
                    EditingView(edit: $edit, app: app)
                }
        
            }
    }
}
    func loadData(performAction: @escaping ([Apps]) -> Void) {
           let db = Firestore.firestore()
        let docRef = db.collection("users" + "/" + userData.userID + "/" + "apps")
           var userList:[Apps] = []
           //Get every single document under collection users
       
        docRef.getDocuments{ (documents, error) in
            if let document = documents, !document.isEmpty {
            for document in document.documents {
                   let result = Result {
                    try document.data(as: Apps.self)
                   }
                   switch result {
                       case .success(let user):
                           if let user = user {
                               userList.append(user)
                    
                           } else {
                               
                               print("Document does not exist")
                           }
                       case .failure(let error):
                           print("Error decoding user: \(error)")
                       }
                   
                 
               
                 performAction(userList)
           }
            }
        }
       }
}

struct AppsView_Previews: PreviewProvider {
    static var previews: some View {
        AppsView()
    }
}
