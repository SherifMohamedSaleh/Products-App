//
//  RealmService.swift
//  products
//
//  Created by Sherif Abd El-Moniem on 22/07/2023.
//

import Foundation
import RealmSwift
import RxSwift

class RealmService {
    static let shared = RealmService()
    private var realm: Realm

    private init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Error initializing Realm: \(error)")
        }
    }

    func saveProducts(_ products: ProductsResponse) {
        do {
            try realm.write {
                realm.add(products, update: .modified)
            }
        } catch {
            print("Error saving products: \(error)")
        }
    }

    

    
    func retrieveProduct() -> Observable<ProductsResponse> {

            let product = realm.objects(ProductsResponse.self)
            return Observable<ProductsResponse>.from(product)
    }
   

}

