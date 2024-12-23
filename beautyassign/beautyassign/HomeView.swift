import SwiftUI

struct HomeView: View {
    let treatments: [BeautyTreatment] = [
        BeautyTreatment(name: "Waxing", services: ["Full body", "Only full Hand", "Half leg", "Full leg", "face wax"]),
        BeautyTreatment(name: "Hair Cut", services: ["Leyars Hair Cut", "V Shape Hair", "U Shape Hair", "Step Hair Cut"]),
        BeautyTreatment(name: "Facial", services: ["Gold Facial", "Fruit Facial", "Facial Chocolate", "Rice Pack", "Charcol Facial"]),
        BeautyTreatment(name: "Body Full Wax", services: ["Full BodyBean  Wax", "Full Body Cream Wax", "Full Body laser Wax", "Simple Wax"]),
        BeautyTreatment(name: "Manicure", services: ["Manicure Abc", "Manicure custome", "Manicure Gold"]),
        BeautyTreatment(name: "Boys Hair Cut", services: ["Boys Hair Cut A", "Boys Hair Cut B","Boys Cut","V Hair Cut"]),
        BeautyTreatment(name: "Pedicure", services: ["Pedicure xyz", "Pedicure B", "Pedicure pqr"])
    ]
    
    let advertisementImages: [String] = [
        "ad2",
        "ad1",
        "ad3"
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                // Swipeable Advertisement
                TabView {
                    ForEach(advertisementImages, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200) // Adjust height as needed
                            .clipped()
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(height: 200) // Adjust height as needed
                
                HStack(spacing: 20) {
                    NavigationLink(destination: WomenProductView()) {
                        VStack {
                            Image("women")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                            Text("Women")
                                .font(.caption)
                        }
                    }
                    
                    NavigationLink(destination: MenProductsView()) {
                        VStack {
                            Image("men")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                            Text("Men")
                                .font(.caption)
                        }
                    }
                }
                .padding()
                
                List(treatments) { category in
                    NavigationLink(destination: ServiceDetailView(category: category)) {
                        Text(category.name)
                    }
                }
            }
            .navigationTitle("Fashion & Style")
            .toolbar {
                // Toolbar Menu Button
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        NavigationLink(destination: AboutUsView()) {
                            Label("About Us", systemImage: "info.circle")
                        }
                        
                        NavigationLink(destination: ContactUsView()) {
                            Label("Contact Us", systemImage: "envelope")
                        }
                        
                        NavigationLink(destination: BookAppointmentView()) {
                            Label("Book Appointment", systemImage: "calendar")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .font(.title)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
