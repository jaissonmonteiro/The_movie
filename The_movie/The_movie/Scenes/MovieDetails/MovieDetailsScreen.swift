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
    let movieId = 299536
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 0) {
                        
                        MovieDetailsImageView()
                            .frame(width: geometry.size.width, height: geometry.size.height / 2.3)
                        
                        MovieDetailsHeaderView(title: self.services.movieDetails?.original_title)
                            .background(Color.black.shadow(color: Color.black, radius: 30, x: 0, y: -20))
                        
                        VStack(spacing: 0) {
                            ForEach(0..<10) {_ in
                                MovieCell()
                                    .frame(height: geometry.size.width / 4)
                                    .padding()
                            }
                        }
                    }
                }
                
                
                Image(systemName: "chevron.left.circle.fill")
                    .resizable()
                    .frame(width: geometry.size.width / 12, height: geometry.size.width / 12)
                    .foregroundColor(Color.black)
                    .padding()
                
            }
            .foregroundColor(Color.white)
        }
        .onAppear {
            self.services.getMovieDetails(for: self.movieId)
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
