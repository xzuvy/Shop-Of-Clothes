//
//  ContentView.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 03.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 30){
            Text("Авторизация")
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
                
                Button {
                    // do smth
                } label: {
                    Text("Войти")
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
                    // do wmth
                } label: {
                    Text("Создать аккаунт")
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
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("mainBackground").resizable().ignoresSafeArea().frame(width: 580, height: 815))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
