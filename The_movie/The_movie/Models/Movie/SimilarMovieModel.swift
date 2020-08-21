//
//  SimilarMovieModel.swift
//  The_movie
//
//  Created by  Jaisson Monteiro on 20/08/20.
//  Copyright © 2020  Jaisson Monteiro. All rights reserved.
//

import Foundation

struct SimilarMovieModel: Decodable, Identifiable {
    let original_title: String
    let poster_path: String
    let genre_ids: [Int]
    let id: Int
}
