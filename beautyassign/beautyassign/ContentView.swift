import SwiftUI
import Firebase

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var navigateToLogin: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                // Background Image
                Image("background") //
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                // Card Layout for Sign Up Form
                VStack {
                    Spacer()
                    
                    VStack(spacing: 20) {
                        Text("Sign Up")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.pink)
                            .padding(.top, 20)
                        
                        // Email Field
                        TextField("Email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(30)
                            .background(Color.white)
                            .cornerRadius(5)
                        
                        // Password Field
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(30)
                            .background(Color.white)
                            .cornerRadius(5)
                        
                        // Sign Up Button
                        Button(action: signUp) {
                            Text("Sign Up")
                                .frame(maxWidth: 150)
                                .padding()
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .font(.headline)
                                .cornerRadius(8)
                        }
                        
                        // Already have an account button
                        NavigationLink("Already have an account? Log in", destination: LoginView())
                            .font(.subheadline)
                            .foregroundColor(.blue)
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                        
                    }
                    .padding([.horizontal], 20)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    
                    Spacer()
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
                .background(
                    NavigationLink(destination: LoginView(), isActive: $navigateToLogin) {
                        EmptyView()
                    }
                )
            }
            .navigationTitle("Sign Up")
        }
    }

    private func signUp() {
        guard !email.isEmpty, !password.isEmpty else {
            alertMessage = "Please enter both email and password"
            showAlert = true
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                alertMessage = "Error: \(error.localizedDescription)"
                showAlert = true
            } else {
                // Navigate to LoginView after successful sign-up
                navigateToLogin = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
