//
//  ProfileViewModel.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 10.03.2023.
//

import Foundation


class ProfileViewModel : ObservableObject {
    
    @Published var profile: UserShop
    @Published var orders : [Order] = [Order]()
    
    init(profile : UserShop) {
        self.profile = profile
    }
    
    func getOrder() {
        DatabaseService.shared.getOrders(by: AuthService.shared.currentUser?.uid) { result in
            switch result {
            case .success(let orders):
                self.orders = orders
                for (index, order) in self.orders.enumerated() {
                    DatabaseService.shared.getPositions(by: order.id) { result in
                        switch result {
                            
                        case .success(let positions):
                            self.orders[index].positions = positions
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
                print("Всего заказов: \(orders.count)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    func setProfile() {
        DatabaseService.shared.createUser(user: self.profile) { result in
            switch result {
                
            case .success(let user):
                print(user.name)
            case .failure(let error):
                print("Ошибка отправки данных \(error.localizedDescription)")
            }
        }
    }
    
    func getProfile() {
        DatabaseService.shared.getProfile { result in
            switch result {
            case .success(let user):
                self.profile = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
