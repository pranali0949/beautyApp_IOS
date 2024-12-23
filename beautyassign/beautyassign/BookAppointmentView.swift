import SwiftUI
import Firebase
import FirebaseFirestore

struct BookAppointmentView: View {
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State private var selectedService = "Waxing"
    @State private var services = ["Waxing", "Hair Cut", "Body Spa", "Facial", "Manicure", "Pedicure"]
    @State private var showingAlert = false
    @State private var alertMessage: String = ""

    // Firestore reference
    private var db = Firestore.firestore()

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Select Date and Time")) {
                        DatePicker("Date", selection: $selectedDate, displayedComponents: [.date])
                            .datePickerStyle(GraphicalDatePickerStyle())
                        
                        DatePicker("Time", selection: $selectedTime, displayedComponents: [.hourAndMinute])
                            .datePickerStyle(WheelDatePickerStyle())
                    }
                    
                    Section(header: Text("Select Service")) {
                        Picker("Service", selection: $selectedService) {
                            ForEach(services, id: \.self) { service in
                                Text(service).tag(service)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                    }
                    
                    Section {
                        Button(action: submitAppointment) {
                            HStack {
                                Spacer()
                                Text("Submit")
                                    .fontWeight(.bold)
                                Spacer()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                .navigationTitle("Book Appointment")
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Appointment Booked"),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
    }

    private func submitAppointment() {
        // Prepare data for Firestore
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        let formattedDate = dateFormatter.string(from: selectedDate)
        let formattedTime = dateFormatter.string(from: selectedTime)
        let service = selectedService
        
        // Data to send
        let appointmentData: [String: Any] = [
            "date": formattedDate,
            "time": formattedTime,
            "service": service
        ]
        
        // Generate a unique ID for the appointment
        let appointmentID = UUID().uuidString
        
        // Add data to Firestore
        db.collection("appointments").document(appointmentID).setData(appointmentData) { error in
            if let error = error {
                alertMessage = "Failed to book appointment: \(error.localizedDescription)"
            } else {
                alertMessage = "Your appointment is booked for \(formattedDate) at \(formattedTime) for \(service)."
            }
            showingAlert = true
        }
    }
}

struct BookAppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        BookAppointmentView()
    }
}
