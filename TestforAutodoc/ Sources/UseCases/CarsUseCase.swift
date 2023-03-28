//
//  MoviesUseCase.swift
//  TestforAutodoc
//
//  Created by Raiden Yamato on 26.03.2023.
//

import Foundation
import Combine
import UIKit.UIImage

protocol CarsUseCaseType {
    
    func searchCars(with name: String) -> AnyPublisher<Result<Cars, Error>, Never>
    
    func carsDetails(with id: Int) -> AnyPublisher<Result<Cars, Error>, Never>

    func loadImage(for cars: Cars, size: ImageSize) -> AnyPublisher<UIImage?, Never>
    
}



final class CarsUseCase: CarsUseCaseType {
    
    private let networkService: NetworkServiceType
    
    
    
    
    func searchCars(with name: String) -> AnyPublisher<Result<Cars, Error>, Never> {
        networkService
            .load(Resource<Cars>.cars())
            .map{.success($0)}
            .catch { error -> AnyPublisher<Result<Cars, Error>, Never> in
                    .just(.failure(error))
            }
            .subscribe(on: <#T##Scheduler#>)
    }
    
    
    
    
    
    
    func carsDetails(with id: Int) -> AnyPublisher<Result<Cars, Error>, Never> {
        <#code#>
    }
    
    
    func loadImage(for cars: Cars, size: ImageSize) -> AnyPublisher<UIImage?, Never> {
        <#code#>
    }
    
    
}

