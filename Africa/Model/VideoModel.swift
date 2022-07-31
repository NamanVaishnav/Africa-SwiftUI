//
//  VideoModel.swift
//  Africa
//
//  Created by Naman Vaishnav on 31/07/22.
//

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed property
    var thumbnail: String {
        "video-\(id)"
    }
}
