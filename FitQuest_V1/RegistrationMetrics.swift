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
    
    let d = Firestore.firestore()
    
    var body: some View {
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
                    
                    var ref: DocumentReference? = nil
                    ref = d.collection("users").addDocument(data: [
                        "weight": weight,
                        "height": height,
                        "age": age,
                        "gender": gender,
                        
                    ]) { err in
                        if let err = err {
                            print("Error adding document: \(err)")
                        } else {
                            print("Document added with ID: \(ref!.documentID)")
                        }
                    }
                    
                    pushActive = true
                }
            }
            NavigationLink(destination: MainLanding(), isActive: $pushActive) {
                EmptyView()
            }.hidden().background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.orange/*@END_MENU_TOKEN@*/)
            .frame(width: 150.0, height: 50.0)
            
        }
    }
}

struct RegistrationMetrics_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationMetrics()
    }
}
