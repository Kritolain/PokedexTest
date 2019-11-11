//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Carolain Lenes Beltran on 10/11/19.
//  Copyright © 2019 Carolain Lenes Beltran. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var contentInfoView: UIView!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var abilitieOneImage: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    var pokemonInfoVO : PokemonInfoVO?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurerView()
    }
    
    func configurerView(){
        self.contentInfoView.roundCorners([.topLeft, .topRight], radius: 25.0)
        let name = pokemonInfoVO?.name
        self.pokemonNameLabel.text = name!
        let type = self.pokemonInfoVO!.types![0].type?.name
        self.abilitieOneImage.image = Utils().pokemonDetailType(type!)
        self.descriptionTextView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam pretium sit amet sapien nec varius. Aliquam risus dui, varius quis ligula in, porttitor porttitor dolor. Integer felis est, egestas a egestas nec, rhoncus nec sapien. Nulla elementum ante neque, in rutrum nisi feugiat et. Donec quis cursus ligula, a posuere metus. Aliquam malesuada quam at elit tincidunt, sed mattis erat porttitor."
        
        guard let urlImage = self.pokemonInfoVO!.sprites?.frontDefault else {
            return
        }
        
        let url = URL(string: urlImage)
        self.pokemonImage.af_setImage(withURL: url!, placeholderImage: #imageLiteral(resourceName: "Normal"), filter: nil, imageTransition: UIImageView.ImageTransition.crossDissolve(0.5), runImageTransitionIfCached: true) { (response) in
            guard response.value != nil else {
                return
            }
            let image = response.value
            let size = CGSize(width: 200, height: 200)
            let scaledImage = image?.af_imageScaled(to: size)
            DispatchQueue.main.async {
                self.pokemonImage.image = scaledImage
            }
        }
    }
    
    //MARK: - IBAction
    
    @IBAction func backScreenButton(){
        self.dismiss(animated: true, completion: nil)
    }

}
