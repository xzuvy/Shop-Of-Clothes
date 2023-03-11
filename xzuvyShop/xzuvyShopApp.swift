//
//  xzuvyShopApp.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 03.03.2023.
//

import SwiftUI
import Firebase



let screen = UIScreen.main.bounds

@main
struct xzuvyShopApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            if var user = AuthService.shared.currentUser {
                if user.uid == "16pUa7971Ff3qPUCWWvgbnIoPyG2" {
                    AdminView()
                } else {
                    let viewModel = MainTabBarViewModel(user: user)
                    MainTabBarView(viewModel: viewModel)
                }
            } else {
                AuthView()
            }
        }
    }
    
    class AppDelegate : NSObject, UIApplicationDelegate {
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp.configure()
            print("App delegate smthng")
            return true
        }
        
    }
    
}
