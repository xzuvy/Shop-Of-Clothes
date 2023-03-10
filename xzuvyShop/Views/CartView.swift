//
//  CartView.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 05.03.2023.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var viewModel: CartViewModel
    
    var body: some View {
        
        VStack {
            List(viewModel.positions) { position in
                
                PositionCell(position: position)
                    .swipeActions { 
                        Button {
                            viewModel.positions.removeAll { pos in
                                pos.id == position.id
                            }
                        } label: {
                            Text("Удалить")
                        }
                        .tint(.red)

                    }
            }
            .listStyle(.plain)
        .navigationTitle("Корзина")
            
            HStack {
                Text("Итого : ")
                    .fontWeight(.bold)
                Spacer()
                Text("\(self.viewModel.cost) BYN")
                    .fontWeight(.bold)
            }
            .padding()
            
            HStack(spacing: 24){
                
                Button {
                    var order = Order(userID: AuthService.shared.currentUser!.uid,
                                      date: Date(),
                                      status: OrderStatus.new.rawValue)
                    order.positions = self.viewModel.positions
                    
                    DatabaseService.shared.setOred(order: order) { result in
                        switch result {
                        case .success(let order):
                            print(order.cost)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                } label: {
                    Text("Заказать")
                        .padding()
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .background(.green)
                        .cornerRadius(12)
                        .padding(.bottom, 15)
                }
                
                Button {
                    //
                } label: {
                    Text("Отменить")
                        .padding()
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .background(.red)
                        .cornerRadius(12)
                        .padding(.bottom, 15)
                }
                
            }

        }
        
        
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel.shared)
    }
}
