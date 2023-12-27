//
//  MovieDetailsView.swift
//  CVSTest
//
//  Created by Саша Василенко on 26.12.2023.
//

import SwiftUI
import ComposableArchitecture

struct MovieDetailsView: View {
    let store: StoreOf<MovieDetailsFeature>
    var body: some View {
        WithViewStore(self.store, observe: {$0}) { viewStore in
            ScrollView {
                Divider()
                VStack(alignment: .leading, spacing: CGFloatConstants.CGFloat15) {
                    HStack(alignment: .top, spacing: CGFloatConstants.CGFloat10) {
                        Image(viewStore.movie.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(CGFloatConstants.CGFloat5)
                            .shadow(radius: CGFloatConstants.CGFloat5)
                            .padding(CGFloatConstants.CGFloat5)
                        VStack(alignment: .leading, spacing: CGFloatConstants.CGFloat20) {
                            HStack {
                                Text(viewStore.movie.title)
                                    .applyStyle(.title)
                                Spacer()
                                Text((String(viewStore.movie.rating))).applyStyle(.title) + Text("/10").foregroundStyle(Color.gray)
                            }
                            Button(action: {
                                viewStore.send(.watchlistTapped)
                            }, label: {
                                Text(viewStore.movie.isInWatchlist ? Localizables.MovieDetailsStrings.removeFromWatchlist : Localizables.MovieDetailsStrings.addToWatchlist)
                            })
                            .buttonStyle(RoundedButtonStyle(backgroundColor: .gray))

                            Button(action: {
                                
                            }, label: {
                                Text(Localizables.MovieDetailsStrings.watchTrailer)
                            })
                            .buttonStyle(RoundedButtonStyle(backgroundColor: .clear))
                            .overlay {
                                RoundedRectangle(cornerRadius: CGFloatConstants.CGFloat25)
                                    .stroke(lineWidth: 2.0)
                            }
                        }
                    }
                    Divider()
                    Text(Localizables.MovieDetailsStrings.shortDescription)
                        .applyStyle(.title)
                    Text(viewStore.movie.desctiption)
                        .applyStyle(.regular)
                        .foregroundStyle(Color.gray)
                    Divider()
                    Text(Localizables.MovieDetailsStrings.details)
                        .applyStyle(.title)
                    
                    HStack(alignment: .firstTextBaseline) {
                        VStack(alignment: .trailing, spacing: CGFloatConstants.CGFloat10) {
                            Text(Localizables.MovieDetailsStrings.genre).applyStyle(.title)
                            Text(Localizables.MovieDetailsStrings.releasedDate).applyStyle(.title)
                        }
                        
                        VStack(alignment: .leading, spacing: CGFloatConstants.CGFloat15) {
                            Text(viewStore.movie.genre.joined(separator: ", "))
                               .applyStyle(.regular)
                               .foregroundStyle(Color.gray)
                            Text(viewStore.movie.releasedDate)
                                .applyStyle(.regular)
                                .foregroundStyle(Color.gray)
                        }
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .padding(.horizontal)
        }
    }
}

#Preview {
    MovieDetailsView(store: Store(initialState: MovieDetailsFeature.State(movie: MovieModel(image: .avengers, title: "Mock", desctiption: "Mocknjnjnjnjgnjdnskjfnskjdnfkjfdnsf djlksfnfsldkjndslksd jdsfkndslkjfdns ldsjndlkdnkflns sldf sjsldfsldjsd lfj sdlsd jlsdjndlskj dlkjsnl jkdnf lsjkdfn lsdjnsdjf lsdjfnldkjfnlsdknflej nlljslnd MockMock MockMock MockMockv MockMockv Mockvv MockMockMock Mock", rating: 5.0, duration: "Mock", genre: ["Mock", "Mock"], releasedDate: "Mock", trailerLink: "Mock", isInWatchlist: true)), reducer: {
        MovieDetailsFeature()
    }))
}
