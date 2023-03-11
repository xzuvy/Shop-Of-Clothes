//
//  AddProductView.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 11.03.2023.
//

import SwiftUI

struct AddProductView: View {
    
    @State private var showImagePicker = false
    @State private var image = UIImage(named: "mainBackground")!
    @State private var title: String = ""
    @State private var price: Int? = nil
    @State private var information: String = ""
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            
            
            Text("Добавление товара")
                .font(.custom("AvenirNext-Bold", size: 30))
                .bold()
            Image(uiImage : image)
                .resizable()
            
                .frame(width: 350, height: 350)
            
                .onTapGesture {
                    showImagePicker.toggle()
                }
                .cornerRadius(20)
                .shadow(radius: 4)
            VStack(alignment: .center){
                TextField("Название продукта", text: $title)
                    .padding()
                    .shadow(radius: 4)
                TextField("Информация о продукте", text: $information)
                    .padding()
                    .shadow(radius: 4)
                TextField("Цена продукта", value: $price, format: .number)
                    .padding()
                    .shadow(radius: 4)
                Button {
                    guard let price = price else {
                        print("Невозможно извлечь цену")
                        return
                    }
                    let product = Product(id: UUID().uuidString,
                                          title: title,
                                          price: price, information: information)
                    
                    guard let imageData = image.jpegData(compressionQuality: 0.3) else { return }
                    
                    DatabaseService.shared.setProduct(product: product,
                                                      image: imageData) { result in
                        switch result {
                        case .success(let product):
                            dismiss()
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                } label: {
                    Text("Сохранить")
                        .padding()
                        .background(.green)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .padding()
                }
                
            }
            .padding()
            
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
