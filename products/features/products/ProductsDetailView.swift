//
//  ProductsDetailView.swift
//  products
//
//  Created by Sherif Abd El-Moniem on 22/07/2023.
//

import SwiftUI

struct ProductsDetailView : View {
    var product: Product
    
    var body: some View {
        ZStack{
            ZStack {
                
                Color(.black)
                
                
                
                GeometryReader { geometry in
                    VStack( ){
                        Spacer(minLength:  100)

                        CurvedWaveShape().frame(width: geometry.size.width , height: UIScreen.main.bounds.height - 250, alignment: .bottom).foregroundColor(.white).overlay(
                            ScrollView(.vertical, showsIndicators: true ) {
                              
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Spacer(minLength:  220)
                                        
                                        
                                        VStack{
                                    
                                            ScrollView(.horizontal, showsIndicators: false) {
                                                HStack(alignment: .top, spacing: 0) {
                                                    ForEach(product.images , id : \.self){ product in
                                                        AsyncImage(url: URL(string: product) ) { phase in
                                                            if let loaded = phase.image {
                                                                loaded.resizable()
                                                                  
                                                                    .cornerRadius(20)
                                                                    .frame(width: 120, height: 120)                      //.scaledToFit().vCenter()
                                                                    .aspectRatio(contentMode: .fit)
                                                           
                                                                    .padding(10)
                                                            }else{
                                                                Image(systemName: "exclamationmark.triangle.fill")
                                                                    .font(.system(size: 100))
                                                                    .foregroundColor(.red)
                                                            }
                                                        }
                    
                                                    }
                                                }
                                            }.frame(height: 120)
                                        }
                                        
                                        
                                        HStack{
                                            Text(product.title)
                                                .font(.title)
                                             
                                                .hLeading().padding(.leading)
                                            Text("\(product.price)$").font(.body)
                                            
                                            
                                        }
                                        
                                        
                                   
                                        Spacer()
                                        Text(product.category)
                                            .font(.title2).padding(.leading)
                                                  Text(product.brand)
                                                      .font(.title3).padding(.leading)  
                                            Text( product.descriptionText).font(.body)
                                                .hLeading().padding([.leading , .trailing ])
                                                .lineLimit(nil)
                                                .lineSpacing(10)
                                            
                                            Spacer()
                                   
                                    }
                                    .lineLimit(nil)
                                    .padding()
                                    
            
                                
                            }
                        )}
                }
                
                
            }
            .navigationBarTitle("Product", displayMode: .inline)
            
            
            
            VStack(alignment: .center , spacing: 100) {
                AsyncImage(url: URL(string:product.thumbnail) ) { phase in

                if let loaded = phase.image {
                    loaded.resizable()
                                                .cornerRadius(20)
                            .frame(width: UIScreen.main.bounds.width - 100 , height: 250)
                        .scaledToFit().vCenter()
                }else{
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.system(size: 100))
                        .foregroundColor(.red)
                }
                }
                .offset(y : 50)
                .frame(height : 200 , alignment: .top)
                Spacer()
            }
        }
    }
}

