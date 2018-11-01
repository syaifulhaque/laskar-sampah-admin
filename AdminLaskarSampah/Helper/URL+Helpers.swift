//
//  URL+Helpers.swift
//  LaskarSampahIRT
//
//  Created by Daniel Gunawan on 26/10/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String : String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap{
            URLQueryItem(name: $0.0, value: $0.1)
        }
        return components?.url
    }
}
