//
//  NetworkServiceImpl.swift
//  The_movie
//
//  Created by  Jaisson Monteiro on 20/08/20.
//  Copyright © 2020  Jaisson Monteiro. All rights reserved.
//

import Foundation
import UIKit

class NetworkService {
    
    func request(urlRequest: URLRequest, response: @escaping (Response) -> Void) {
        
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
    
    func loadImage(from url: URL, response: (UIImage?) -> Void) {
        
        guard let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
            response(nil)
            return
        }
        
        response(image)
    }
}
