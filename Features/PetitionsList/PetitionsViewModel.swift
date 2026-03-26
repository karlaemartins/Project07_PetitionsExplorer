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
    private var allPetitions: [Petition] = []
    
    func loadPetitions(from urlString: String, completion: @escaping (Bool) -> Void) {
        
        service.fetchPetitions(from: urlString) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let petitions):
                self.petitions = petitions
                self.allPetitions = petitions
                completion(true)
                
            case .failure:
                completion(false)
            }
        }
    }
    
    func filterPetitions(by keyword: String) {
        
        if keyword.isEmpty {
            petitions = allPetitions
            return
        }
        
        petitions = allPetitions.filter {
            $0.title.localizedCaseInsensitiveContains(keyword) ||
            $0.body.localizedCaseInsensitiveContains(keyword)
        }
    }
}
