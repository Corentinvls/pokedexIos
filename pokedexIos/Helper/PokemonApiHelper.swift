//
//  PokedexApiHelper.swift
//  pokedexIos
//
//  Created by Lexo on 23/03/2021.
//

import Foundation
import PokemonAPI

class PokedexApiHelper {
    
    static let shared = PokedexApiHelper()
    
    private init() {}
    
    func getAllPokemon(
        completion: @escaping (_ data:[PokemonUrl], _ error:Error?) -> Void) {
            PokemonAPI().pokemonService.fetchPokemonList(){
            result in
                var pokemonsData: [PokemonUrl] = []
            switch result {
                case .success(let pokemons):
                    for pokemon in pokemons.results! {
                        pokemonsData.append(PokemonUrl.init(pokemon: pokemon)!)
                    }
                    completion(pokemonsData, nil)
                    break
                case .failure(let error):
                    completion([],error)
                    break
            }
        }
    }
    
    func test(url:String){
        let url = URL(string: url)!
        URLSession.shared.dataTask(with: url)
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            print(data)
        })

        task.resume()
    }

}
