//
//  ItemDetail.swift
//  iDine
//
//  Created by Rajan Twanabashu on 9/23/19.
//  Copyright © 2019 Rajan Twanabashu. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    
    @EnvironmentObject var order: Order
    
    var item: MenuItem
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
                
            }
            
            Text(item.description)
                .padding()
            Button("Order This"){
                self.order.add(item: self.item)
            }.font(.headline )
            
            Spacer()
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
        
    }
}

struct ItemDetail_Previews: PreviewProvider {
    
    static var order = Order()
    
    static var previews: some View {
        NavigationView{
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}
