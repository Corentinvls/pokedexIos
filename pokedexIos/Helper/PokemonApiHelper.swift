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
                    // Ajout de l'url dans le model pokemon url
                    pokemonsData.append(PokemonUrl.init(pokemon: pokemon)!)
                }
                completion(pokemonsData,nil)
                break
            case .failure(let error):
                completion([],error)
                break
            }
        }
    }
    
    func callUrl(
        url:String,
        completion: @escaping (_ data:[String:AnyObject], _ error:Error?) -> Void) {
        
        let url = URL(string: url)!
        URLSession.shared.dataTask(with: url)
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                if let data = json as? [String: AnyObject] {
                    if(error == nil){
                        completion(data,nil)
                    }
                    else{
                        completion([:],error)
                    }
                    
                }
                
            }
        })
        
        task.resume()
    }
    
    
}
