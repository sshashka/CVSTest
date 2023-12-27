//
//  MainScreenFeature.swift
//  CVSTest
//
//  Created by Саша Василенко on 20.12.2023.
//

import Foundation
import ComposableArchitecture
import SwiftUI

@Reducer
struct MainScreenFeature {
    struct State: Equatable {
        var movies: [MovieModel] = [
            MovieModel(
                image: .tenet, title: "Tenet",
                desctiption: "Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.",
                rating: 7.8,
                duration: "2h 30min",
                genre: ["Action", "Sci-Fi"],
                releasedDate: "3 September 2020",
                trailerLink: "https://www.youtube.com/watch?v=LdOM0x0XDMo", isInWatchlist: false
            ),
            MovieModel(
                image: .spiderMan, title: "Spider-Man: Into the Spider-Verse",
                desctiption: "Teen Miles Morales becomes the Spider-Man of his universe, and must join with five spider-powered individuals from other dimensions to stop a threat for all realities.",
                rating: 8.4,
                duration: "1h 57min",
                genre: ["Action", "Animation", "Adventure"],
                releasedDate: "14 December 2018",
                trailerLink: "https://www.youtube.com/watch?v=tg52up16eq0", isInWatchlist: false
            ),
            MovieModel(
                image: .knivesOut, title: "Knives Out",
                desctiption: "A detective investigates the death of a patriarch of an eccentric, combative family.",
                rating: 7.9,
                duration: "2h 10min",
                genre: ["Comedy", "Crime", "Drama"],
                releasedDate: "27 November 2019",
                trailerLink: "https://www.youtube.com/watch?v=qGqiHJTsRkQ", isInWatchlist: true
            ),
            MovieModel(
                image: .guardiansOfTheGalaxy, title: "Guardians of the Galaxy",
                desctiption: "A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.",
                rating: 8.0,
                duration: "2h 1min",
                genre: ["Action", "Adventure", "Comedy"],
                releasedDate: "1 August 2014",
                trailerLink: "https://www.youtube.com/watch?v=d96cjJhvlMA", isInWatchlist: false
            ),
            MovieModel(
                image: .avengers, title: "Avengers: Age of Ultron",
                desctiption: "When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and it's up to Earth's mightiest heroes to stop the villainous Ultron from enacting his terrible plan.",
                rating: 7.3,
                duration: "2h 21min",
                genre: ["Action", "Adventure", "Sci-Fi"],
                releasedDate: "1 May 2015",
                trailerLink: "https://www.youtube.com/watch?v=tmeOjFno6Do", isInWatchlist: false
            )
        ]
        var path = StackState<MovieDetailsFeature.State>()
        @PresentationState var destination: Destination.State?
    }
    
    enum Action {
        case sortButtonTapped
        case path(StackAction<MovieDetailsFeature.State, MovieDetailsFeature.Action>)
        case destination(PresentationAction<Destination.Action>)
        enum ConfirmationDialog: Equatable {
            case sortByName, sortByDate
        }
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .sortButtonTapped:
                state.destination = .confirmationDialog(.showDialog())
                return .none
                
            case let .path(.element(id: id, action: .delegate(.toggleWatchlist))):
                guard let detailState = state.path[id: id] else { return .none }
                if let index = state.movies.firstIndex(where: { $0.id == detailState.movie.id }) {
                    state.movies[index].isInWatchlist.toggle()
                }
                return .none
                
            case let .destination(.presented(.confirmationDialog(.sortByName))):
                let movies = state.movies
                state.movies = movies.sorted { $0.title < $1.title }
                return .none
                
            case let .destination(.presented(.confirmationDialog(.sortByDate))):
                let movies = state.movies
                state.movies = movies.sorted { $0.releasedDate < $1.releasedDate }
                return .none
                
            case .path:
                return .none
            case .destination:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination) {
            Destination()
        }
        .forEach(\.path, action: \.path) {
            MovieDetailsFeature()
        }
    }
}

extension ConfirmationDialogState where Action == MainScreenFeature.Action.ConfirmationDialog {
    static func showDialog() -> Self {
        ConfirmationDialogState(title: TextState(""), message: nil, buttons: [ButtonState.init(action: .send(.sortByName), label: {
            TextState(Localizables.MainScreenStrings.title)
        }), ButtonState.init(action: .send(.sortByDate), label: {
            TextState(Localizables.MovieDetailsStrings.releasedDate)
        })])
    }
}

extension MainScreenFeature {
    @Reducer
    struct Destination {
        enum State: Equatable {
            case confirmationDialog(ConfirmationDialogState<MainScreenFeature.Action.ConfirmationDialog>)
        }
        
        enum Action {
            case confirmationDialog(MainScreenFeature.Action.ConfirmationDialog)
        }
        
        var body: some ReducerOf<Self> {
            Reduce { state, action in
                return .none
            }
        }
    }
}
