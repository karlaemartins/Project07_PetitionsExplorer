//
//  PetitionsViewModel.swift
//  Project07_PetitionsExplorer
//
//  Created by Karla E. Martins Fernandes on 16/03/26.
//

import Foundation

final class PetitionsViewModel {
    
    private let service = PetitionService()
    private(set) var petitions: [Petition] = []
    
    func loadPetitions(from urlString: String, completion: @escaping (Bool) -> Void) {
        
        service.fetchPetitions(from: urlString) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let petitions):
                self.petitions = petitions
                
                DispatchQueue.main.async {
                    completion(true)
                }
                
            case .failure:
                DispatchQueue.main.async {
                    completion(false)
                }
            }
        }
    }
}
