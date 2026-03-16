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
    
    func loadPetitions(from urlString: String) {
        if let fetchedPetitions = service.fetchPetitions(from: urlString) {
            petitions = fetchedPetitions
        }
    }
}
