//
//  HomeViewController.swift
//  Pokedex
//
//  Created by Carolain Lenes Beltran on 10/11/19.
//  Copyright © 2019 Carolain Lenes Beltran. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
      // MARK: - Outles
    @IBOutlet weak var PokemonsTableView: UITableView!
    @IBOutlet weak var heightHeaderSettingsConstraint: NSLayoutConstraint!
    
    // MARK: - Variables
      var homeViewModel : HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurerView()
    }
    
    func configurerView(){
        // screenHeight > 65
        if(Utils().screenHeight >= 812){
            self.heightHeaderSettingsConstraint.constant = 85
        }
        
        homeViewModel.getPokemonList(self)
    }
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    
    //MARK: TABLEVIEW DELEGATE
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.pokemonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return homeViewModel.createCellPokemons(tableView, indexPath)
    }
    
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath){
        homeViewModel.didSelectCell(tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView,heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension
    }
    
    // Delete tebleView_cell
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            
        
        }
    }
}

