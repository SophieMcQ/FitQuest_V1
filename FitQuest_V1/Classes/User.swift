//
//  User.swift
//  FitQuest_V1
//
//  Created by Sophie McQuain on 3/31/21.
//

import Foundation
import SwiftUI
import Firebase

// The user class takes care of all database calls. No other classes should have access to the database
// IMPORTANT: THIS CLASS HOLDS ALL OF THE USER'S DATA. IF YOU NEED OT GET THE PLAYERS NAME, CONTACTS, METRICS, FRIENDS, ETC..., IT WILL BE FOUND HERE. THIS IS AN ENVIRONMENTAL OBJECT PRESENT ON ALL EXISTING PAGES

class User: ObservableObject{
    
    @Published var name = ""    // PLAYER NAME
    @Published var email = ""   // PLAYER EMAIL
    @Published var height = ""  // PLAYER HEIGHT
    @Published var weight = ""  // PLAYER WEIGHT
    @Published var age = ""     // PLAYER AGE
    @Published var gender = ""  // PLAYER GENDER (not sure if we will even use this)
    
    @Published var character = UserCharacter()      // User's character
    
    let d = Firestore.firestore()
    
    // Initialization method. Not important
    init()  {}
    
    // Sets the user data by referencing what is stored in the database. Only called at login or opening of the app.
    func setUser(email: String){
        self.email = email
        let docRef = d.collection("users").document(email)
        docRef.getDocument { (snapshot, err) in
            if let data = snapshot?.data() {
                self.name = data["name"] as! String
                self.height = data["height"] as! String
                self.weight = data["weight"] as! String
                self.age = data["age"] as! String
                self.gender = data["gender"] as! String
            } else {
                print("Couldn't find the document")
            }
        }
        
    }
    
    // Creates a new user in the database. Only called at registration.
    func newUser(email: String, name: String, height: String, weight: String, age: String, gender: String){
        d.collection("users").document(email).setData([
            "name": name,
            "height": height,
            "weight": weight,
            "age": age,
            "gender": gender
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("User Added")
            }
        }
        self.name = name
        self.email = email
        self.height = height
        self.weight = weight
        self.age = age
        self.gender = gender
    }
    
    
    // Changes value of user data
    //
    // String id = what piece of data to change (ex. "name", "age", "height")
    // String newVal = new value of the id (ex. new name)
    func changeValue(id: String, newVal: String){
        d.collection("users").document(email).setValue(newVal, forKey: id)
    }
    
    func toString(id: String) -> String{
        if(id == "name"){
            return name
        }
        if(id == "email"){
            return email
        }
        if(id == "height"){
            return height
        }
        if(id == "weight"){
            return weight
        }
        if(id == "age"){
            return age
        }
        if(id == "gender"){
            return gender
        }
        return ""
    }
    
    func logOut(){
        self.name = ""
        self.email = ""
        self.height = ""
        self.weight = ""
        self.age = ""
        self.gender = ""
    }
    
    //deletes the user from the database and authentication system
    func deleteAccount(){
        self.logOut()
        d.collection("users").document(self.email).delete()
        let user = Auth.auth().currentUser
        user?.delete { error in
            if error != nil {
            print("error deleting user")
          } else {
            print("user deleted")
          }
        }
    }
}
