//
//  NetworkModel.swift
//  SuperHerosDragonBall
//
//  Created by Natalia Camero on 28/9/23.
//

import Foundation

enum NetworkError: Error, Equatable {
    case unknown
    case malformedUrl
    case decodingFailed
    case encodedFailed
    case noData
    case statusCode(code: Int?)
    case noToken
}

extension NetworkError {
    static func error(for code: Int) -> NetworkError? {
        switch code {
        case 0: return .statusCode(code: nil)
        case 1: return .malformedUrl
        case 2: return .noData
        case 3: return .statusCode(code: 400)
        case 4: return .decodingFailed
        case 5: return .unknown
        default: return nil
        }
    }
}

protocol APIClientProtocol {
    var session: URLSession { get }
    func request<T: Decodable>(_ request: URLRequest, using: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void)
    func jwt(_ request: URLRequest, completion: @escaping (Result<String, NetworkError>) -> Void)
}

struct APIClient: APIClientProtocol {
    static let shared = APIClient()

    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func jwt(
        _ request: URLRequest,
        completion: @escaping (Result<String, NetworkError>) -> Void
    ) {
        let task = session.dataTask(with: request) { data, response, error in
            let result: Result<String, NetworkError>
            
            defer {
                completion(result)
            }

            guard error == nil else {
                if let error = error as? NSError, let error = NetworkError.error(for: error.code) {
                    result = .failure(error)
                } else {
                    result = .failure(.unknown)
                }
                return
            }
            
            guard let data = data else {
                result = .failure(.noData)
                return
            }
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                result = .failure(.statusCode(code: (response as? HTTPURLResponse)?.statusCode))
                return
            }
            
            guard let response = String(data: data, encoding: .utf8) else {
                result = .failure(.decodingFailed)
                return
            }
            result = .success(response)
        }
        
        task.resume()
    }
    
    func request<T: Decodable>(
        _ request: URLRequest,
        using: T.Type,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        let task = session.dataTask(with: request) { data, response, error in
            let result: Result<T, NetworkError>
            
            defer {
                completion(result)
            }

            guard error == nil else {
                if let error = error as? NSError, let error = NetworkError.error(for: error.code) {
                    result = .failure(error)
                } else {
                    result = .failure(.unknown)
                }
                return
            }
            
            guard let data = data else {
                result = .failure(.noData)
                return
            }
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                result = .failure(.statusCode(code: (response as? HTTPURLResponse)?.statusCode))
                return
            }
            
            guard let response = try? JSONDecoder().decode(using, from: data) else {
                result = .failure(.decodingFailed)
                return
            }
            result = .success(response)
        }
        
        task.resume()
    }
}


final class NetworkModel {
    
    private var token: String? {
        get {
            if let token = LocalDataModel.getToken() {
                return token
            }
            return nil
        }
        
        set {
            if let token = newValue {
                LocalDataModel.save(token: token)
            }
        }
    }

    private var baseComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "dragonball.keepcoding.education"
        return components
    }
    
    private let client: APIClientProtocol
    
    init(
        client: APIClientProtocol = APIClient.shared
    ) {
        self.client = client
    }
    
    func login(
        user: String,
        password: String,
        completion: @escaping (Result<String, NetworkError>) -> Void
    ) {
        var components = baseComponents
        components.path = "/api/auth/login"
        
        guard let url = components.url else {
            completion(.failure(.malformedUrl))
            return
        }
        // user:password
        let loginString = String(format: "%@:%@", user, password)
        guard let loginData = loginString.data(using: .utf8) else {
            completion(.failure(.decodingFailed) )
            return
        }
        
        let base64LoginString = loginData.base64EncodedString()
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard error == nil else {
                completion(.failure(.unknown))
                return
            }
            guard let data else {
                completion(.failure(.noData))
                return
            }
            
            let urlResponse = response as? HTTPURLResponse
            let statusCode = urlResponse?.statusCode
            
            guard statusCode == 200 else {
                completion(.failure(.statusCode(code: statusCode)) )
                return
            }
            
            guard let token = String(data: data, encoding: .utf8) else {
                completion(.failure(.decodingFailed))
                return
            }
            
            completion(.success(token))
            self?.token = token
            
        } //Es un objeto cuyo ciclo de vida va a ser el mismo de el app
        
        task.resume()
    }
    
    func getHeroes(
        completion: @escaping (Result<[Hero], NetworkError>) -> Void
    ) {
        var components = baseComponents
        components.path = "/api/heros/all"
        
        guard let url = components.url else {
            completion(.failure(.malformedUrl))
            return
        }
        
        guard let token else {
            completion(.failure(.noToken))
            return
        }
        
        var urlComponents = URLComponents()
        urlComponents.queryItems = [URLQueryItem(name: "name", value: "")]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = urlComponents.query?.data(using: .utf8)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        createTask(for: request,
                   using: [Hero].self,
                   completion: completion
        )
    }
    
    func getTransformations(
        for hero: Hero,
        completion: @escaping (Result<[Transformation], NetworkError>) -> Void
    ) {
        var components = baseComponents
        components.path = "/api/heros/tranformations"
        
        guard let url = components.url else {
            completion(.failure(.malformedUrl))
            return
        }
        
        guard let token else {
            completion(.failure(.noToken))
            return
        }
        
        var urlComponents = URLComponents()
        urlComponents.queryItems = [URLQueryItem(name: "id", value: hero.id)]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = urlComponents.query?.data(using: .utf8)
        createTask(for: request,
                   using: [Transformation].self,
                   completion: completion
        )
    }
    
    func createTask<T: Decodable>(
        for request: URLRequest,
        using type: T.Type,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
        
            var result: Result<T, NetworkError>
            
            defer {
                completion(result)
            }
            
            guard error == nil else {
                result = .failure(.unknown)
                return
            }
            
            guard let data else {
                print("No se recibió data")
                result = .failure(.noData)
                return
            }
            
            guard let resource = try? JSONDecoder().decode(type, from: data) else {
                print("Error al decodificar los datos")
                result = .failure(.decodingFailed)
                return
            }
            
            result = .success(resource)
        }
        
        task.resume()
    }
    
}
