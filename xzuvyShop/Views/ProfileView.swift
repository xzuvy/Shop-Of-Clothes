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
    @StateObject var viewModel: ProfileViewModel
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
                    TextField("Имя", text: $viewModel.profile.name)
                        .font(.custom("AvenirNext-Bold", size: 18))
                    
                    HStack{
                        Text("+375")
                        TextField("Телефон", value: $viewModel.profile.number, format: IntegerFormatStyle.number)
                    }
                    
                }
                
            }
            
            VStack(alignment: .leading){
                Text("Адрес доставки:")
                    .bold()
                    .padding(.leading, 16)
                TextField("Ваш адрес", text: $viewModel.profile.adress)
                    .padding(.top, 1)
                    .padding(.leading, 16)
            }
            
            List {
                if viewModel.orders.count == 0 {
                    Text("vawi zakazi")
                } else {
                    ForEach(viewModel.orders, id: \.id) { order in
                        OrderCell(order: order)
                    }
                }
                
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
        .onSubmit {
            viewModel.setProfile()
        }
        
        .onAppear {
            self.viewModel.getProfile()
            self.viewModel.getOrder()
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(profile: UserShop(id: "" ,name: "Вася Слвал", number: 293455543, adress: "Bachilo")))
    }
}
