//
//  NetworkResponse.swift
//  The_movie
//
//  Created by  Jaisson Monteiro on 20/08/20.
//  Copyright © 2020  Jaisson Monteiro. All rights reserved.
//

import Foundation

struct NetworkResponse {
    let statusCode: Int
    private let data: Data?
    
    init(statusCode: Int, data: Data?) {
        self.statusCode = statusCode
        self.data = data
    }
    
    func getData<Model: Decodable>() -> Model? {
        
        guard let data = self.data else {return nil}
        
        return try? JSONDecoder().decode(Model.self, from: data)
    }
}
