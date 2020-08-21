//
//  Genre.swift
//  The_movie
//
//  Created by  Jaisson Monteiro on 20/08/20.
//  Copyright © 2020  Jaisson Monteiro. All rights reserved.
//

import Foundation

struct Genre: Decodable, Identifiable {
    let id: Int
    let name: String
}
