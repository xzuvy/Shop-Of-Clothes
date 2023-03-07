//
//  PositionCell.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 07.03.2023.
//

import SwiftUI

struct PositionCell: View {
    
    let position : Position
    
    var body: some View {
        HStack {
            Text(position.product.title)
                .fontWeight(.bold)
            Spacer()
            Text("\(position.count) шт.")
            
            Text("\(position.cost) BYN")
                .frame(width: 78)
        }
        .padding(.horizontal)
    }
}

struct PositionCell_Previews: PreviewProvider {
    static var previews: some View {
        PositionCell(position: Position(id: UUID().uuidString,
                                        product: Product(id: UUID().uuidString,
                                                         title: "Nike AirForce 1 Low",
                                                         imageUrl: "airforceLow1",
                                                         price: 243,
                                                         information: "CLassic"),
                                                            count: 1))
    }
}
