//
//  HomeServiceMock.swift
//  NewsFeedDemoTests
//
//  Created by Karun Aggarwal on 12/01/22.
//

import Foundation
@testable import NewsFeedDemo

final class HomeServiceMock: HomeServiceRetrieval {
    func getDashboard(completion: @escaping ((AnyObject?, AnyObject?, String?) -> Void)) {
        let request = MockHomeRequestModel()
        request.getDashboard { response, error, status in
            completion(response, error, status)
        }
    }
}
