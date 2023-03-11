//
//  ProductDetailView.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 05.03.2023.
//

import SwiftUI

struct ProductDetailView: View {
    
    @State var viewModel: ProductDetailViewModel
    @State var size = "37"
    @State var count = 1
    @Environment(\.presentationMode) var presentationMode
    
    
    
    var body: some View {
        
        VStack{
            
            Image(uiImage: self.viewModel.image)
                .resizable()
                .frame(maxWidth: 250, maxHeight: 270)
                .cornerRadius(30)
            VStack{
                Text("\(viewModel.product.title)")
                    .font(.custom("AvenirNext-Bold", size: 20))
                Text("\(viewModel.getValue(size: self.size)) BYN")
                    .font(.custom("AvenirNext-Bold", size: 15))
                //Spacer(minLength: 40)
            }

                VStack {
                    ScrollView{
                        Text("\(viewModel.product.title)")
                            .padding(.top, 2)
                            .font(.title3.bold())
                        Text("\(viewModel.product.information)")
                            .padding(.top, 2)
                            .padding(.leading, 20)
                            
                        
                        HStack {
                            Stepper("Kolvo", value: $count, in: 1...10)
                                .padding(.leading, 20)
                            Text("\(self.count)")
                                .padding(.leading, 20)
                        }
                        HStack{
                            Text("Размер")
                                .padding(.leading, 20)
                            Picker("Размер", selection: $size) {
                                ForEach(viewModel.sizes, id: \.self) { item in
                                    Text(item)
                                }
                            }
                            .pickerStyle(.menu)
                            .foregroundColor(Color.black)
                            Spacer()
                        }
                        VStack{
                            Button {
                                let position = Position(id: UUID().uuidString, product: viewModel.product, count: self.count)
                                CartViewModel.shared.addPosition(position)
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Text("Добавить в корзину")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color("blackAlpha"))
                                    .cornerRadius(15)
                                    .padding(.top, 15)
                            }
                            .onAppear {
                                self.viewModel.getImage()
                            }

                        }
                    }
                    .padding(.top,2)
                    
                }
                .background(.white)
                .cornerRadius(20)
                .padding(.top, 1)
                .padding()
                //.shadow(radius: 500)
            
            
            
        }
        .frame(width: screen.width * 0.8, height: screen.height * 0.9)
        .cornerRadius(30)
        .background(.white)
        .padding()
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: Product(id: "1",
                                                                             title: "Nike AirForce 1",
                                                                             imageUrl: "Not found",
                                                                             price: 314,
                                                                             information: "dfssdfdsfsghfghgfhgfhgfhgfhjfglkhjgfklj")))
    }
}
