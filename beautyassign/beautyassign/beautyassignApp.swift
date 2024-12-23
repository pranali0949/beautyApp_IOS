//
//  beautyassignApp.swift
//  beautyassign
//
//  Created by LAKMA on 2024-07-26.
//

import SwiftUI
import Firebase

@main
struct beautyassignApp: App {
    
    // Initializer to configure Firebase
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

