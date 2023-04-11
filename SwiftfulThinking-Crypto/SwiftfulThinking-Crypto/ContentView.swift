//
//  ContentView.swift
//  SwiftfulThinking-Crypto
//
//  Created by James Greiner on 4/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack{
                Text("Accent")
                    .foregroundColor(Color.theme.accent)
                
                Text("Red")
                    .foregroundColor(Color.theme.red)
                
                Text("Green")
                    .foregroundColor(Color.theme.green)

                Text("Secondary Text")
                    .foregroundColor(Color.theme.secondaryText)

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
