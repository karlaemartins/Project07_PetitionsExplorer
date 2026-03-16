//
//  PetitionService.swift
//  Project07_PetitionsExplorer
//
//  Created by Karla E. Martins Fernandes on 16/03/26.
//

import Foundation


final class PetitionService {
    
    func fetchPetitions(from urlString: String) -> [Petition]? {
        
        guard let url = URL(string: urlString) else { return nil }
        
        guard let data = try? Data(contentsOf: url) else { return nil }
        
        let decoder = JSONDecoder()
        
        if let response = try? decoder.decode(PetitionsResponse.self, from: data) {
            return response.results
        }
        
        return nil
    }

}
