//
//  MovieDetailsScreen.swift
//  The_movie
//
//  Created by  Jaisson Monteiro on 19/08/20.
//  Copyright © 2020  Jaisson Monteiro. All rights reserved.
//

import SwiftUI

struct MovieDetailsScreen: View {
    
    @ObservedObject var services: MovieDetailsScreenService = MovieDetailsScreenService()
    let movieId = 9738
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 0) {
                        
                        MovieDetailsImageView(image: self.services.image)
                            .frame(width: geometry.size.width, height: geometry.size.height / 2.3)
                        
                        MovieDetailsHeaderView(for: self.services.movieDetails)
                            .background(Color.black.shadow(color: Color.black, radius: 30, x: 0, y: -20))
                        
                        VStack(spacing: 0) {
                            ForEach(self.services.similarMovies?.results ?? []) {similarMovie in
                                MovieCell(for: similarMovie.id)
                                    .frame(height: geometry.size.width / 4)
                                    .padding()
                            }
                        }
                    }
                }
                
                Image("arrow")
                    .resizable()
                    .frame(width: geometry.size.width / 12, height: geometry.size.width / 12)
                    .foregroundColor(Color.black)
                    .padding()
                    .opacity(0.8)
                    .onTapGesture {
                        print("voltar")
                    }
                
            }
            .foregroundColor(Color.white)
        }
        .onAppear {
            self.services.getMovieDetails(for: self.movieId)
            self.services.getSimilarMovies(for: self.movieId)
        }
    }
}

struct MovieDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieDetailsScreen()
                .background(Color.black)
            .previewDevice(.init(rawValue: "iPhone SE"))
            MovieDetailsScreen()
            .previewDevice(.init(stringLiteral: "iPhone 11"))
            MovieDetailsScreen()
            .previewDevice(.init(stringLiteral: "iPhone 8 Plus"))
        }
    }
}
