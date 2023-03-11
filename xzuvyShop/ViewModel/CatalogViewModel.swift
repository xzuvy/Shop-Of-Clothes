//
//  CatalogViewModel.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 05.03.2023.
//

import Foundation


class CatalogViewModel: ObservableObject {
    
    static let shared = CatalogViewModel()
    
    var popularProducts = [
        Product(id: "1",
                title: "Nike AirForce 1 Low",
                imageUrl: "Not found", price: 314,
                information: "Classic shoes nice haho"),
        
        Product(id: "2",
                title: "Nike AirForce 1 High",
                imageUrl: "Not found", price: 314,
                information: "Classic shoes"),
        
        Product(id: "3",
                title: "Jordan 4",
                imageUrl: "Not found", price: 527,
                information: "Jordans"),
        
        Product(id: "4",
                title: "NewBalance 574",
                imageUrl: "Not found", price: 255,
                information: "NB")
    ]
    
    @Published var allProducts = [
        
        Product(id: "5",
                title: "Nike AirForce 1 Low",
                imageUrl: "Not found", price: 314,
                information: "Classic shoes"),
        
        Product(id: "6",
                title: "Nike AirForce 1 High",
                imageUrl: "Not found", price: 314,
                information: "Classic shoes"),
        
        Product(id: "7",
                title: "Jordan 4",
                imageUrl: "Not found", price: 527,
                information: "Jordans"),
        
        Product(id: "8",
                title: "NewBalance 574",
                imageUrl: "Not found", price: 255,
                information: "NB")
    ]
    
    func getProducts() {
        DatabaseService.shared.getProducts { result in
            switch result {
            case .success(let products):
                self.allProducts = products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
