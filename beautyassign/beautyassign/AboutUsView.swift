import SwiftUI

struct AboutUsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
            
                    Text("About Us")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 20)
                        .padding(20)
                   
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Our Mission")
                            .font(.title2)
                            .bold()
                        
                        Text("At Fashion & Style Parlor, we are dedicated to enhancing your beauty and confidence through high-quality and personalized beauty treatments. Our team of skilled professionals is committed to providing exceptional service and creating a welcoming environment for all our clients.")
                            .font(.body)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.horizontal)
                   
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Meet Our Team")
                            .font(.title2)
                            .bold()
                        
                        Text("Our team consists of experienced and certified beauty experts who are passionate about their work. From skilled hairdressers to professional estheticians, each member of our team is dedicated to delivering top-notch services and ensuring a great experience for our clients.")
                            .font(.body)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.horizontal)
                    
                    // Working Hours
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Working Hours")
                            .font(.title2)
                            .bold()
                        
                        Text("Monday - Friday: 9:00 AM - 7:00 PM\nSaturday: 10:00 AM - 5:00 PM\nSunday: Closed")
                            .font(.body)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.horizontal)
                    
                    // Location
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Location")
                            .font(.title2)
                            .bold()
                        
                        Text("123 Fashion Street, Style City, FL 12345\nPhone: (123) 456-7890\nEmail: contact@fashionstyleparlor.com")
                            .font(.body)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.horizontal)
                    
                    // Map 
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Find Us Here")
                            .font(.title2)
                            .bold()
                        
                        Text("Here.")
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.blue)
                    }
                    .padding(.horizontal)
                    
                }
                .padding(.bottom, 20)
            }
            .navigationTitle("About Us")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
