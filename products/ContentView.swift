//
//  ContentView.swift
//  products
//
//  Created by Sherif Abd El-Moniem on 19/07/2023.
//

import SwiftUI


enum Tab {
    case main
    case list
    case card
    case favorite
    case profile
}

struct ContentView: View {
    @StateObject var cartManager = CartManager()

    @State private var selection: Tab = .main
    var body: some View {
        NavigationView {
        TabView(selection: $selection) {
            
       
            NavigationView {
                ProductsView(presenter: ProductionProductsPresenter(interactor: ProductionProductsInteractor())).environmentObject(cartManager)
            }
                .listStyle(SidebarListStyle())
                .navigationBarTitleDisplayMode(.inline)
                
            
            .tabItem {
                Label("", systemImage: "square.grid.2x2")
            }
            .tag(Tab.main)
            
            Color(.green)
            
        
        .tabItem {
            Label("", systemImage: "list.bullet")
        }
        .tag(Tab.list)
            
            Color(.red)

            
        
        .tabItem {
            Label("", systemImage: "creditcard")
        }
        .tag(Tab.card)
            
            FavProductView().environmentObject(cartManager)
            .listStyle(SidebarListStyle())
            .navigationBarTitle("favorites ")
            .navigationBarTitleDisplayMode(.inline)
            
        
        .tabItem {
            Label("", systemImage: "heart")
        }
        .tag(Tab.favorite)
            Color(.blue)
            
            .tabItem {
                Label("", systemImage: "person")
            }
            .tag(Tab.profile)
            
            
            
        }
    
        }
    
        
    }
    

}



struct SecondView : View {
    var body : some View {
        Text("Lool")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
