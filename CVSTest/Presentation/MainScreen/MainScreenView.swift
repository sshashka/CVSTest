//
//  MainScreenView.swift
//  CVSTest
//
//  Created by Саша Василенко on 21.12.2023.
//

import SwiftUI
import ComposableArchitecture

struct MainScreenView: View {
    let store: StoreOf<MainScreenFeature>
    
    var body: some View {
        NavigationStackStore(self.store.scope(state: \.path, action: \.path)) {
            WithViewStore(self.store, observe: {$0}) { viewStore in
                ScrollView {
                    LazyVStack {
                        ForEach(viewStore.movies, id: \.self) { movie in
                            NavigationLink(state: MovieDetailsFeature.State(movie: movie)) {
                                MovieCellView(image: movie.image, title: movie.title, durationAndGenres: movie.duration, isInWatchlist: movie.isInWatchlist)
                            }.buttonStyle(.plain)
                            Divider()
                                .padding(.horizontal)
                        }
                    }
                }
                .confirmationDialog(
                                    store: self.store.scope(
                                        state: \.$destination,
                                        action: { .destination($0) }),
                                    state: /MainScreenFeature.Destination.State.confirmationDialog,
                                    action: MainScreenFeature.Destination.Action.confirmationDialog
                )
                .navigationTitle(Localizables.MainScreenStrings.movies)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            viewStore.send(.sortButtonTapped)
                        } label: {
                            Text(Localizables.MainScreenStrings.sort)
                                .foregroundStyle(Color.black)
                        }
                    }
                }
            }
        } destination: { store in
            MovieDetailsView(store: store)
        }
    }
}

#Preview {
    MainScreenView(store: Store(initialState: MainScreenFeature.State(), reducer: {
        MainScreenFeature()
    }))
}
