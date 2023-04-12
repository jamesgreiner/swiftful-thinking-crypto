//
//  SwiftfulThinking_CryptoApp.swift
//  SwiftfulThinking-Crypto
//
//  Created by James Greiner on 4/10/23.
//

import SwiftUI

@main
struct SwiftfulThinkingCryptoApp: App {
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
