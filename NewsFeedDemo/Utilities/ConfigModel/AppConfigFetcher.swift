//
//  AppConfigFetcher.swift
//  NewsFeedDemo
//
//  Created by Karun Aggarwal on 26/12/21.
//

import Foundation

class APPConfigFetcher: NSObject {
    /// Get path for plist files
    /// - Parameter resource: plist file name
    /// - Returns: String path for plist file
    static func getPlistPath(for resource: String) -> String? {
        return Bundle.main.path(forResource: resource, ofType: "plist")
    }
    /// App Configurations
    /// - Returns: AppConfigModel
    static func getAppConfigFile() -> AppConfigModel? {
        if let path = APPConfigFetcher.getPlistPath(for: Configs.appConfig) {
            let nsDictionary = NSDictionary(contentsOfFile: path)
            if let json = nsDictionary as? [String: Any] {
                if let data = json.toData() {
                    let config = try? JSONDecoder().decode(AppConfigModel.self, from: data)
                    return config
                }
            }
        }
        return nil
    }
}
