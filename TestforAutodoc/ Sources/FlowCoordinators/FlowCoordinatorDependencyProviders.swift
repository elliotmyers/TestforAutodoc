//
//  FlowCoordinatorDependencyProviders.swift
//  TestforAutodoc
//
//  Created by Raiden Yamato on 23.03.2023.
//

import UIKit

protocol ApplicationFlowCoordinatorDependencyProvider: CarsSearchFlowCoordinatorDependencyProvider{}



protocol CarsSearchFlowCoordinatorDependencyProvider: AnyObject {
    
    func carsSearchNavigationController(navigator: CarsSearchViewController) -> UINavigationController
    
    func movieDetailsController(_ movieId: Int) -> UIViewController
}

