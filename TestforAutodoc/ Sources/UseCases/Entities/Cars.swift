//
//  Cars.swift
//  TestforAutodoc
//
//  Created by Raiden Yamato on 26.03.2023.
//

import Foundation

struct Cars {
    let items: [Car]
}

extension Cars: Decodable {
    enum CodingKeys: String, CodingKey {
        case items = "results"
    }
}
