//
//  ProductsView.swift
//  products
//
//  Created by Sherif Abd El-Moniem on 22/07/2023.
//

import SwiftUI

struct ProductsView : View {
    @State var searchText = ""

    @ObservedObject var presenter: ProductionProductsPresenter
    
    @EnvironmentObject var cartManager: CartManager


    
    
    
    var filteredColors: [Product] { // 1
          if searchText.isEmpty {
              return presenter.items
          } else {
              return presenter.items.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
          }
      }
    
    
    var body: some View {
        ScrollView {
        
            
            LazyVGrid(columns:[GridItem(.adaptive(minimum: 140), spacing: 10)] ) {
                       
                Section {
                     ForEach(filteredColors, id: \.self){ product in  // rename user
                         
                         NavigationLink(destination: ProductsDetailView(product: product)) {
                             
                             ProductCard(product: product) .environmentObject(cartManager) .padding()


                         }
                   }
                }
                
            }
            .searchable(text: $searchText)
            .padding()
            .navigationBarTitle("Products")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: presenter.isOffline ? Button(action: presenter.populate) { HStack {
                Image(systemName: "bolt")
                Text("Retry")
            } }.foregroundColor(.red) : nil)
        }
    }
}

fileprivate extension Color {
    static func getRandom() -> Color {
        return Color(hue: .random(in: 0...1), saturation: 0.333, brightness: 0.666)
    }
}





