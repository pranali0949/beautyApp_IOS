//
//  Product.swift
//  beautyassign
//
//  Created by LAKMA on 2024-07-26.
//

import Foundation

struct Product: Identifiable {
    let id = UUID() // Unique identifier
    let name: String
    let price: Double
    let imageName: String
}
