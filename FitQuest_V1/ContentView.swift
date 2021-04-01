import SwiftUI
import CoreLocation



// Your starting view
struct ContentView: View {

    let user = User()
    var body: some View {
        
        LoginView().environmentObject(user)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
