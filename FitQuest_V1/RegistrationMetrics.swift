//
//  RegistrationMetrics.swift
//  FitQuest_V1
//
//  Created by Sophie McQuain on 3/28/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct RegistrationMetrics: View {
    
    @State var pushActive = false

    @State private var errorMessage: String = ""
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var age: String = ""
    @State private var gender: String = "Female"
    
    var genders = ["Female", "Male", "Other"]
    
    @EnvironmentObject var user : User
    
    let d = Firestore.firestore()
    
    var body: some View {
        
        NavigationView{
        VStack{
            Text("User Metrics")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            Group{
                Text("Weight (lb)")
                TextField("Weight", text: $weight)
                    .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                    .keyboardType(.decimalPad)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                Text("Height (in.)")
                TextField("Height", text: $height)
                    .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                    .keyboardType(.decimalPad)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                Text("Age")
                TextField("Age", text: $age)
                    .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                    .keyboardType(.decimalPad)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
            }
            
            
            Picker("Gender", selection: $gender) {
                            ForEach(genders, id: \.self) {
                                Text($0)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                            }
                    }
            
            Spacer()
            
            Text(errorMessage)
                .foregroundColor(Color.red)
            
            Button("Submit"){
                errorMessage = ""
                let validWeight = Double(weight);
                let validHeight = Double(height);
                let validAge = Double(age);
                
                if(validWeight==nil){
                    errorMessage += "Please enter valid weight \n"
                }
                if(validHeight==nil){
                    errorMessage += "Please enter valid height \n"
                }
                if(validAge==nil){
                    errorMessage += "Please enter valid age \n"
                }
                
                else{
                    //must be added later to database, nothing being done with this currently
                    print("success")
                    
                    Auth.auth().createUser(withEmail: UserDefaults.standard.string(forKey: "email") ?? "", password: UserDefaults.standard.string(forKey: "password") ?? "")
                    { (result, error) in
                            if error != nil {
                                print("Error creating user account")
                            } else {
                                print("userAdded")
                                user.newUser(email: UserDefaults.standard.string(forKey: "email") ?? "", name: UserDefaults.standard.string(forKey: "name") ?? "", height: height, weight: weight, age: age, gender: gender)
                                pushActive = true
                            }
                    }
                    
                }
            }
            NavigationLink(destination: MainLanding().environmentObject(user).navigationBarHidden(true), isActive: $pushActive) {
                EmptyView()
            }.hidden().background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.orange/*@END_MENU_TOKEN@*/)
            .frame(width: 150.0, height: 50.0)
            
            }   
        }
    }
}

struct RegistrationMetrics_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationMetrics()
    }
}
