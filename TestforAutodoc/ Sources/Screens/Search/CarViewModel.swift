//
//  CarsViewModel.swift
//  TestforAutodoc
//
//  Created by Raiden Yamato on 23.03.2023.
//

import Foundation
import UIKit.UIImage
import Combine

struct CarViewModel {
    let id: Int
    let title: String
    let publishedDate: String
    let description: String
    let image: AnyPublisher<UIImage, Never>
    let categoryType: String
    
    init(id: Int, title: String, publishedDate: String, description: String, image: AnyPublisher<UIImage, Never>, categoryType: String) {
        self.id = id
        self.title = title
        self.publishedDate = publishedDate
        self.description = description
        self.image = image
        self.categoryType = categoryType
    }
}

extension CarViewModel: Hashable {
    static func == (lhs: CarViewModel, rhs: CarViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
