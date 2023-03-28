//
//  AlertViewModel.swift
//  TestforAutodoc
//
//  Created by Raiden Yamato on 25.03.2023.
//

import Foundation
import UIKit.UIImage

struct AlertViewModel {
    let title: String
    let description: String?
    let image: UIImage
    
    static var noResults: AlertViewModel {
        let title = NSLocalizedString("No cars found!", comment: "No cars found!")
        let description = NSLocalizedString("Try searching again...", comment: "Try searching again...")
        let image = UIImage(named: "search") ?? UIImage()
        return AlertViewModel(title: title, description: description, image: image)
    }
    
    static var startSearch: AlertViewModel {
        let title = NSLocalizedString("Search for a cars", comment: "Search for a cars")
        let image = UIImage(named: "search") ?? UIImage()
        return AlertViewModel(title: title, description: nil, image: image)
    }
    
    
    static var dataLoadingError: AlertViewModel {
        let title = NSLocalizedString("Can't load search results!", comment: "Can't load search results!")
        let description = NSLocalizedString("Something went wrong. Try searching again...", comment: "Something went wrong. Try searching again...")
        let image = UIImage(named: "error") ?? UIImage()
        return AlertViewModel(title: title, description: description, image: image)
    }
    
}
