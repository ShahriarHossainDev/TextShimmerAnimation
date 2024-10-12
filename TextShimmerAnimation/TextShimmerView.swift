//
//  TextShimmerView.swift
//  TextShimmerAnimation
//
//  Created by Shishir_Mac on 12/10/24.
//

import SwiftUI

struct TextShimmerView: View {
    
    var text: String
    @State var animation = false
    @Binding var multiColor : Bool
    
    var body: some View {
        ZStack {
            Text(text)
                .font(.system(size: 75, weight: .bold))
                .foregroundColor(Color.white.opacity(0.25))
            
            HStack(spacing: 0) {
                ForEach(0..<text.count, id: \.self) { index in
                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                        .font(.system(size: 75, weight: .bold))
                        .foregroundColor(multiColor ? .random : .white)
                }
            }
            .mask (
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: .init(colors: [Color.white.opacity(0.5),
                                                     Color.white,
                                                     Color.white.opacity(0.5) ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .rotationEffect(.init(degrees: 70))
                    .padding(20)
                    .offset(x: -250)
                    .offset(x: animation ? 500 : 0)
            )
            .onAppear {
                withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
                    animation.toggle()
                }
            }
        }
    }
}

struct TextShimmerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    static var random: Color {
        let color = UIColor(red: CGFloat.random(in: 0...1),
                            green: CGFloat.random(in: 0...1),
                            blue: CGFloat.random(in: 0...1),
                            alpha: 1)
        return Color(color)
    }
}
