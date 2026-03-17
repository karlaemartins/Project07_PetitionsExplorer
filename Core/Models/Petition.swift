//
//  File.swift
//  Project07_PetitionsExplorer
//
//  Created by Karla E. Martins Fernandes on 16/03/26.
//

import Foundation

struct Petition: Codable {
    let title: String
    let body: String
    let signatureCount: Int
}
