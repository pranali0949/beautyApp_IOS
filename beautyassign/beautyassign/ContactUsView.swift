import SwiftUI

struct ContactUsView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var message: String = ""
    @State private var showingAlert = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
               
                Form {
        
                    Section(header: Text("Contact Information").padding(.bottom, 20)) {
                        TextField("Name", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                        
                        TextEditor(text: $message)
                            .frame(height: 150)
                            .border(Color.gray, width: 1)
                            .padding(.top, 10)
                    }
                    
                    Section {
                        Button(action: sendMessage) {
                            HStack {
                                Spacer()
                                Text("Send")
                                    .fontWeight(.bold)
                                Spacer()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                .navigationTitle("Contact Us")
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Message Sent"),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
            .padding()
        }
    }
    
    private func sendMessage() {
       
        if name.isEmpty || email.isEmpty || message.isEmpty {
            alertMessage = "Please fill out all fields."
        } else {
            alertMessage = "Your message has been sent. Thank you for contacting us!"
        }
        showingAlert = true
    }
}

struct ContactUsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsView()
    }
}
