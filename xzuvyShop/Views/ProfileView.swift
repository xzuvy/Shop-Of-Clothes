//
//  ProfileView.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 05.03.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isAvaAlert = false
    @State var isQuit = false
    @State var isAuthView = false
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            HStack(spacing: 16){
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .padding(.leading, 16)
                    .onTapGesture {
                        isAvaAlert.toggle()
                    }
                    .confirmationDialog("Откуда взять фотку?", isPresented: $isAvaAlert) {
                        Button {
                            //
                        } label: {
                            Text("Из галереии")
                        }
                        
                        Button {
                            //
                        } label: {
                            Text("Из камеры")
                        }

                    }

                
                VStack(alignment: .leading, spacing: 3){
                    Text("Андрей Викторович Лахма")
                        .bold()
                    Text("+375338761234")
                    
                }
            }
            
            VStack(alignment: .leading){
                Text("Адрес доставки:")
                    .bold()
                    .padding(.leading, 16)
                Text("г.Минск, ул.Бачило 20,122")
                    .padding(.top, 1)
                    .padding(.leading, 16)
            }
            
            List {
                Text("vawi zakazi")
            }
            .listStyle(.plain)
            
            Button {
                isQuit.toggle()
            } label: {
                Text("Выйти")
                    .bold()
                    .padding()
                    .padding(.horizontal, 15)
                    .background(.black)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    .confirmationDialog("Действительно хотите выйти?", isPresented: $isQuit) {
                        Button {
                            isAuthView.toggle()
                        } label: {
                            Text("Да")
                        }

                    }
            }
            Spacer()
        }
        .background(.white)
        .fullScreenCover(isPresented: $isAuthView, onDismiss: nil) {
            AuthView()
        }
        
        
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
