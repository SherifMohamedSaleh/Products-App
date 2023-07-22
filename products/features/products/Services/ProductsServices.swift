//
//  DistinationServices.swift
//  products
//
//  Created by Sherif Abd El-Moniem on 22/07/2023.
//

import Foundation
import Alamofire
import RxSwift

class DistinationServices :  BaseAPI<ProductsTarget>  , ObservableObject {
    
    func getProducts() -> Observable<ProductsResponse?> {
        .create {
            do {
                let userLogInModel =    try await self.Request(target: .getAllProducts , responseClass:ProductsResponse.self)

                return   userLogInModel
            }catch{
                print(error.localizedDescription)
                return  nil
            }
        }
    }
       
}
