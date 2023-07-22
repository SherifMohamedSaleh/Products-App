//
//  DistinationTarget.swift
//  products
//
//  Created by Sherif Abd El-Moniem on 22/07/2023.
//

import Alamofire

enum ProductsTarget {
    case getAllProducts
}


extension ProductsTarget : TargetType {
    var baseURL: String {
        switch self {
        case .getAllProducts:
            return "https://run.mocky.io/v3/"
  
        }
    }
    var path: String {
        switch self {
        case .getAllProducts:
            return "9677ed07-93eb-42a6-9e26-5a9cbbca658f"


        }
    }
    var method: HTTPMethod {
        switch self {
        case .getAllProducts:
            return .get

        }
    }
    var task: RequestTask {
        switch self {
        case .getAllProducts:
            return .requestPlain

        }
    }
    var headers: RequestHeader {
        switch self {
        case .getAllProducts:
            return .anonymous

        }
    }
}
