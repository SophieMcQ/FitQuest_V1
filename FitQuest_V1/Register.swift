//
//  Register.swift
//  FitQuest_V1
//
//  Created by Sophie McQuain on 3/28/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct Register: View {
    
    @State public var name: String = ""
    @State public var email: String = ""
    @State public var password: String = ""
    @State private var passwordCheck: String = ""
    @State private var errorMessage: String = ""
    
    let d = Firestore.firestore()
    @EnvironmentObject var user : User
    
    @State var pushActive = false
    static var userKey = ""
    
    
    var body: some View {
        NavigationView{
        VStack{
            Spacer()
            Group{
                Text("Register")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            
                Text("Name")
                TextField("Name", text: $name)
                    .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                
                Text("Email")
                TextField("Email", text: $email)
                    .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                
                Text("Password")
                TextField("Password", text: $password)
                    .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                Text("Confirm Password")
                TextField("Confirm Password", text: $passwordCheck)
                    .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
            }
            Group{
                Spacer()
                Text(errorMessage)
                Button ("Next"){
                    errorMessage = ""
                    if(password != passwordCheck){
                        errorMessage = "Passwords must be the same"
                    }
                    else {
                        let docRef = d.collection("users").document(email)
                        docRef.getDocument() { (document, error) in
                        if error != nil {
                            print(error?.localizedDescription ?? "")
                          }
                        else {
                            print("Valid email")
                            UserDefaults.standard.setValue(email, forKey: "email")
                            UserDefaults.standard.setValue(name, forKey: "name")
                            UserDefaults.standard.setValue(password, forKey: "password")
                            
                            self.pushActive = true
                          }
                        }
                    }
                    
                }
                    
                .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.orange/*@END_MENU_TOKEN@*/)
        }
                Spacer()
                
                NavigationLink(destination: RegistrationMetrics().environmentObject(user).navigationBarHidden(true), isActive: $pushActive) {
                    EmptyView()
                }.hidden().background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.orange/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }


struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
