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
    @State private var errorMessage: String = ""
    @State var pushActive = false
    @State var loggedIn = UserDefaults.standard.bool(forKey: "email")
    
    
    var body: some View {
        VStack{
            
            NavigationView{
                
            
            Color.blue.ignoresSafeArea().overlay(
            VStack{
                Group{
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
                    Text(errorMessage)
                }
                Button("Login") {
                    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                            if error != nil {
                                errorMessage = "Invalid email or password";
                            } else {
                                self.pushActive = true
                                UserDefaults.standard.setValue(email, forKey: "email")
                                print("handleSuccessfullLogin")
                            }
                }
                }
                .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.orange/*@END_MENU_TOKEN@*/)
                
                NavigationLink(destination: MainLanding(), isActive: $pushActive) {
                    EmptyView()
                }.hidden()
                
                NavigationLink(destination: Register()) {
                    Text("New User")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.title2)
                }
                Spacer()
                
                }
                
            )
        
        }
    }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
