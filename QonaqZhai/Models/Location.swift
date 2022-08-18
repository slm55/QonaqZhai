//
//  Location.swift
//  QonaqZhai
//
//  Created by Aslan Murat on 17.08.2022.
//

import Foundation

// MARK: - WelcomeElement
struct Location: Codable {
    let longitude: Double
    let name: String
    let region: String
    let latitude: Double
    let destType, destID: String
    let nrHotels: Int
    let country: String
    let cityName: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case longitude, latitude
        case region
        case name
        case destType = "dest_type"
        case destID = "dest_id"
        case nrHotels = "nr_hotels"
        case country
        case cityName = "city_name"
        case imageURL = "image_url"
    }
}

