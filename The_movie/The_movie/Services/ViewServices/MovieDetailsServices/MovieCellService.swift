//
//  MovieCellService.swift
//  The_movie
//
//  Created by  Jaisson Monteiro on 20/08/20.
//  Copyright © 2020  Jaisson Monteiro. All rights reserved.
//

import Foundation
import UIKit

class MovieCellService: ObservableObject {
    
    @Published var image: UIImage?
    @Published var movieDetails: MovieDetailsModel?
    private let movieService = MovieService()
    
    func getMovieDetails(for movieId: Int) {
        self.movieService.getMovieDetails(for: movieId) { response in
            switch response {
            case .success(let networkResponse):
                
                DispatchQueue.main.async {
                    self.movieDetails = networkResponse.getData()
                    self.getImage(for: self.movieDetails?.poster_path ?? "")
                }
                
                
            case .failure(let message):
                print(message)
            }
        }
    }
    
    func getImage(for posterPath: String) {
        self.movieService.getImage(for: posterPath) { image in
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
