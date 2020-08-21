//
//  MovieModel.swift
//  The_movie
//
//  Created by  Jaisson Monteiro on 20/08/20.
//  Copyright © 2020  Jaisson Monteiro. All rights reserved.
//

import Foundation

struct MovieDetailsModel: Decodable {
    let original_title: String
    let vote_count: Int
    let popularity: Double
    let poster_path: String
    let genres: [Genre]
}
