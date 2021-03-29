//
//  LoginView.swift
//  FitQuest_V1
//
//  Created by Sophie McQuain on 3/28/21.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State var pushActive = false
    
    var body: some View {
        VStack{
            Color.blue.ignoresSafeArea().overlay(
            VStack{
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Spacer()
                TextField("Email", text: $email)
                    .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                TextField("Password", text: $password)
                    .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                Spacer()
                
                Button("Login") {
                    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                            if error != nil {
                                    print(error?.localizedDescription ?? "")
                            } else {
                                self.pushActive = true
                                print("handleSuccessfullLogin")
                            }
                }
                }
                .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.orange/*@END_MENU_TOKEN@*/)
                Button("Create Account") {
                    
                }
                .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.orange/*@END_MENU_TOKEN@*/)
                Spacer()
                
                NavigationLink(destination: MainLanding(), isActive: $pushActive) {
                    EmptyView()
                  }.hidden()
            }
        )
        
        
        
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
