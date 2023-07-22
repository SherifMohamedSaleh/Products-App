//
//  ProductsModel.swift
//  products
//
//  Created by Sherif Abd El-Moniem on 22/07/2023.
//

import Foundation
import RxSwift
import RealmSwift




class ProductsResponse : Object ,  Codable  {
    @Persisted(primaryKey: true) var id: UUID?

    @Persisted var products : List<Product> = List<Product>()
}

class Product:  Object ,Codable  {
    @Persisted(primaryKey: true) var id: Int = 0
    @Persisted var title: String = ""
    @Persisted var descriptionText: String = ""
    @Persisted var price: Int = 0
    @Persisted var discountPercentage: Double = 0.0
    @Persisted var rating: Double = 0.0
    @Persisted var stock: Int = 0
    @Persisted var brand: String = ""
    @Persisted var category: String = ""
    @Persisted var thumbnail: String = ""
    @Persisted var images: List<String> = List<String>()

    enum CodingKeys: String, CodingKey {
        case id, title, descriptionText = "description", price, discountPercentage, rating, stock, brand, category, thumbnail, images
    }
}




protocol ProductsInteractor {
    func getProducts() -> Observable<ProductsResponse?>

}


struct ProductionProductsInteractor: ProductsInteractor {
    private var service = DistinationServices()

    func getProducts() -> Observable<ProductsResponse?> {
    
        return  service.getProducts();
        
    }
}





