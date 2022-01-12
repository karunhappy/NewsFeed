//
//  HomeServiceRetrieval.swift
//  NewsFeedDemo
//
//  Created by Karun Aggarwal on 12/01/22.
//

import Foundation

protocol HomeServiceRetrieval {
    func getDashboard(completion: @escaping ((_ response: AnyObject?, _ error: AnyObject?, _ message: String?) -> Void))
}
