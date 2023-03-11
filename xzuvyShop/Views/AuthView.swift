//
//  ContentView.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 03.03.2023.
//

import SwiftUI

struct AuthView: View {
    
    @State private var isAuth = true
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isTabViewShow = false
    @State private var isShowAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack(spacing: 30){
            Text(isAuth ? "Авторизация" : "Регистрация")
                .padding()
                .foregroundColor(.white)
                .padding(.horizontal, 40)
                .font(.title2.bold())
                .background(Color("grayAlpha"))
                .cornerRadius(30)
                .shadow(radius: 3)
            
            VStack{
                TextField("Введите email", text: $email)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                    .foregroundColor(.black)
                //.background(Color("grayAlpha"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                    .foregroundColor(Color("colorOne"))
                    .padding(.top, 4)
                
                SecureField("Введите пароль", text: $password)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                    .foregroundColor(.black)
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                
                if !isAuth {
                    SecureField("Повторите пароль", text: $confirmPassword)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                        .foregroundColor(.black)
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                }
                
                Button {
                    if isAuth {
                        print("Авторизация")
                        
                        AuthService.shared.signIn(email: self.email, password: self.password) { result in
                            switch result {
                            case .success(_):
                                isTabViewShow.toggle()
                            case .failure(let error):
                                alertMessage = "Ошибка авторизации : \(error.localizedDescription)"
                                isShowAlert.toggle()
                            }
                        }
                        
                       // isTabViewShow.toggle()
                    } else {
                        print("Регистрация")
                        
                        guard password == confirmPassword else {
                            self.alertMessage = "Пароли не совпадают"
                            self.isShowAlert.toggle()
                            return
                        }
                        
                        AuthService.shared.signUp(email: self.email, password: self.password) { result  in
                            switch result {
                                
                            case .success(let user):
                                alertMessage = "Вы зарегистрировались с email \(user.email)"
                                self.isShowAlert.toggle()
                                self.email = ""
                                self.password = ""
                                self.confirmPassword = ""
                                self.isAuth.toggle()
                            case .failure(let error):
                                alertMessage = "Ошибка регистрации \(error.localizedDescription)"
                                self.isShowAlert.toggle()
                            }
                        }

                    }
                } label: {
                    Text(isAuth ? "Войти" : "Создать")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(LinearGradient(colors: [Color("grayAlpha"), Color("blackAlpha")], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)
                    
                        .padding(.horizontal, 12)
                        .padding(.bottom)
                        .padding(.top, 5)
                        .font(.title3.bold())
                    
                }
                
                Button {
                    isAuth.toggle()
                } label: {
                    Text(isAuth ? "Создать аккаунт" : "Уже есть аккаунт?")
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .padding(8)
                        .padding(.horizontal, 12)
                    //                        .background(LinearGradient(colors: [Color("blackAlpha"), Color("grayAlpha")], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(9)
                        .font(.title3.bold())
                        .padding(.horizontal)
                }
                
                
                
            }
            .padding()
            .background(Color("blackAlpha"))
            .cornerRadius(14)
            .padding(20)
            .alert(alertMessage, isPresented: $isShowAlert) {
                Button {
                    //
                } label: {
                    Text("Ok")
                }

            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("mainBackground").resizable().ignoresSafeArea().frame(width: 580, height: 815).blur(radius: isAuth ? 0 : 3))
        .animation(Animation.easeInOut(duration: 0.5), value: isAuth)
        .fullScreenCover(isPresented: $isTabViewShow) {
            
            if AuthService.shared.currentUser?.uid == "16pUa7971Ff3qPUCWWvgbnIoPyG2" {
                AdminView()
            } else {
                let mainTabBarViewModel = MainTabBarViewModel(user: AuthService.shared.currentUser!)
                MainTabBarView(viewModel: mainTabBarViewModel)
            }
        }
    }
    
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
