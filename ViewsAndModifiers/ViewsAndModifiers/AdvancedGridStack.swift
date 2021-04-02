//
//  AdvancedGridStack.swift
//  ViewsAndModifiers
//
//  Created by Jose Flavio Quispe on 1/04/21.
//

import SwiftUI

struct AdvancedGridStack<Content:View, Element: Identifiable>: View {
    let columns: Int
    let items: [Element]
    let content: (Int, Element) -> Content
    
    @State private var index: Int = 0
    
    var body: some View {
        VStack {
            ForEach(0 ..< Int(Double(items.count/columns).rounded(.up)), id: \.self) { i in
                HStack {
                    ForEach(0 ..< columns, id: \.self) { j in
                        self.makeView(index: index, item: items[index])
                    }
                }
            }
        }
    }
    
    func makeView(index: Int, item: Element) -> Content {
        self.index += 1
        return self.content(index, item)
    }
    
}

struct AdvancedGridStack_Previews: PreviewProvider {
    
    static let users = [
        User(id: 1, name: "jose"),
        User(id: 2, name: "tisting"),
        User(id: 3, name: "testing"),
        User(id: 4, name: "flavio"),
        User(id: 5, name: "tusting")
    ]
    
    static var previews: some View {
        AdvancedGridStack(columns: 3, items: users, content: { index, item in
            Text(item.name)
        })
    }
}

struct User : Identifiable, Hashable {
    var id: Int
    var name: String
}
