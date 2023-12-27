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
                                    .font(.system(size: CGFloatConstants.CGFloat20, weight: .bold))
                                Spacer()
                                Text((String(viewStore.movie.rating))).font(.system(size: CGFloatConstants.CGFloat25, weight: .bold)) + Text("/10").foregroundStyle(Color.gray)
                            }
                            Button(action: {
                                viewStore.send(.watchlistTapped)
                            }, label: {
                                Text(viewStore.movie.isInWatchlist ? "Remove from watchlist" : "Add to watchlist")
                            })
                            .buttonStyle(RoundedButtonStyle(backgroundColor: .gray))

                            Button(action: {
                                
                            }, label: {
                                Text("Watch trailer")
                            })
                            .buttonStyle(RoundedButtonStyle(backgroundColor: .clear))
                            .overlay {
                                RoundedRectangle(cornerRadius: CGFloatConstants.CGFloat25)
                                    .stroke(lineWidth: 2.0)
                            }
                        }
                    }
                    Divider()
                    Text("Short desctiption")
                        .font(.system(size: CGFloatConstants.CGFloat20, weight: .bold))
                    Text(viewStore.movie.desctiption)
                        .font(.system(size: CGFloatConstants.CGFloat15, weight: .regular)).foregroundStyle(Color.gray)
                    Divider()
                    Text("Details")
                        .font(.system(size: CGFloatConstants.CGFloat20, weight: .bold))
            
                    VStack(spacing: CGFloatConstants.CGFloat10) {
                        Text("Genre ").font(.system(size: CGFloatConstants.CGFloat20, weight: .bold)) + Text(viewStore.movie.genre.joined(separator: ", ")).font(.system(size: CGFloatConstants.CGFloat15, weight: .regular)).foregroundStyle(Color.gray)
                        Text("Released date ").font(.system(size: CGFloatConstants.CGFloat20, weight: .bold)) + Text(viewStore.movie.releasedDate).font(.system(size: CGFloatConstants.CGFloat15, weight: .regular)).foregroundStyle(Color.gray)
                    }
                    
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .padding(.horizontal)
        }
    }
}

#Preview {
    MovieDetailsView(store: Store(initialState: MovieDetailsFeature.State(movie: MovieModel(image: .avengers, title: "Mock", desctiption: "Mocknjnjnjnjgnjdnskjfnskjdnfkjfdnsf djlksfnfsldkjndslksd jdsfkndslkjfdns ldsjndlkdnkflns sldf sjsldfsldjsd lfj sdlsd jlsdjndlskj dlkjsnl jkdnf lsjkdfn lsdjnsdjf lsdjfnldkjfnlsdknflej nlljslnd MockMock MockMock MockMockv MockMockv Mockvv MockMockMock Mock", rating: 5.0, duration: "Mock", genre: ["Mock", "Mock"], releasedDate: "Mockjjknkjnk", trailerLink: "Mock", isInWatchlist: true)), reducer: {
        MovieDetailsFeature()
    }))
}
