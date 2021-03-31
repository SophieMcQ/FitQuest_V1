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
                        
                        //creates user authentication
                        Auth.auth().createUser(withEmail: email, password: password){ (result, error) in
                            if error != nil {
                                errorMessage = "Enter valid email and password";
                            } else {
                                self.pushActive = true
                                
                                //Sets UserDefaults to the user's email for easier login
                                UserDefaults.standard.setValue(email, forKey: "email")
                                UserDefaults.standard.setValue(name, forKey: "name")

                            }
                        }
                    
                    }
                    
                }
                .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.orange/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                NavigationLink(destination: RegistrationMetrics(), isActive: $pushActive) {
                    EmptyView()
                }.hidden().background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.orange/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
