import SwiftUI

struct MenProductsView: View {

    let products: [Product] = [
        Product(name: "Beard Oil", price: 24.99, imageName: "beard_oil"),
        Product(name: "Shaving Cream", price: 19.99, imageName: "shaving_cream"),
        Product(name: "Face Wash", price: 21.99, imageName: "face_wash"),
        Product(name: "Hair Gel", price: 15.99, imageName: "hair_gel"),
        Product(name: "Moisturizer", price: 29.99, imageName: "moisturizermen")
    ]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(products) { product in
                        VStack {
                            Image(product.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150) // Adjust size as needed
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text(product.name)
                                .font(.headline)
                                .padding(.top, 5)
                            
                            Text(String(format: "$%.2f", product.price))
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
            .navigationTitle("Men's Skin & Hair Care")
        }
    }
}

struct MenProductsView_Previews: PreviewProvider {
    static var previews: some View {
        MenProductsView()
    }
}
