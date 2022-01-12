//
//  NewsDetail.swift
//  NewsFeedDemo
//
//  Created by Karun Aggarwal on 26/12/21.
//

import Foundation
struct NewsDetail : Codable {
	let title : String?
	let url : String?
	let description : String?
	let content : String?
	let firstImageUrl : String?
	let headlineImageUrl : String?
	let articleImageUrl : String?
	let backgroundImageUrl : String?
	let videoType : String?
	let videoId : String?
	let videoUrl : String?
	let videoThumbnail : String?
	let newsKeywords : String?
	let authors : [Authors]?
	let instruments : [String]?
	let tags : [String]?
	let categories : [String]?
	let displayTimestamp : Int?
	let lastUpdatedTimestamp : Int?

	enum CodingKeys: String, CodingKey {

		case title = "title"
		case url = "url"
		case description = "description"
		case content = "content"
		case firstImageUrl = "firstImageUrl"
		case headlineImageUrl = "headlineImageUrl"
		case articleImageUrl = "articleImageUrl"
		case backgroundImageUrl = "backgroundImageUrl"
		case videoType = "videoType"
		case videoId = "videoId"
		case videoUrl = "videoUrl"
		case videoThumbnail = "videoThumbnail"
		case newsKeywords = "newsKeywords"
		case authors = "authors"
		case instruments = "instruments"
		case tags = "tags"
		case categories = "categories"
		case displayTimestamp = "displayTimestamp"
		case lastUpdatedTimestamp = "lastUpdatedTimestamp"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		content = try values.decodeIfPresent(String.self, forKey: .content)
		firstImageUrl = try values.decodeIfPresent(String.self, forKey: .firstImageUrl)
		headlineImageUrl = try values.decodeIfPresent(String.self, forKey: .headlineImageUrl)
		articleImageUrl = try values.decodeIfPresent(String.self, forKey: .articleImageUrl)
		backgroundImageUrl = try values.decodeIfPresent(String.self, forKey: .backgroundImageUrl)
		videoType = try values.decodeIfPresent(String.self, forKey: .videoType)
		videoId = try values.decodeIfPresent(String.self, forKey: .videoId)
		videoUrl = try values.decodeIfPresent(String.self, forKey: .videoUrl)
		videoThumbnail = try values.decodeIfPresent(String.self, forKey: .videoThumbnail)
		newsKeywords = try values.decodeIfPresent(String.self, forKey: .newsKeywords)
		authors = try values.decodeIfPresent([Authors].self, forKey: .authors)
		instruments = try values.decodeIfPresent([String].self, forKey: .instruments)
		tags = try values.decodeIfPresent([String].self, forKey: .tags)
		categories = try values.decodeIfPresent([String].self, forKey: .categories)
		displayTimestamp = try values.decodeIfPresent(Int.self, forKey: .displayTimestamp)
		lastUpdatedTimestamp = try values.decodeIfPresent(Int.self, forKey: .lastUpdatedTimestamp)
	}

}
