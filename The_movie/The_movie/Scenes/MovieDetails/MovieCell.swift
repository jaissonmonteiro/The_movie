//
//  MovieListCell.swift
//  The_movie
//
//  Created by  Jaisson Monteiro on 19/08/20.
//  Copyright © 2020  Jaisson Monteiro. All rights reserved.
//

import SwiftUI

struct MovieCell: View {
    
    @ObservedObject var services = MovieCellService()
    private let movieId: Int
    
    init(for movieId: Int) {
        self.movieId = movieId
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .top) {
                HStack(spacing: 16) {
                    Image(uiImage: self.services.image ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(Color.gray)
                        .frame(width: geometry.size.width / 5, height: geometry.size.height)
                    
                    VStack(alignment: .leading) {
                        Text(self.services.movieDetails?.original_title ?? "")
                            .fontWeight(.bold)
                        
                        Text(self.services.movieDetails?.genres.map({$0.name}).joined(separator: ", ") ?? "")
                
                    }
                }
                Spacer()
                
                Image(systemName: "checkmark.circle.fill")
            }
            .foregroundColor(Color.white)
        }
        .onAppear {
            self.services.getMovieDetails(for: self.movieId)
        }
    }
}

struct MovieListCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(for: 0)
            .background(Color.black)
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
