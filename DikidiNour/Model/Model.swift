//
//  Model.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//
import Foundation

struct ResponseModel: Codable {
    let error: ErrorStruct
    let data: DataClass
}

struct DataClass: Codable {
    let title: String
    let image: String
    let catalogCount: String
    let blocks: BlocksStruct
    let order: [String]

    enum CodingKeys: String, CodingKey {
        case title
        case image
        case catalogCount = "catalog_count"
        case blocks
        case order
    }
}

struct BlocksStruct: Codable {
    let shares: SharesStruct
    let examples: String
    let catalog: [Catalog]
    let examples2: String
}

struct ErrorStruct: Codable {
    let code: Int
    let message: String?
}

struct SharesStruct: Codable {
    let list: [ShareItem]
    let count: String
}

struct ShareItem: Codable, Identifiable {
    let id: String
    let name: String
    let timeStart: String
    let timeStop: String
    let publicTimeStart: String
    let publicTimeStop: String
    let discountValue: String
    let view: String
    let usedCount: String
    let companyID: String
    let icon: String
    let companyName: String
    let companyStreet: String
    let companyHouse: String
    let companyImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case timeStart = "time_start"
        case timeStop = "time_stop"
        case publicTimeStart = "public_time_start"
        case publicTimeStop = "public_time_stop"
        case discountValue = "discount_value"
        case view
        case usedCount = "used_count"
        case companyID = "company_id"
        case icon
        case companyName = "company_name"
        case companyStreet = "company_street"
        case companyHouse = "company_house"
        case companyImage = "company_image"
    }
}

struct Catalog: Codable, Identifiable {
    let id: String
    let name: String
    let image: ImageStruct
    let street: String
    let house: String
    let schedule: ScheduleUnion
    let lat: String
    let lng: String
    let categories: [String]
    let categoriesCatalog: [String]
    let rating: Double
    let isMaster: Bool
    let award: String?
    let vipTariff: Bool
    let reviewCount: ReviewCount
    let backgrounds: [String]
    let currency: Currency
    let masterID: String?

    enum CodingKeys: String, CodingKey {
        case id, name, image, street, house, schedule, lat, lng, categories
        case categoriesCatalog = "categories_catalog"
        case rating, isMaster, award
        case vipTariff = "vip_tariff"
        case reviewCount = "reviewCount"
        case backgrounds, currency
        case masterID = "master_id"
    }
}

struct ImageStruct: Codable {
    let thumb: String
    let origin: String
}

struct Currency: Codable {
    let id: String
    let title: String
    let abbr: String
}

struct ScheduleElement: Codable {
    let day: String
    let workFrom: String
    let workTo: String

    enum CodingKeys: String, CodingKey {
        case day
        case workFrom = "work_from"
        case workTo = "work_to"
    }
}

enum ReviewCount: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(ReviewCount.self, DecodingError.Context(codingPath: decoder.codingPath, 
                                                                                 debugDescription: "Wrong type for ReviewCount"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

enum ScheduleUnion: Codable {
    case bool(Bool)
    case scheduleElementArray([ScheduleElement])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Bool.self) {
            self = .bool(x)
            return
        }
        if let x = try? container.decode([ScheduleElement].self) {
            self = .scheduleElementArray(x)
            return
        }
        throw DecodingError.typeMismatch(ScheduleUnion.self, DecodingError.Context(codingPath: decoder.codingPath, 
                                                                                   debugDescription: "Wrong type for ScheduleUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let x):
            try container.encode(x)
        case .scheduleElementArray(let x):
            try container.encode(x)
        }
    }
}
