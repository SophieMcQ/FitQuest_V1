//
//  Settings.swift
//  FitQuest_V1
//
//  Created by Sophie McQuain on 3/25/21.
//

import SwiftUI

struct Settings: View {
    
    @EnvironmentObject var user : User
    @State var pushActive = false
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Settings")
                Spacer()
                Button("Log Out"){
                    user.logOut()
                    pushActive = true
                }
                
                Button("Delete Account"){
                    user.deleteAccount()
                    pushActive = true
                }
                Spacer()
                NavigationLink(destination: LoginView().navigationBarHidden(true), isActive: $pushActive) {
                    EmptyView()
                }.hidden()
                
            }
            
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
