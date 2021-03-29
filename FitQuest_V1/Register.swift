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
    
    let d = Firestore.firestore()
    
    var ref: DocumentReference? = nil
    
    
    var body: some View {
        
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
                        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                            if error != nil {
                                errorMessage = error.debugDescription
                            } else {
                                var ref: DocumentReference? = nil
                                ref = d.collection("users").addDocument(data: [
                                    "name": name,
                                    "email": email,
                                    "password": password,
                                ]) { err in
                                    if let err = err {
                                        print("Error adding document: \(err)")
                                    } else {
                                        print("Document added with ID: \(ref!.documentID)")
                                    }
                                    
                                    
                                }
                                self.pushActive = true
                                print("User Added")
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

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
