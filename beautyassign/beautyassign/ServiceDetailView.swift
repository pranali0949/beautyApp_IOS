//
//  ServiceDetailView.swift
//  beautyassign
//
//  Created by LAKMA on 2024-07-26.
//

import SwiftUI

struct ServiceDetailView: View {
    let category: BeautyTreatment
      
      var body: some View {
          VStack {
              Text("\(category.name) Services")
                  .font(.largeTitle)
                  .padding()
              
              List(category.services, id: \.self) { service in
                  Text(service)
              }
          }
          .navigationTitle(category.name)
      }
  }

  struct ServiceDetailView_Previews: PreviewProvider {
      static var previews: some View {
          ServiceDetailView(category: BeautyTreatment(name: "Hair Cut", services: ["Hair Cut A", "Hair Cut B", "Hair Cut C"]))
      }
  }
