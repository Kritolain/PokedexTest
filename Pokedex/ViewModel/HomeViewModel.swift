//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Carolain Lenes Beltran on 10/11/19.
//  Copyright © 2019 Carolain Lenes Beltran. All rights reserved.
//

import Foundation
import UIKit


class HomeViewModel{
    
    var homeViewController : HomeViewController?
    var pokemonArray: [PokemonResult] = [PokemonResult]()
      var offset: Int = 0
    
    func getPokemonList(_ homeViewController : HomeViewController ){
        self.homeViewController = homeViewController
        Utils().showLoading()
        AlamofireREST.getPokemonListRequest(offset, completion: { (success, pokemonList, error) in
            if success {                
                DispatchQueue.main.async {
                    self.offset = self.offset + 20
                    if self.pokemonArray.isEmpty{
                        self.pokemonArray = pokemonList!
                    }else{
                        self.pokemonArray.append(contentsOf: pokemonList!)
                    }
                    self.homeViewController!.PokemonsTableView.reloadData()
                }
            }else{
               // Utils().showSnackbar("dontNotifications")
            }
            DispatchQueue.main.async {
                Utils().hiddenLoading()
            }
        })
    }
    
    
    //MARK: TABLEVIEW DELEGATE
    
    func createCellPokemons(_ tableView : UITableView, _ indexPath : IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier : "PokemonsTableViewCell" , for : indexPath ) as! PokemonsTableViewCell
        cell.loadDataPokemons(self.pokemonArray[indexPath.row])
        
        
        return cell
    }
    
    func didSelectCell(_ tableView : UITableView, indexPath : IndexPath){
        let cell = tableView.cellForRow(at: indexPath) as! PokemonsTableViewCell
        if let viewController = UIStoryboard(name: "PokedexPhone", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            viewController.pokemonInfoVO = cell.pokemonInfo!
            self.homeViewController!.present(viewController, animated: true, completion: nil)
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


