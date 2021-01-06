//
//  NetworkManagers.swift
//  GPProjects
//
//  Created by Mukhammadjon Askarov on 24/12/20.
//

import UIKit

class NetworkManager {
    static let shared           = NetworkManager()
    private let baseURL         = "https://api.github.com/"
   
    
    private init(){}
    
    func getProjects(for username: String, completed: @escaping(Result<[Projects], GPError>)-> Void){
        
        let endPoint = baseURL + "users/\(username)/repos"
       
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidUsername))
            
            return
        }
        
        var urlsRequest = URLRequest(url: url)
        urlsRequest.addValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        
        print(endPoint)
        let task = URLSession.shared.dataTask(with: urlsRequest) { data, response, error in
         
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let projects = try decoder.decode([Projects].self, from: data)
                completed(.success(projects))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    func getUserInfo(for username: String, completed: @escaping(Result<User, GPError>)-> Void){
        let endPoint = baseURL + "users/\(username)"
        
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
         
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode(User.self, from: data)
                completed(.success(user))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
}
