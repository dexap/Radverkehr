//
//  MeldungenResponseModel.swift
//  Radverkehr
//
//  Created by Benjamin Lassmann on 22.09.22.
//

import Foundation

class MeldungenViewModel: Codable, ObservableObject {

    let results: [Results]

    struct District: Codable {
        let name: String
    }

    struct WebImage: Codable {
        let uri: String
    }

    struct Results: Codable {
        let id: String
        let title: String
        let subtitle: String
        let status: Status?
        let description: String
        let holder: String
        let owner: String
        let image: WebImage?
        let imagesBefore: [WebImage?]
        let districts: [District]
    }

    enum Status: String, Codable {
        case abgeschlossen = "Abgeschlossen"
        case inBau = "in Bau"
        case inPlanung = "in Planung"
        case vorgesehen = "Vorgesehen"
        case unbekannt = "unbekannt"
    }
}
