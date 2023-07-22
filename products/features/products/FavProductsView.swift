//
//  FavProductsView.swift
//  products
//
//  Created by Sherif Abd El-Moniem on 22/07/2023.
//

import SwiftUI

struct FavProductView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        if cartManager.productsFav.count > 0 {
        ScrollView {
        
            
            LazyVGrid(columns:[GridItem(.adaptive(minimum: 140), spacing: 10)] ) {
                       
                Section {
                    ForEach(cartManager.productsFav, id: \.self){ product in  // rename user
         
                                                     ProductCard(product: product) .environmentObject(cartManager) .padding()

                   }
                }
                
            }
            .padding()
            .navigationBarTitle("Products")
     
        }
        
    } else {
        Text("Your cart is empty.")
    }
    
    }
}
