//
//  RestService.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.
//

import Foundation

// Пример сервиса Rest

protocol RestServiceProtocol {
    func requestData(completion: @escaping (Result<String, Error>) -> ())
}

final class RestService: RestServiceProtocol {
    func requestData(completion: @escaping (Result<String, Error>) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(.success("Hello world"))
        }
    }
}
