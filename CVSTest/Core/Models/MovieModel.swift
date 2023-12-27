//
//  MovieModel.swift
//  CVSTest
//
//  Created by Саша Василенко on 20.12.2023.
//

import Foundation
//Usualy I try not to import UI frameworks into model, but in this case it looks like simplest and not overengineered solution
import SwiftUI



struct MovieModel: Equatable, Identifiable, Hashable {
    let id = UUID()
    let image: ImageResource
    let title: String
    let desctiption: String
    let rating: Double
    let duration: String
    let genre: [String]
    let releasedDate: String
    let trailerLink: String
    var isInWatchlist: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
