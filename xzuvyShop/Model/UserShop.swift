//
//  User.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 09.03.2023.
//

import Foundation

struct UserShop : Identifiable {
    
    var id : String = UUID().uuidString
    var name : String
    var number : Int
    var adress : String
    
    var representation: [String : Any] {
        var repres = [String : Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["number"] = self.number
        repres["adress"] = self.adress
        return repres
    }
//
//    "id": user.id,
//    "name": user.name,
//    "number": user.number,
//    "adress": user.adress ])

    
}
