//
//  Position.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 05.03.2023.
//

import Foundation
import FirebaseFirestore

struct Position : Identifiable {
    
    var id : String
    var product : Product
    var count : Int
    var cost : Int {
        
        return product.price * self.count
        
    }
    
    var representation: [String : Any] {
        
        var repres = [String : Any]()
        
        repres["id"] = id
        repres["count"] = count
        repres["title"] = product.title
        repres["price"] = product.price
        repres["cost"] = cost
        
        
        return repres
    }
    
    internal init(id: String, product: Product, count: Int) {
        self.id = id
        self.product = product
        self.count = count
    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        
        guard let id = data["id"] as? String else { return nil }
        guard let title = data["title"] as? String else { return nil }
        guard let price = data["price"] as? Int else { return nil }
        let product: Product = Product(id: "", title: title, imageUrl: "", price: price, information: "")
        guard let count = data["count"] as? Int else { return nil }

        self.id = id
        self.product = product
        self.count = count
    }
    
}
