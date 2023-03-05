//
//  CatalogView.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 05.03.2023.
//

import SwiftUI

struct CatalogView: View {
    
    let layoutForPopular = [GridItem(.adaptive(minimum: screen.width / 3.0))]
    let layoutForAll = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            Section("Рекомендуем") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layoutForPopular, spacing: 12) {
                        ForEach(CatalogViewModel.shared.popularProducts, id: \.id) { item in
                            NavigationLink {
                                let viewModel = ProductDetailViewModel(product: item)
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .padding()
                }
            }
            
            Section("Весь каталог") {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layoutForAll, spacing: 14) {
                        ForEach(CatalogViewModel.shared.allProducts, id: \.id) { item in
                            NavigationLink {
                                let viewModel = ProductDetailViewModel(product: item)
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundColor(.black)
                            }
                            
                        }
                    }
                    .padding()
                }
            }
            
            
        }
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
