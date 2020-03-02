//
//  Source.swift
//  HW2.10
//
//  Created by Алексей Маслобоев on 02.03.2020.
//  Copyright © 2020 Алексей Маслобоев. All rights reserved.
//

import Foundation

class Source {
    
    let type: SourceType
    let title: String
    let url: String
    
    init(type: SourceType, title: String, url: String) {
        self.type = type
        self.title = title
        self.url = url
    }
    
    func getItems(from data: Data) -> [DataProtocol] {
        
        do {
            let decoder = JSONDecoder()
            var list: ListProtocol?
            switch type {
                case .cocktail:
                    list = try decoder.decode(CocktailList.self, from: data)
                case .delish:
                    list = try decoder.decode(DishList.self, from: data)
                default:
                    list = try decoder.decode(PokemonList.self, from: data)
            }
            return list?.items ?? []
        } catch let error {
            print(error)
        }
        return []
    }
}

enum SourceType {
    case cocktail
    case delish
    case pokemon
}
