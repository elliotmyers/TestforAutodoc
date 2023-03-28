//
//  AccessibilityIdentifiers.swift
//  TestforAutodoc
//
//  Created by Raiden Yamato on 23.03.2023.
//

import Foundation

public struct AccessibilityIdentifiers {
    public struct CarsSearch {
        public static let rootViewId = "\(CarsSearch.self).rootViewId"
        public static let tableViewId = "\(CarsSearch.self).tableViewId"
        public static let searchTextFieldId = "\(CarsSearch.self).searchTextFieldId"
        public static let cellId = "\(CarsSearch.self).cellId"
    }
    
    public struct CarDetails {
        public static let rootViewId = "\(CarDetails.self).rootViewId"
        public static let contentViewId = "\(CarDetails.self).contentViewId"
        public static let titleLabelId = "\(CarDetails.self).titleLabelId"
        public static let publishedDateId = "\(CarDetails.self).publishedDateId"
        public static let descriptionLabelId = "\(CarDetails.self).descriptionLabelId"
        public static let loadingIndicatorId = "\(CarDetails.self).loadingIndicatorId"
    }
    
    public struct Alert {
        public static let rootViewId = "\(Alert.self).rootViewId"
        public static let titleLabelId = "\(Alert.self).titleLabelId"
        public static let descriptionLabelId = "\(Alert.self).descriptionLabelId"
    }
    
}
