//
//  RegisterViewModel.swift
//  FitQuest_V1
//
//  Created by Sophie McQuain on 3/28/21.
//

import Foundation
import Firebase

class RegisterViewModel: ObservableObject {
    
    var email: String = ""
    var password: String = ""
    
    func register(completion: @escaping () -> Void){
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print(error.localizedDescription)
            } else{
                completion()
            }
        }
    }
    
}
