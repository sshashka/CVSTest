//
//  MovieDetailsFeature.swift
//  CVSTest
//
//  Created by Саша Василенко on 20.12.2023.
//

import Foundation
import ComposableArchitecture

@Reducer
struct MovieDetailsFeature {
    struct State: Equatable {
        var movie: MovieModel
    }
    
    enum Action {
        case watchlistTapped
        case delegate(Delegate)
        
        enum Delegate {
            case toggleWatchlist
        }
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .watchlistTapped:
                state.movie.isInWatchlist.toggle()
                return .run { send in
                    await send(.delegate(.toggleWatchlist))
                }
            
            case .delegate:
                return .none
            }
        }
    }
    
    
}
