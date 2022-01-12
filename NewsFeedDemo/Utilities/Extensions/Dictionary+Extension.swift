//
//  Dictionary+Extension.swift
//  NewsFeedDemo
//
//  Created by Karun Aggarwal on 26/12/21.
//

import Foundation

extension Dictionary {
    /// Convert Dictionary to Data
    /// - Returns: Data
    func toData() -> Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
    }
}
