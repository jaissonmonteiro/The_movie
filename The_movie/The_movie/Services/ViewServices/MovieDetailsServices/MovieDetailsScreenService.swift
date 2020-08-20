//
//  MovieDetailsScreenService.swift
//  The_movie
//
//  Created by  Jaisson Monteiro on 20/08/20.
//  Copyright © 2020  Jaisson Monteiro. All rights reserved.
//

import Foundation

struct MovieDetails: Decodable {
    let original_title: String
    
}

class MovieDetailsScreenService: ObservableObject {
    
    @Published var movieDetails: MovieDetails?
    
    private let networkService: NetworkService = NetworkServiceImpl()
    
    func getMovieDetails(for movieId: Int) {
        self.networkService.request(endPoint: "/movie/\(movieId)") { response in
            switch response {
            case .success(let networkResponse):
                
                DispatchQueue.main.async {
                    self.movieDetails = networkResponse.getData()
                }
                
            case .failure(let message):
                print(message)
            }
        }
    }
}
