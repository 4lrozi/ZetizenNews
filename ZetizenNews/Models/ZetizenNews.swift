//
//  ZetizenNews.swift
//  ZetizenNews
//
//  Created by DDL11 on 18/08/23.
//

import Foundation

struct ZetizenNewsResponse: Codable {
    var message: String
    var total: Int
    var data: [ZetizenNewsItem]
}

struct ZetizenNewsItem: Identifiable, Codable {
    var id: UUID = UUID()
    var creator: String
    var title: String
    var link: String
    var content: String
    var categories: [String]
    var isoDate: String
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case creator
        case title
        case link
        case content
        case categories
        case isoDate
        case image
    }
}
