//
//  MovieCellView.swift
//  CVSTest
//
//  Created by Саша Василенко on 20.12.2023.
//

import SwiftUI

struct MovieCellView: View {
    let image: ImageResource
    let title: String
    let durationAndGenres: String
    let isInWatchlist: Bool
    var body: some View {
        HStack(spacing: CGFloatConstants.CGFloat25) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(CGFloatConstants.CGFloat5)
                .frame(width: 100, height: 150)
                .fixedSize()
            VStack(alignment: .leading, spacing: CGFloatConstants.CGFloat10) {
                Text(title)
                    .applyTextStyle(.title)
                Text(durationAndGenres)
                    .applyTextStyle(.grayText)
                if isInWatchlist {
                    Spacer()
                    Text("ON MY WATCHLIST")
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            
            Spacer(minLength: 0)
        }.padding()
    }
}

#Preview {
    MovieCellView(image: .avengers, title: "Avengers(2020)", durationAndGenres: "2h 21min - Action, Sci-fi", isInWatchlist: true)
}
