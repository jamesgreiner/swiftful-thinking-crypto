//
//  SettingsView.swift
//  SwiftfulThinking-Crypto
//
//  Created by James Greiner on 5/16/23.
//

import SwiftUI

struct SettingsView: View {
    
    private let defaultURL = URL(string: "https://www.google.com")!
    private let youtubeURL = URL(string: "https://www.youtube.com/c/switfulthinking")!
    private let coffeeURL = URL(string: "https://www.buymeacoffee.com/nicksarno")!
    private let coinGeckoURL = URL(string: "https://www.coingecko.com")!
    private let personalURL = URL(string: "https://www.github.com/jamesgreiner")!
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background layer
                Color.theme.background
                    .ignoresSafeArea()
                // Content layer
                List {
                    swiftfulThinkingSection
                        .listRowBackground(.theme.background.opacity(0.5))
                    coinGeckoSection
                        .listRowBackground(.theme.background.opacity(0.5))
                    developerSection
                        .listRowBackground(.theme.background.opacity(0.5))
                    applicationSection
                        .listRowBackground(.theme.background.opacity(0.5))
                }
            }
            .tint(.blue)
            .font(.headline)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    private var swiftfulThinkingSection: some View {
        Section(header: Text("Swiftful Thinking")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made by following a @SwiftfulThinking course on YouTube. It uses MVVM architecture, Combine, and CoreData!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            .padding(.vertical)
            
            Link("Subscribe on YouTube! 🥳", destination: youtubeURL)
            Link("Support his coffee addiction! ☕️", destination: coffeeURL)

        }
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that was used in this app comes from a free API from CoinGecko! Prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            .padding(.vertical)
            
            Link("Visit CoinGecko! 🥳", destination: coinGeckoURL)
        }
    }
    
    private var developerSection: some View {
        Section(header: Text("Developer")) {
            VStack(alignment: .leading) {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was developed by James Greiner. It is written in 100% Swift using SwiftUI. The project benefits from multipthreading, publishers/subscribers, and data persistence.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            .padding(.vertical)
            
            Link("My GitHub ->", destination: personalURL)
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("Application")) {
            
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn More", destination: defaultURL)
        }
    }
}
