//
//  ViewsAndModifiersApp.swift
//  ViewsAndModifiers
//
//  Created by Jose Flavio Quispe on 31/03/21.
//

import SwiftUI

@main
struct ViewsAndModifiersApp: App {
    let users = [
        User(id: 1, name: "jose"),
        User(id: 2, name: "tisting"),
        User(id: 3, name: "testing"),
        User(id: 4, name: "flavio"),
        User(id: 5, name: "tusting")
    ]
    
    var body: some Scene {
        WindowGroup {
            AdvancedGridStack(columns: 3, items: users, content: { index, item in
                Text(item.name)
            })
        }
    }
}
