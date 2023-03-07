//
//  Position.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 05.03.2023.
//

import Foundation

struct Position : Identifiable {
    
    var id : String
    var product : Product
    var count : Int
    var cost : Int {
        
        return product.price * self.count
        
    }
    
}
