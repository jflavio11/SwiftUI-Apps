//
//  GridStack.swift
//  ViewsAndModifiers
//
//  Created by Jose Flavio Quispe on 1/04/21.
//

import SwiftUI

struct GridStack<Content: View>: View {
    
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
    
    // @ViewBuilder is a custom parameter attribute that constructs views from closures.
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

struct GridStack_Previews: PreviewProvider {
    static var previews: some View {
        GridStack(rows: 2, columns: 3, content: { row, column in
            Text("Hello! \(row)x\(column)")
                .padding(5)
                .background(Color.red)
        })
    }
}
