//
//  MeldungenResponseModel.swift
//  Radverkehr
//
//  Created by Benjamin Lassmann on 22.09.22.
//

import Foundation

struct MeldungenResponseModel: Codable {

    let results: [Results]

    struct WebImage: Codable {
        let url: String
    }

    struct Results: Codable {
        let id: String
        let title: String
        let subtitle: String
        let status: String
        let description: String
        let holder: String
        let owner: String
        let dateStart: String
        let dateEnd: String
        let image: WebImage?
        let imagesBefore: [WebImage?]?
    }

}
