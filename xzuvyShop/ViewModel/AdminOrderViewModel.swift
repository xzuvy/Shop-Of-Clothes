//
//  AdminOrderViewModel.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 11.03.2023.
//

import Foundation


class OrderViewModel : ObservableObject {
    
    @Published var order: Order
    @Published var user = UserShop(name: "", number: 0, adress: "")
    
    init(order: Order) {
        self.order = order
    }
    
    func getUserData() {
        
        DatabaseService.shared.getProfile { result in
            switch result {
                
            case .success(let user):
                self.user = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
}
