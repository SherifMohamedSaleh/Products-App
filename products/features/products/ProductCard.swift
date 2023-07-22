//
//  ProductCard.swift
//  products
//
//  Created by Sherif Abd El-Moniem on 22/07/2023.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                AsyncImage(url: URL(string:product.thumbnail) ) { phase in
                    if let loaded = phase.image {
                        loaded.resizable()
                            .cornerRadius(20)
                            .frame(width: 180)
                            .scaledToFit()
                    }else{
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.system(size: 100))
                            .foregroundColor(.red)
                    }
                }

                VStack(alignment: .leading) {
                    Text(product.title)
                        .bold()
                    
                    Text("\(product.price)$")
                        .font(.caption)
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            
            Button {
                cartManager.addToFav(product: product)
            } label: {
                
                Image(systemName: "heart")
                    .padding(4)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }
        }
    }
}
