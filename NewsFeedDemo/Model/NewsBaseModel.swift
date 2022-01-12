//
//  NewsBaseModel.swift
//  NewsFeedDemo
//
//  Created by Karun Aggarwal on 26/12/21.
//

import Foundation
struct NewsBaseModel : Codable {
	let breakingNews : [NewsDetail]?
	let topNews : [NewsDetail]?
	let dailyBriefings : DailyBriefings?
	let technicalAnalysis : [NewsDetail]?
	let specialReport : [NewsDetail]?

	enum CodingKeys: String, CodingKey {

		case breakingNews = "breakingNews"
		case topNews = "topNews"
		case dailyBriefings = "dailyBriefings"
		case technicalAnalysis = "technicalAnalysis"
		case specialReport = "specialReport"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		breakingNews = try values.decodeIfPresent([NewsDetail].self, forKey: .breakingNews)
		topNews = try values.decodeIfPresent([NewsDetail].self, forKey: .topNews)
		dailyBriefings = try values.decodeIfPresent(DailyBriefings.self, forKey: .dailyBriefings)
		technicalAnalysis = try values.decodeIfPresent([NewsDetail].self, forKey: .technicalAnalysis)
		specialReport = try values.decodeIfPresent([NewsDetail].self, forKey: .specialReport)
	}

}
