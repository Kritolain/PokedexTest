//
//  PokemonVO.swift
//  Pokedex
//
//  Created by Carolain Lenes Beltran on 10/11/19.
//  Copyright © 2019 Carolain Lenes Beltran. All rights reserved.
//

import Foundation

// MARK: - PokemonVO
struct PokemonVO: Codable {
    let count: Int?
    let next, previous: String?
    let results: [PokemonResult]?
}

// MARK: - Result
struct PokemonResult: Codable {
    let name: String?
    let url: String?
}
