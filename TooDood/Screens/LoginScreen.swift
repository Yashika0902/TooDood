
import SwiftUI

struct LoginScreen: View {
    @State var mail:String = ""
    @State var password:String = ""
    @State var isLoggedIn:Bool = false
    @State var showWarning:Bool = false
    var body: some View {
        NavigationStack {
            VStack{
                
                //logo image
                Spacer().frame(height: 70)
                Image("logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                Spacer().frame(height: 10)
                
                //login text
                Text("Login Here!")
                    .font(.title)
                    .fontWeight(.bold)
                
                //login field
                TextField("Email", text: $mail)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal)
                //password field
                
                SecureField("Password", text: $password)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .padding()
                
                //login button
                Button(action: {
                    //action to do
                    if mail == "Admin@gmail.com" && password == "123456"{
                        isLoggedIn = true
                    }
                    else {
                        showWarning = true
                    }
                }){
                    //content of button
                    Text("Login")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 40)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                .alert(isPresented: $showWarning){
                    Alert(title: Text("Warning"), message: Text("Invalid Credentials"), dismissButton: .default(Text("OK")))
                }
                Spacer()
                
            }
            .navigationDestination(isPresented: $isLoggedIn){
                ListScreen()
            }
        }
    }
}

#Preview {
    LoginScreen()
}
