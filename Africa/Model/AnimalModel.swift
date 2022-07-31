//
//  AnimalModel.swift
//  Africa
//
//  Created by Naman Vaishnav on 31/07/22.
//

struct Animal: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
