

import SwiftUI
import Firebase


struct ContentView: View {
    
    @AppStorage("log_Status") var status = false
    @StateObject var model = ModelData()
    
    var body: some View {
        
        NavigationView {
            
            if status {
                
                VStack(spacing: 25) {
                    
//                    Text("Logged In As \(Auth.auth().currentUser?.email ?? "")")
                    
                    TabBarView()
                    
//                    Button(action: model.logOut , label: {
//                        Text("LogOut")
//                            .fontWeight(.bold)
//                    })
                }
            }
            else {
                
                LoginView(model: model)
            }
        }
        
     
        
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

    
struct LoginView : View {
    
    @ObservedObject var model : ModelData
    
    var body: some View  {
        
        ZStack {
            
            VStack{
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                ZStack {
                    
                    if UIScreen.main.bounds.height < 750 {
                        
                        Image("logo")
                            .resizable()
                            .frame(width: 130, height: 130)
                    }
                    else {
                        Image("logo")
                    }
                }
                    .padding(.horizontal)
                    .padding(.vertical,20)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(30)
                    .padding(.top)
                
                VStack(spacing:4) {
                    HStack(spacing: 0){
//                        Text("Edu")
//                            .font(.system(size: 35, weight: .heavy))
//                            .foregroundColor(.black)
//                        Text("Cake")
//                            .font(.system(size: 35, weight: .heavy))
//                            .foregroundColor(.blue)
                        Text("EduCake")
                            .font(.system(size: 50, weight: .heavy))
                            .foregroundColor(Color.init(red: 0.024, green: 0.114, blue: 0.22))
                    }
                    
                    Text("learning is a piece of cake")
                        .foregroundColor(Color.gray.opacity(0.7))
                        .fontWeight(.bold)
                }
                .padding(.top)
                    
                VStack(spacing: 20) {
                    
                    CustomTextField(image: "person", placeHolder: "Email", txt: $model.email)
                    
                    CustomTextField(image: "lock", placeHolder: "Password", txt: $model.password)
                }
                .padding(.top)
                
                Button(action: model.login) {
                    
                    Text("LOGIN")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.init(red: 0.024, green: 0.114, blue: 0.22))
                        .clipShape(Capsule())
                }
                .padding(.top,22)
                
                HStack(spacing: 12) {
                    
                    Text("Don't have an account?")
                        .foregroundColor(Color.black.opacity(0.7))
                    
                    Button(action: {model.isSignUp.toggle()}) {
                        
                        Text("Sign Up Now")
                            .fontWeight(.bold)
                            .foregroundColor(Color.init(red: 0.024, green: 0.114, blue: 0.22))
                    }
                }
                .padding(.top,25)
                
                Spacer(minLength: 0)
                
                Button(action: model.resetPassword) {
                    
                    Text("Forget Password")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .padding(.vertical,22)
                    

            }
            
            if model.isLoading {
                
                LoadingView()
            }
        }
                
//        .background(LinearGradient(gradient: .init(colors: [Color.white.opacity(0.2),Color.blue]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all, edges: .all))
        .background(Color.white)
        .fullScreenCover(isPresented: $model.isSignUp){
            
            SignUpView(model: model)
        }
//        Alerts...
        .alert(isPresented: $model.alert, content: {
            
            Alert(title: Text("Message"), message: Text(model.alertMsg), dismissButton: .destructive(Text("OK")))
        })
//        .alert(isPresented: $model.isLinkSend) {
//
//            Alert(title: Text("Message"), message: Text("Password Reset Link Has Been Sent"), dismissButton: .destructive(Text("OK")))
//        }
    }
}

struct CustomTextField : View {

    var image : String
    var placeHolder : String
    @Binding var txt : String

    var body: some View {
        

        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {

            Image(systemName: image)
                .font(.system(size: 24))
                .foregroundColor(Color.secondary)
                .frame(width: 60, height: 60)
                .background(Color.init(red: 0.024, green: 0.114, blue: 0.22))
                .clipShape(Circle())
            
            ZStack {
                
                if placeHolder == "Password" || placeHolder == "Re-Enter"{
                    SecureField(placeHolder, text: $txt)
                        .foregroundColor(.black)
                }
                else {
                    TextField(placeHolder, text: $txt)
                        .foregroundColor(.black)
                }
            }
                .padding(.horizontal)
                .padding(.leading,65)
                .frame(height: 60)
                .background(Color.black.opacity(0.1))
                .clipShape(Capsule())
        }
        .padding(.horizontal)
    }
}

struct SignUpView : View {
    
    @ObservedObject var model : ModelData
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
            
            VStack{
            
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                Image("logo")
                    .padding(.horizontal)
                    .padding(.vertical,20)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(30)
                
                VStack(spacing:4) {
                    HStack(spacing: 0){
//                        Text("New")
//                            .font(.system(size: 35, weight: .heavy))
//                            .foregroundColor(.black)
//                        Text("Profile")
//                            .font(.system(size: 35, weight: .heavy))
//                            .foregroundColor(.blue)
                        
                        Text("NewProfile")
                            .font(.system(size: 35, weight: .heavy))
                            .foregroundColor(Color.init(red: 0.024, green: 0.114, blue: 0.22))
                    }
                    
                    
                    Text("create your own profile")
                        .foregroundColor(Color.black.opacity(0.3))
                        .fontWeight(.heavy)
                }
                .padding(.top)

                    
                VStack(spacing: 20) {
                    
                    CustomTextField(image: "person", placeHolder: "Email", txt: $model.email_SignUp)
                    
                    CustomTextField(image: "lock", placeHolder: "Password", txt: $model.password_SignUp)
                    CustomTextField(image: "lock", placeHolder: "Re-Enter", txt: $model.reEnterPassword)
                }
                .padding(.top)

                
                Button(action: model.signUp) {
                    
                    Text("SIGN UP")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.init(red: 0.024, green: 0.114, blue: 0.22))
                        .clipShape(Capsule())
                }
                .padding(.vertical,22)
                
                Spacer(minLength: 0)
            }
            .background(Color.white)
            
            Button(action: {model.isSignUp.toggle()}) {
                
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.6))
                    .clipShape(Circle())
            }
            .padding(.trailing)
            .padding(.top,10)
            
            if model.isLoading {
                
                LoadingView()
            }
        })
        .background(LinearGradient(gradient: .init(colors: [Color("top"),Color("bottom")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all, edges: .all))
        
//        Alerts
        .alert(isPresented: $model.alert, content: {
            Alert(title: Text("Message"), message: Text(model.alertMsg), dismissButton: .destructive(Text("OK"), action: {
                
//               if email link sent means closing the signupView...
                
                if model.alertMsg == "Email Verification Has Been Sent\n Verify Your Email ID" {
                    
                    model.isSignUp.toggle()
                    model.email_SignUp = ""
                    model.password_SignUp = ""
                    model.reEnterPassword = ""
                }
            }))
        })
    }
}

// MVVM Model...
class ModelData : ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var isSignUp = false
    @Published var email_SignUp = ""
    @Published var password_SignUp = ""
    @Published var reEnterPassword = ""
    @Published var isLinkSend = false
//    AlertView With TextFields
    
//    Error Alerts...
    
    @Published var alert = false
    @Published var alertMsg = ""
    
//    User Status
    @AppStorage("log_Status") var status = false
    
    
//    Loading...
    
    @Published var isLoading = false
    func resetPassword() {
        
        let alert = UIAlertController(title: "Reset Password", message: "Enter Your E-Mail ID To Reset Your Password", preferredStyle: .alert)
        
        alert.addTextField { (password) in
            password.placeholder = "Email"
        }
        
        let proceed = UIAlertAction(title: "Reset", style: .default) { (_) in
            
//      Sending Password Link...
            
            if alert.textFields![0].text! != "" {
                
                withAnimation {
                    
                    self.isLoading.toggle()
                }
                
                Auth.auth().sendPasswordReset(withEmail: alert.textFields![0].text!) { (err) in
                    
                    withAnimation {
                        
                        self.isLoading.toggle()
                    }
                    
                    if err != nil {
                        self.alertMsg = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                    
//                    Alerting User...
                    self.alertMsg = "Password Reset Link Has Been Sent"
                    self.alert.toggle()
                }
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(proceed)
        
//        Presenting...
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated:true)
    }
    
//    Login...
    func login() {
        
//        checking all fields are inputted corctly...
        
        if email == "" || password == "" {
            
            self.alertMsg = "Fill the contents properly"
            self.alert.toggle()
            return
        }
        
        withAnimation {
            
            self.isLoading.toggle()
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
            
            withAnimation {
                
                self.isLoading.toggle()
            }

            if err != nil {
                
                self.alertMsg = err!.localizedDescription
                self.alert.toggle()
                return
            }
            
//            checking if user is verified or not...
//            if not verified means logging out...
            
            let user = Auth.auth().currentUser
            
            if !user!.isEmailVerified {
                
                self.alertMsg = "Please Verify Email Address"
                self.alert.toggle()
                
//              logging out...
                try! Auth.auth().signOut()
                
                return
            }
            
//            setting user status as true...
            
            withAnimation {
                
                self.status = true
            }
//            TabBarView()
        }
    }
    
//    SignUp..
    
    func signUp() {
        
//        checking...
        
        if email_SignUp == "" || password_SignUp == "" || reEnterPassword == "" {
            
            self.alertMsg = "Fill contents properly"
            self.alert.toggle()
            return
        }
        
        if password_SignUp != reEnterPassword {
            
            self.alertMsg = "Password Mismatch"
            self.alert.toggle()
            return
        }
        
        withAnimation {
            self.isLoading.toggle()
        }
        
        Auth.auth().createUser(withEmail: email_SignUp, password: password) {
            (result, err) in
            
            withAnimation {
                self.isLoading.toggle()
            }
            
            if err != nil {
                self.alertMsg = err!.localizedDescription
                self.alert.toggle()
                return
            }
            
//            sending Verifacation Link...
            
            result?.user.sendEmailVerification(completion: { (err) in
                
                if err != nil {
                    self.alertMsg = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
//                Alerting User To Verify Email...
                
                self.alertMsg = "Email Verification Has Been Sent\n Verify Your Email ID"
                self.alert.toggle()
            })
        }
    }
    
//    log Out...
    
    func logOut() {
        
        try! Auth.auth().signOut()
        
        withAnimation {
            
            self.status = false
        }
        
//        clearing all data...
        
        email = ""
        password = ""
        email_SignUp = ""
        password_SignUp = ""
        reEnterPassword = ""
    }
}
    

// Loading View...

struct LoadingView : View {
    
    @State var animation = false
    var body: some View {
        
        VStack {
            
            Circle()
                .trim(from: 0, to : 0.7)
                .stroke(Color(.blue),lineWidth: 7)
                .frame(width: 75, height: 75)
                .rotationEffect(.init(degrees: animation ? 350 : 0))
                .padding(50)
        }
        .background(Color.white)
        .cornerRadius(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.4).ignoresSafeArea(.all, edges: .all))
        .onAppear(perform: {
            
            withAnimation(Animation.linear(duration: 1)) {
                
                animation.toggle()
            }
        })
    }
    
}

