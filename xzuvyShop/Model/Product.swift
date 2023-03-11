//
//  Product.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 05.03.2023.
//

import Foundation
import FirebaseFirestore

struct Product {
    
    
    var id: String
    var title: String
    var imageUrl: String = ""
    var price: Int
    var information: String
    
//    var ordersCount: Int
//    var isRecommend: Bool
    var representation: [String : Any] {
        var repres = [String : Any]()
        repres["id"] = self.id
        repres["title"] = self.title
        repres["price"] = self.price
        repres["information"] = self.information
        return repres
    }
    
    internal init(id: String = UUID().uuidString, title: String, imageUrl: String = "", price: Int, information: String) {
        self.id = id
        self.title = title
        self.imageUrl = imageUrl
        self.price = price
        self.information = information
    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        guard let id = data["id"] as? String else { return nil }
        guard let title = data["title"] as? String else { return nil}
        guard let price = data["price"] as? Int else { return nil }
        guard let information = data["information"] as? String else { return nil }

        self.id = id
        self.title = title
        self.information = information
        self.price = price
        
    }
    
}
