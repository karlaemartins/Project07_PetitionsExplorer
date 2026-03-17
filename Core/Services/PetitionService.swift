//
//  PetitionService.swift
//  Project07_PetitionsExplorer
//
//  Created by Karla E. Martins Fernandes on 16/03/26.
//

import Foundation


final class PetitionService {
    
    private let networkService = NetworkService()
    
    func fetchPetitions(from urlString: String, completion: @escaping (Result<[Petition], Error>) -> Void) {
        
        networkService.fetch(from: urlString) { (result: Result<PetitionsResponse, Error>) in
            
            switch result {
            case .success(let response):
                completion(.success(response.results))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
