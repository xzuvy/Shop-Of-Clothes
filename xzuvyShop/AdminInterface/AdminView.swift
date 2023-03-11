//
//  AdminView.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 11.03.2023.
//

import SwiftUI

struct AdminView: View {
    
    @StateObject var viewModel = AdminViewModel()
    @State var isOrderViewShow = false
    @State var isShowAuthView = false
    @State private var isShowAddProduct = false
    
    var body: some View {
        
        VStack{
            HStack {
                Button {
                    AuthService.shared.signOut()
                    isShowAuthView.toggle()
                } label: {
                    Text("Выход")
                        .padding()
                        .foregroundColor(.red)
            }
                Spacer()
                Button {
                    isShowAddProduct.toggle()
                } label: {
                    Text("Добавить")
                        .padding()
                        .background(.green)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding()
                }
                Spacer()
                
                Button {
                    viewModel.getOrders()
                } label: {
                    Text("Обновить")
                        .padding()
                }

            }

            
            List {
                ForEach(viewModel.orders, id: \.id) { order in
                    OrderCell(order: order)
                        .onTapGesture {
                            viewModel.currentOrder = order
                            isOrderViewShow.toggle()
                        }
                }
            }
            .listStyle(.plain)
            .onAppear {
                viewModel.getOrders()
            }
            .sheet(isPresented: $isOrderViewShow) {
                let orderViewModel = OrderViewModel(order: viewModel.currentOrder)
                AdminOrderView(viewModel: orderViewModel)
            }
        }
        .fullScreenCover(isPresented: $isShowAuthView) {
            AuthView()
        }
        .sheet(isPresented: $isShowAddProduct) {
            AddProductView()
        }
        
    }
        
}

struct AdminView_Previews: PreviewProvider {
    static var previews: some View {
        AdminView()
    }
}
