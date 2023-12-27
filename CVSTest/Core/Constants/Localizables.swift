//
//  Localizables.swift
//  CVSTest
//
//  Created by Саша Василенко on 27.12.2023.
//



struct Localizables {
    struct MainScreenStrings {
        static let movies = mainCatalog("MainScreenStrings.movies")
        static let sort = mainCatalog("MainScreenStrings.sort")
        static let onWatchlist = mainCatalog("MainScreenStrings.onWatchlist")
        static let title = mainCatalog("MainScreenStrings.title")
        
    }
    
    struct MovieDetailsStrings {
        static let removeFromWatchlist = mainCatalog("MovieDetailsStrings.removeFromWatchlist")
        static let addToWatchlist = mainCatalog("MovieDetailsStrings.addToWatchlist")
        static let watchTrailer = mainCatalog("MovieDetailsStrings.watchTrailer")
        static let shortDescription = mainCatalog("MovieDetailsStrings.shortDescription")
        static let details = mainCatalog("MovieDetailsStrings.details")
        static let genre = mainCatalog("MovieDetailsStrings.genre")
        static let releasedDate = mainCatalog("MovieDetailsStrings.releasedDate")
    }
}

fileprivate extension Localizables {
    static func mainCatalog(_ key: String.LocalizationValue) -> String {
        String(localized: key, table: "Localizable")
    }
}
