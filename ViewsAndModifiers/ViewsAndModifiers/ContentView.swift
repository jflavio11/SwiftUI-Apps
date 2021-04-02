//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jose Flavio Quispe on 31/03/21.
//

import SwiftUI

struct Watermark : ViewModifier {
    
    let title: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(title)
                .font(.caption)
                .padding(5)
                .foregroundColor(.white)
                .background(Color.blue)
        }
    }
}

extension View {
    func watermark(text: String) -> some View {
        self.modifier(Watermark(title: text))
    }
}

struct ContentView: View {
    var body: some View {
        Color.red
            .frame(width: 300, height: 300)
            .watermark(text: "@jflavio11")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
