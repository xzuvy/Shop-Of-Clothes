//
//  ProductDetailViewModel.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 05.03.2023.
//

import Foundation
import UIKit

class ProductDetailViewModel : ObservableObject {
    
    @Published var product : Product 
    @Published var sizes = ["37", "38", "39", "40", "41"]
    @Published var count = 0
    @Published var image = UIImage(named: "airforceLow1")!
    init(product: Product) {
        self.product = product
    }
    
    func getValue(size : String) -> Int {
        
        switch size {
        case "37":
            return product.price
        case "38":
            return product.price
        case "39":
            return product.price
        case "40":
            return product.price
        case "41":
            return product.price
        default: return 0
        }
        
    }
    
    func getImage() {
        StorageService.shared.download(id: product.id) { result in
            switch result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    self.image = image
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
