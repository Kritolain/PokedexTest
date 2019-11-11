//
//  AlamofireRest.swift
//  Pokedex
//
//  Created by Carolain Lenes Beltran on 10/11/19.
//  Copyright © 2019 Carolain Lenes Beltran. All rights reserved.
//

import Foundation
import Alamofire


open class AlamofireREST{
    
    //Funtions
    static func parametersRequest(_ methodFunction : String, _ parameters : [String: Any]?, _ requestType : String) -> URLRequest{
        
        let url = Globals().urlApi + methodFunction
        var urlRequest = URLRequest(url: URL(string: url)!)
        urlRequest.httpMethod = requestType
        urlRequest.addValue( "application/json" , forHTTPHeaderField: "Content-Type")
        
        if parameters != nil{
            do {
                let jsonData = try? JSONSerialization.data(withJSONObject: parameters!)
                urlRequest.httpBody = jsonData
            }
        }
        
        return urlRequest
    }
    
    // getList Request
    
    static func getPokemonListRequest(_ offsetInt: Int, completion: @escaping (Bool,[PokemonResult]?, NSError?) -> Void){
        let url = "pokemon?offset=" + String(offsetInt) + "&limit=" + "20"
        let urlRequest = self.parametersRequest(url, nil, HTTPMethod.get.rawValue)
        Alamofire.request(urlRequest).responseJSON{
            response in
            let statusCode = response.response?.statusCode
            print("Status Code", statusCode ?? Int())
            switch response.result{
                
            case .success(_):
                
                if let httpStatusCode = response.response?.statusCode {
                    switch(httpStatusCode) {
                    case 200:
                        guard let pokemons = try? JSONDecoder().decode(PokemonVO.self, from: response.data!) else{
                            completion(false, nil,nil)
                            return
                        }
                        completion(true, pokemons.results,nil)
                        break
                    case 400:
                        completion(false, nil, response.error! as NSError)
                        break
                    case 500:
                        completion(false, nil,response.error! as NSError)
                        break
                    default: break
                        
                    }
                } else {
                    completion(false, nil,response.error! as NSError)
                }
            case .failure(let error):
                print(error)
                completion(false, nil, error as NSError)
            }
            
        }
    }
    
    static func getPokemonInfo(_ pokemonName: String, completion: @escaping (Bool, PokemonInfoVO?, NSError?) -> Void){
        let url = "pokemon/" + pokemonName
        let urlRequest = self.parametersRequest(url, nil, HTTPMethod.get.rawValue)
        Alamofire.request(urlRequest).responseJSON{
            response in
            let statusCode = response.response?.statusCode
            print("Status Code", statusCode ?? Int())
            switch response.result{
                
            case .success(_):
                
                if let httpStatusCode = response.response?.statusCode {
                    switch(httpStatusCode) {
                    case 200:
                        guard let pokemons = try? JSONDecoder().decode(PokemonInfoVO.self, from: response.data!) else{
                            completion(false, nil,nil)
                            return
                        }
                        completion(true, pokemons,nil)
                        break
                    case 400:
                        completion(false, nil, response.error! as NSError)
                        break
                    case 500:
                        completion(false, nil,response.error! as NSError)
                        break
                    default: break
                        
                    }
                } else {
                    completion(false, nil,response.error! as NSError)
                }
            case .failure(let error):
                print(error)
                completion(false, nil, error as NSError)
            }
            
        }
    }
    
}
