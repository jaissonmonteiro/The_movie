//
//  NetworkService.swift
//  The_movie
//
//  Created by  Jaisson Monteiro on 20/08/20.
//  Copyright © 2020  Jaisson Monteiro. All rights reserved.
//

import Foundation

protocol NetworkService {
    func request(endPoint: String, response: @escaping (Response) -> Void)
}
