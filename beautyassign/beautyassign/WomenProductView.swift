import SwiftUI

struct WomenProductView: View {
    // Sample data for products
    let products: [Product] = [
        Product(name: "Moisturizer", price: 29.99, imageName: "moisturizer"),
        Product(name: "Shampoo", price: 19.99, imageName: "shampoo"),
        Product(name: "Conditioner", price: 21.99, imageName: "conditioner"),
        Product(name: "Face Mask", price: 34.99, imageName: "face_mask"),
        Product(name: "Serum", price: 39.99, imageName: "serum")
    ]
    
    // Define grid layout
    let columns = [
        GridItem(.adaptive(minimum: 150)) // Adjust the minimum width of the grid items
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(products) { Product in
                        VStack {
                            Image(Product.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150) // Adjust size as needed
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text(Product.name)
                                .font(.headline)
                                .padding(.top, 5)
                            
                            Text(String(format: "$%.2f", Product.price))
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                }
                .padding()
            }
            .navigationTitle("Women's Skin & Hair Care")
        }
    }
}

struct WomenProductView_Previews: PreviewProvider {
    static var previews: some View {
        WomenProductView()
    }
}
