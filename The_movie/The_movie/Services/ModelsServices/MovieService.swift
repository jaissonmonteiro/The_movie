//
//  Movie.swift
//  The_movie
//
//  Created by  Jaisson Monteiro on 20/08/20.
//  Copyright © 2020  Jaisson Monteiro. All rights reserved.
//

import SwiftUI
import Foundation

class MovieService {
    
    private let networkService: NetworkService = NetworkService()
    private var networkConfiguration: NetworkConfiguration {
        get {
            return NetworkConfiguration.shared
        }
    }
    
    func getMovieDetails(for movieId: Int, response: @escaping (Response) -> Void) {
        var urlRequest = URLRequest(url: URL(string: self.networkConfiguration.baseURL + "/movie/\(movieId)")!)
        urlRequest.addValue(self.networkConfiguration.token, forHTTPHeaderField: "Authorization")
        
        self.networkService.request(urlRequest: urlRequest, response: response)
    }
    
    func getImage(for posterPath: String, response: @escaping (UIImage?) -> Void) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")!
        
        self.networkService.loadImage(from: url, response: response)
    }
    
    func getSimilarMovies(for movieId: Int, response: @escaping (Response) -> Void) {
        var urlRequest = URLRequest(url: URL(string: self.networkConfiguration.baseURL + "/movie/\(movieId)/similar")!)
        urlRequest.addValue(self.networkConfiguration.token, forHTTPHeaderField: "Authorization")
        
        self.networkService.request(urlRequest: urlRequest, response: response)
    }
}
