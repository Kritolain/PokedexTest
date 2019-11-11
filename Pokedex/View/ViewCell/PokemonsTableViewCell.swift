//
//  PokemonsTableViewCell.swift
//  Pokedex
//
//  Created by Carolain Lenes Beltran on 10/11/19.
//  Copyright © 2019 Carolain Lenes Beltran. All rights reserved.
//

import UIKit
import AlamofireImage

class PokemonsTableViewCell: UITableViewCell {

     // MARK: - Outles
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    @IBOutlet weak var baseExperienceLabel: UILabel!
    
    @IBOutlet weak var abilitieOneImage: UIImageView!
    
    @IBOutlet weak var abilitiesTwoLabel: UIImageView!
    
    var pokemonInfo : PokemonInfoVO?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func loadDataPokemons(_ pokemonVO : PokemonResult){
        self.pokemonNameLabel.text = pokemonVO.name
        self.getPokemonInfo(pokemonVO.name!)
    }
    
    func getPokemonInfo(_ pokemonName : String){
        AlamofireREST.getPokemonInfo(pokemonName, completion: { (success, pokemonInfo, error) in
            if success {
                DispatchQueue.main.async {
                    self.pokemonInfo = pokemonInfo!
                    self.updateUI()
                }
            }else{
                self.getPokemonInfo(pokemonName)
            }
        })
    }
    
    func updateUI(){
        self.baseExperienceLabel.text = String(self.pokemonInfo!.baseExperience!)
        var pokemonCount : Int = 0
        for type in self.pokemonInfo!.types! {
            if pokemonCount <= 1{
                let name = type.type?.name!
                if(pokemonCount == 0){
                    self.abilitiesTwoLabel.image = Utils().pokemonType(name!)
                }else{
                    self.abilitieOneImage.image = Utils().pokemonType(name!)
                }
            }else{
                break
            }
            pokemonCount += 1
        }
        
        guard let urlImage = self.pokemonInfo!.sprites?.frontDefault else {
            return
        }
    
        let url = URL(string: urlImage)
        self.pokemonImage.af_setImage(withURL: url!, placeholderImage: #imageLiteral(resourceName: "Normal"), filter: nil, imageTransition: UIImageView.ImageTransition.crossDissolve(0.5), runImageTransitionIfCached: true) { (response) in
            guard response.value != nil else {
                return
            }
            let image = response.value
            let size = CGSize(width: 100, height: 100)
            let scaledImage = image?.af_imageScaled(to: size)
            DispatchQueue.main.async {
                self.pokemonImage.image = scaledImage
            }
        }
        
    }

}
