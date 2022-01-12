//
//  AppURL.swift
//  NewsFeedDemo
//
//  Created by Karun Aggarwal on 26/12/21.
//

import Foundation

let baseSuperUrl = (APPConfigFetcher.getAppConfigFile()?.baseSuperUrl)!
let version = (APPConfigFetcher.getAppConfigFile()?.apiVersion)!
let baseUrl = baseSuperUrl + version

let dashboard = baseUrl + "dashboard"
