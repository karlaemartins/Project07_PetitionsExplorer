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
    
    func loadPetitions(from urlString: String, completion: @escaping () -> Void) {
        
        service.fetchPetitions(from: urlString) { [weak self] petitions in
            guard let self = self else { return }
            
            if let petitions = petitions {
                self.petitions = petitions
            }
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}
