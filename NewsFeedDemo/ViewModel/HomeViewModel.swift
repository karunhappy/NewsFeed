//
//  HomeViewModel.swift
//  NewsFeedDemo
//
//  Created by Karun Aggarwal on 26/12/21.
//

import Foundation
protocol HomeDelegate {
    func fetchNews()
}
class HomeViewModel: NSObject {
    var dataModel: NewsBaseModel?
    var delegate: HomeDelegate?

    func getDashboard() {
        RequestHandler.shared.connectToServer(urlString: dashboard, httpMethod: .get) { [weak self] data in
            guard let weakSelf = self else { return }
            if let dashboardData = data {
                weakSelf.dataModel = try? JSONDecoder().decode(NewsBaseModel.self, from: dashboardData)
                weakSelf.delegate?.fetchNews()
            }
        }
    }
}
