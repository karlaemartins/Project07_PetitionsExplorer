//
//  PetitionService.swift
//  Project07_PetitionsExplorer
//
//  Created by Karla E. Martins Fernandes on 16/03/26.
//

import Foundation


final class PetitionService {
    
    func fetchPetitions(from urlString: String, completion: @escaping ([Petition]?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Error fetching data:", error)
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            let decoder = JSONDecoder()
            
            if let response = try? decoder.decode(PetitionsResponse.self, from: data) {
                completion(response.results)
            } else {
                completion(nil)
            }
        }
        
        task.resume()
    }
}
