//
//  NetworkServiceImpl.swift
//  The_movie
//
//  Created by  Jaisson Monteiro on 20/08/20.
//  Copyright © 2020  Jaisson Monteiro. All rights reserved.
//

import Foundation

class NetworkServiceImpl: NetworkService {
    
    private let baseURL: String = "https://api.themoviedb.org/3"
    private let token: String = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhN2Y0ZDg2OTg4ZmYzNTZhMjNlMTQyYjc1MjMxZjEyMyIsInN1YiI6IjVmM2U3NTEwYzE3NWIyMDAzNDVjMGM3ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.s1f2i0c00xF7KnbxYAkAXo423DZoKMfQsO_jRJqLa-M"
    
    func request(endPoint: String, response: @escaping (Response) -> Void) {
        var urlRequest = URLRequest(url: URL(string: self.baseURL + endPoint)!)
        urlRequest.addValue(self.token, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: urlRequest) { (data, networkResponse, error) in
            
            if error != nil {
                response(.failure(message: "Não foi possível se conectar na rede. Verifique sua conexão com a internet!"))
            } else {
                
                guard let httpResponse: HTTPURLResponse = networkResponse as? HTTPURLResponse else {
                    response(.failure(message: "Ocorreu um erro desconhecido!"))
                    return
                }
                
                response(.success(networkResponse: NetworkResponse(statusCode: httpResponse.statusCode, data: data)))
            }
            
        }
        .resume()
    }
}
