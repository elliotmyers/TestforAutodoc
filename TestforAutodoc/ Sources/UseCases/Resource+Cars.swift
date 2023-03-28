//
//  Resource+Cars.swift
//  TestforAutodoc
//
//  Created by Raiden Yamato on 28.03.2023.
//

import Foundation


extension Resource {
    @discardableResult
    static func cars() -> Resource<Cars> {
        let url = ApiConstants.baseUrl!
        return Resource<Cars>(url: url)
    }
}
