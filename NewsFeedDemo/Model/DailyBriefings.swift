//
//  DailyBriefings.swift
//  NewsFeedDemo
//
//  Created by Karun Aggarwal on 26/12/21.
//

import Foundation
struct DailyBriefings : Codable {
	let eu : [NewsDetail]?
	let asia : [NewsDetail]?
	let us : [NewsDetail]?

	enum CodingKeys: String, CodingKey {

		case eu = "eu"
		case asia = "asia"
		case us = "us"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		eu = try values.decodeIfPresent([NewsDetail].self, forKey: .eu)
		asia = try values.decodeIfPresent([NewsDetail].self, forKey: .asia)
		us = try values.decodeIfPresent([NewsDetail].self, forKey: .us)
	}

}
