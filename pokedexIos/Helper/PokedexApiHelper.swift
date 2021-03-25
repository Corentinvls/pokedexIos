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
    
    // call URL for get data
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
    // get 20 pokémon (paginator)
    // return url with pokemonUrl model
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
    
    func getAllType(
        completion: @escaping (_ data:[TypeUrl], _ error:Error?) -> Void) {
        PokemonAPI().pokemonService.fetchTypeList(){
            result in
            var typeData: [TypeUrl] = []
            switch result {
            case .success(let types):
                for type in types.results! {
                    // Ajout de l'url dans le model pokemon url
                    typeData.append(TypeUrl.init(type: type)!)
                }
                completion(typeData,nil)
                break
            case .failure(let error):
                completion([],error)
                break
            }
        }
    }
    
    func getAllGameVersion(
        completion: @escaping (_ data:[GameVersionUrl], _ error:Error?) -> Void) {
        PokemonAPI().gameService.fetchVersionList(){
            result in
            var gameVersionData: [GameVersionUrl] = []
            switch result {
            case .success(let gameVersionsUrl):
                for gameVersionUrl in gameVersionsUrl.results! {
                    // Ajout de l'url dans le model pokemon url
                    gameVersionData.append(GameVersionUrl.init(gameVersionUrl: gameVersionUrl)!)
                }
                completion(gameVersionData,nil)
                break
            case .failure(let error):
                completion([],error)
                break
            }
        }
    }
    
    
    // Take one By one
    
    func getOnePokemonByName(
        pokeName:String,
        completion: @escaping (_ data:[PKMPokemon], _ error:Error?) -> Void) {
        PokemonAPI().pokemonService.fetchPokemon(pokeName){
            result in
            var pokemonData: [PKMPokemon] = []
            switch result {
            case .success(let pokemon):
                pokemonData.append(pokemon)
                completion(pokemonData,nil)
                break
            case .failure(let error):
                completion([],error)
                break
            }
        }
    }
  /*  func fetchPokemon(completion: @escaping ([PKMPokemon]) -> ()) {
        var pokemonArray = [PKMPokemon]()
        self.getAllPokemon {
            (pokemons, error) in
            for pokemon in pokemons {
               
                    let encodedPokemon = NSData(contentsOf: URL(string: pokemon.url)!)
    
                    var pkmPokemon: PKMPokemon?
                    do {
                        pkmPokemon = try JSONDecoder().decode(PKMPokemon.self, from: encodedPokemon! as Data)
                       } catch {
                           print("Error took place: \(error.localizedDescription).")
                       }
            
                    pokemonArray.append(pkmPokemon!)
                }
            completion(pokemonArray)
        }
    }*/
    func fetchPokemon(completion: @escaping ([AnyObject]) -> ()) {
        var pokemonArray = [AnyObject]()
        self.getAllPokemon {
            (pokemons, error) in
            for pokemon in pokemons {
                guard let url = URL(string: pokemon.url) else { return }
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                    if let error = error {
                    print("Failed to fetch data with error: ", error.localizedDescription)
                    return
                    }
            
                    guard let data = data else { return }
                    var pkmPokemon: AnyObject?
                    do {
                        pkmPokemon = try JSONSerialization.jsonObject(with: data, options: []) as AnyObject 
                        
                       } catch {
                           print("Error took place: \(error.localizedDescription).")
                       }
                    pokemonArray.append(pkmPokemon!)
                    completion(pokemonArray)
        }.resume()

    }
         
    }
}
            
    func getOneGameVersionByName(
        versionName:String,
        completion: @escaping (_ data:[GameVersion], _ error:Error?) -> Void) {
        PokemonAPI().gameService.fetchVersion(versionName){
            result in
            var gameVersionData: [GameVersion] = []
            switch result {
            case .success(let gameVersion):
                // Ajout de l'url dans le model pokemon url
                gameVersionData.append(GameVersion.init(gameVersion: gameVersion)!)
                completion(gameVersionData,nil)
                break
            case .failure(let error):
                completion([],error)
                break
            }
        }
    }
    
    
    func parseJSON(data: Data) -> PKMPokemon? {
        
        var returnValue: PKMPokemon?
        do {
            returnValue = try JSONDecoder().decode(PKMPokemon.self, from: data)
        } catch {
            print("Error took place: \(error.localizedDescription).")
        }
        
        return returnValue
    }
    /*
    func paginator(){
        // Example of calling a paginated web service with a pageLimit, then using the pagedObject to fetch the next page in the list
        PokemonAPI().utilityService.fetchLanguageList(paginationState: .initial(pageLimit: 5)) { result in
            switch result {
            case .success(let pagedLanguages):
                print("\(pagedLanguages.count!)") // 13

                PokemonAPI().utilityService.fetchLanguageList(paginationState: .continuing(pagedLanguages, .next)) { result in
                    switch result {
                    case .success(let pagedLanguagesNext):
                        print("Page: \(pagedLanguagesNext.currentPage)") // Page: 1
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
 */
}
