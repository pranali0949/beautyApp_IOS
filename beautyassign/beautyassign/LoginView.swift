import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoginSuccessful: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        NavigationStack {
            ZStack {
                // Background Image
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                // Main Content
                VStack {
                    Spacer()
                    
                    VStack(spacing: 20) {
                        Text("Login")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.pink)
                        
                        // Email Field
                        TextField("Email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(30)
                            .background(Color.white)
                            .cornerRadius(3)
                        
                        // Password Field
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(30)
                            .background(Color.white)
                            .cornerRadius(3)
                        
                        // Login Button
                        Button(action: login) {
                            Text("Login")
                                .frame(maxWidth: 150)
                                .padding()
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .font(.headline)
                                .cornerRadius(5)
                        }
                        
                        // Signup Button with NavigationLink
                        NavigationLink("Sign Up", value: "signUp")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.red)
                            .background(Color.white)
                            .cornerRadius(5)
                    }
                    .padding([.horizontal], 30)
                    .padding([.vertical], 20)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    
                    Spacer()
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
                .navigationDestination(for: String.self) { value in
                    if value == "signUp" {
                        ContentView()
                    }
                }
                .navigationDestination(isPresented: $isLoginSuccessful) {
                    HomeView()
                }
            }
        }
    }

    private func login() {
        guard !email.isEmpty, !password.isEmpty else {
            alertMessage = "Please enter both email and password"
            showAlert = true
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                alertMessage = "Error: \(error.localizedDescription)"
                showAlert = true
            } else {
                isLoginSuccessful = true
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
