//
//  AppConfigModel.swift
//  NewsFeedDemo
//
//  Created by Karun Aggarwal on 26/12/21.
//

import Foundation

struct AppConfigModel: Codable {
    var baseSuperUrl: String
    var apiVersion: String
    
    enum CodingKeys: String, CodingKey {
        case baseSuperUrl = "baseSuperUrl"
        case apiVersion = "apiVersion"
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        baseSuperUrl = try value.decodeIfPresent(String.self, forKey: .baseSuperUrl) ?? ""
        apiVersion = try value.decodeIfPresent(String.self, forKey: .apiVersion) ?? ""
    }
}
