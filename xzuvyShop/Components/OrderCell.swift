//
//  OrderCell.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 10.03.2023.
//

import SwiftUI

struct OrderCell: View {
    
    @State var order: Order = Order(userID: "", date: Date(), status: "Новый")
    
    var body: some View {
        
        HStack{
            Text("\(order.date)")
            Text("\(order.cost)")
                .bold()
                .frame(width: 90)
            Text("\(order.status)")
                .frame(width: 140)
                .foregroundColor(.green)
        }
        
    }
}

struct OrderCell_Previews: PreviewProvider {
    static var previews: some View {
        OrderCell()
    }
}
