//
//  VideoModel.swift
//  Africa
//
//  Created by Jimmy Ghelani on 2023-09-28.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
