//
//  RxExtension.swift
//  gk
//
//  Created by Sherif Abd El-Moniem on 30/01/2022.
//

import Foundation
import RxSwift

enum AppError : Error {
    case noData
}
extension Observable {
    static func create(_ fn: @escaping () async throws -> Element) -> Observable<Element> {
        Observable.create { observer in
            let task = Task {
                do {
                    observer.on(.next(try await fn()))
                    observer.on(.completed)
                } catch {
                    observer.on(.error(error))
                }
            }
            return Disposables.create { task.cancel() }
        }
    }
}
