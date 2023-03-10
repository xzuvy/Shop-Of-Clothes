//
//  MainTabBar.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 05.03.2023.
//

import SwiftUI

struct MainTabBarView: View {
    
    var viewModel : MainTabBarViewModel
    
    var body: some View {
        
        TabView{
            NavigationView{
                CatalogView()
            }
            .tabItem{
                VStack{
                    Image(systemName: "bag")
                    Text("Каталог")
                }
            }
            CartView(viewModel: CartViewModel.shared)
                .tabItem{
                    VStack{
                        Image(systemName: "cart")
                        Text("Корзина")
                    }
                }
            ProfileView(viewModel: ProfileViewModel(profile: UserShop(id: "" ,
                                                                        name: "",
                                                                      number: 34543534,
                                                                        adress: "")))
                .tabItem{
                    VStack{
                        Image(systemName: "person.circle")
                        Text("Профиль")
                    }
                }
        }
        
    }
}

//struct MainTabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabBarView(viewModel: MainTabBarViewModel())
//    }
//}
