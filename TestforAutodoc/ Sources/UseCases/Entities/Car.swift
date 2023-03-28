//
//  Car.swift
//  TestforAutodoc
//
//  Created by Raiden Yamato on 22.03.2023.
//

import Foundation

struct Car: Decodable{
    let id: Int
    let title: String
    let description: String
    let publishedDate: String
    let url: String
    let fullUrl: String
    let titleImageUrl: String
    let categoryType: String
}

extension Car: Hashable {
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
//    extension Car: Decodable {
//        enum CodingKeys: String, CodingKey {
//            case id
//            case title
//            case description
//            case publishedDate = "published_date"
//            case url
//            case fullUrl = "full_url"
//            case titleImageUrl = "title_image_url"
//
//        }
//    }
    
}
