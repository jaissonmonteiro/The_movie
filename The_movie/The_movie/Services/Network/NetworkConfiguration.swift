//
//  NetworkVariables.swift
//  The_movie
//
//  Created by  Jaisson Monteiro on 20/08/20.
//  Copyright © 2020  Jaisson Monteiro. All rights reserved.
//

import Foundation

struct NetworkConfiguration {
    
    static let shared = NetworkConfiguration()
    let baseURL: String = "https://api.themoviedb.org/3"
    let token: String = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhN2Y0ZDg2OTg4ZmYzNTZhMjNlMTQyYjc1MjMxZjEyMyIsInN1YiI6IjVmM2U3NTEwYzE3NWIyMDAzNDVjMGM3ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.s1f2i0c00xF7KnbxYAkAXo423DZoKMfQsO_jRJqLa-M"
}
