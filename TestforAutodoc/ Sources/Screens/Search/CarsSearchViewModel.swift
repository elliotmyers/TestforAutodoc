//
//  CarsSearchViewModel.swift
//  TestforAutodoc
//
//  Created by Raiden Yamato on 26.03.2023.
//

import UIKit
import Combine

final class CarsSearchViewModel: CarsSearchViewModelType {
    //TODO: continue
    private weak var navigator:
    private let useCase: CarsUseCaseType
    private var cancellables: [AnyCancellable] = []
    
    
    func transform(input: CarsSearchViewModelInput) -> CarsSearchViewModelOuput {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
        
        input.selecti
        
        let searchInput = input.search
            .debounce(for: .milliseconds(300), scheduler: Scheduler.mainScheduler)
            .removeDuplicates()
        let cars = searchInput
            .filter({ !$0.isEmpty })
            .flatMapLatest ({[unowned self] query in self.useCase.searchMovies(with: query) })
    }
    
    
}
