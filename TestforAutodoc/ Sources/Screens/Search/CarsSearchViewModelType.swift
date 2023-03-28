//
//  CarsViewModelType.swift
//  TestforAutodoc
//
//  Created by Raiden Yamato on 23.03.2023.
//

import Combine

struct CarsSearchViewModelInput {
    let appear: AnyPublisher<Void, Never>
    let search: AnyPublisher<String, Never>
    let selection: AnyPublisher<Int, Never>
}

enum CarsSearchState {
    case idle
    case loading
    case success([CarViewModel])
    case noResults
    case failure(Error)
}

extension CarsSearchState: Equatable {
    static func == (lhs: CarsSearchState, rhs: CarsSearchState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle): return true
        case (.loading, .loading): return true
        case (.success(let lhsCars), .success(let rhsCars)): return lhsCars == rhsCars
        case (.noResults, .noResults): return true
        case (.failure, .failure): return true
        default: return false
        }
    }
}


typealias CarsSearchViewModelOuput = AnyPublisher<CarsSearchState, Never>

protocol CarsSearchViewModelType {
    func transform(input: CarsSearchViewModelInput) -> CarsSearchViewModelOuput
}

