//
//  ProductsPresenter.swift
//  products
//
//  Created by Sherif Abd El-Moniem on 22/07/2023.
//

import Foundation
import RxSwift
import RxCocoa
import SwiftUI

protocol ProductsPresenter {
    init(interactor: ProductsInteractor)
    var items: [Product] { get }
    var isOffline: Bool { get }
}

final class ProductionProductsPresenter: ProductsPresenter, ObservableObject {
    @Published var items: [Product] = []
    @Published var isOffline: Bool = true
    
    private let interactor: ProductsInteractor
    
    init(interactor: ProductsInteractor) {
        self.interactor = interactor
        self.populate()
    }
    
    // Populate list of items from RxSwift model and let SwiftUI view know about it
    internal func populate() {
        interactor.getProducts()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] items in
                if let localItems = items {
                    self?.items =  Array(localItems.products)
                    RealmService.shared.saveProducts(localItems)
                    self?.isOffline = false
                }else{
                    
                    
                    RealmService.shared.retrieveProduct()
                        .observe(on: MainScheduler.instance)
                        .subscribe(onNext: { [weak self] items in
                            if  Array(items.products) == []{
                                self?.isOffline = true
                            }else{
                                self?.items =  Array(items.products)
                                self?.isOffline = false
                            }
                
                        }).disposed(by: self!.disposeBag)
               
                }
    
            }, onError: { [weak self] error in
                
                self?.isOffline = true
            })
            .disposed(by: self.disposeBag)
    }
    
    
    private let disposeBag = DisposeBag()


}




