//
//  BaseResponse.swift
//  gk
//
//  Created by Sherif Abd El-Moniem on 10/02/2022.
//

import Foundation

struct BaseResponse<T : Decodable> : Decodable {
//    var isSuccess : Bool
//    var message : String
    let data: T
}
