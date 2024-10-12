//
//  ContentView.swift
//  TextShimmerAnimation
//
//  Created by Shishir_Mac on 12/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var multiColor = false
    
    var body: some View {
        VStack {
            TextShimmerView(text: "Welcome", multiColor: $multiColor)
            TextShimmerView(text: "To Home", multiColor: $multiColor)
            
            Toggle(isOn: $multiColor, label: {
                Text("Enable MultiColors")
                    .font(.title2)
                    .fontWeight(.bold)
            })
                .padding()
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
