//
//  CartViewModel.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 05.03.2023.
//

import Foundation

class CartViewModel : ObservableObject {
    
   @Published var positions = [Position]()
    
    func addPosition(_ position: Position) {
        self.positions.append(position)
    }
    
}
