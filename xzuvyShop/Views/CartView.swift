//
//  CartView.swift
//  xzuvyShop
//
//  Created by Peter Clarke on 05.03.2023.
//

import SwiftUI

struct CartView: View {
    
    var viewModel: CartViewModel
    
    var body: some View {
        Text("cart")
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel())
    }
}
