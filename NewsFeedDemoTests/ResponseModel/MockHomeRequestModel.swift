//
//  MockHomeRequestModel.swift
//  NewsFeedDemoTests
//
//  Created by Karun Aggarwal on 12/01/22.
//

import Foundation
@testable import NewsFeedDemo

class MockHomeRequestModel {
    
    func getDashboard(completion: @escaping ((_ response: AnyObject?, _ error: AnyObject?, _ status: String?) -> Void)) {
        guard let url = Bundle(for: NewsFeedDemoTests.self).url(forResource: "NewsDashboard", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let newsData = try? JSONDecoder().decode(NewsBaseModel.self, from: data)
        else {
            completion(nil, nil, "False")
            return
        }
        completion(newsData as AnyObject, nil, "True")
    }
}
