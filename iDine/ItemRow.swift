//
//  MenuItem.swift
//  iDine
//
//  Created by Rajan Twanabashu on 9/23/19.
//  Copyright © 2019 Rajan Twanabashu. All rights reserved.
//

import SwiftUI

let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]

struct ItemRow: View {
    var item: MenuItem
    var body: some View {
        NavigationLink (destination: ItemDetail(item: item)) {
            HStack {
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                
                VStack(alignment: .leading) {
                    Text(item.name).font(.headline)
                    Text("$\(item.price)")
                }.layoutPriority(1)
                
                Spacer()
                
                ForEach(item.restrictions, id: \.self) { restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                    .background(colors[restriction, default: .black])
                        .foregroundColor(.white)
                    .clipShape(Circle())
                }
                
            }
        }
        
        
    }
}


struct ItemRow_Previews: PreviewProvider {
    
    static var previews: some View {
        ItemRow(item: MenuItem.example )
    }
}
