//
//  DataBaseService.swift
//  SimpleMVP
//
//  Created by Dmitriy Mirovodin on 18.02.2024.
//

import Foundation

// Пример сервиса для хранения данных

protocol DataBaseServiceProtocol {
    func storeData(value: String, completion: @escaping (Result<Void, Error>) -> ())
}

final class DataBaseService: DataBaseServiceProtocol {
    func storeData(value: String, completion: @escaping (Result<Void, Error>) -> ()) {        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            completion(.success(()))
        }
    }
}
