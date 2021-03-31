import SwiftUI
import CoreLocation



// Your starting view
struct ContentView: View {

    @State var loggedIn = UserDefaults.standard.bool(forKey: "email")

    var body: some View {
        
        if !loggedIn {
            LoginView()
        } else {
            MainLanding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
