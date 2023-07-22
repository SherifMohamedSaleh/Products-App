//
//  CartManager.swift
//  products
//
//  Created by Sherif Abd El-Moniem on 22/07/2023.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var productsCard: [Product] = []
    @Published private(set) var productsFav: [Product] = []


    // Functions to add and remove from cart
    func addToCart(product: Product) {
        productsCard.append(product)
    }
    
    func removeFromCart(product: Product) {
        productsCard = productsCard.filter { $0.id != product.id }
    }
    

    
    
    // Functions to add and remove from fav
    func addToFav(product: Product) {
        productsFav.append(product)
    }
    
    func removeFromFav(product: Product) {
        productsFav = productsFav.filter { $0.id != product.id }
    }
}
