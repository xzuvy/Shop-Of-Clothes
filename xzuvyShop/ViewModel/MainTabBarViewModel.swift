//
//  MainTabBarViewModel.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 09.03.2023.
//

import Foundation
import FirebaseAuth

class MainTabBarViewModel: ObservableObject {
    
    @Published var user : User
    
    init(user: User) {
        self.user = user
    }
}
