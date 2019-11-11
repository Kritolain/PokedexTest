//
//  File.swift
//  Pokedex
//
//  Created by Carolain Lenes Beltran on 10/11/19.
//  Copyright © 2019 Carolain Lenes Beltran. All rights reserved.
//

import Foundation
import KVNProgress

class Utils {


 // Show Load Indicator !!
 func showLoading() {
     DispatchQueue.main.async {
         KVNProgress.show()
     }
 }
 
 func hiddenLoading(){
     KVNProgress.dismiss()
 }
    
 // Screen height.
 public var screenHeight: CGFloat {
         return UIScreen.main.bounds.height
     }
    
    func pokemonType(_ pokemonType : String) -> UIImage{
        var pokemonTypeImage : UIImage = UIImage()
        switch pokemonType {
        case "normal":
            pokemonTypeImage = #imageLiteral(resourceName: "Normal")
        case "fighting":
            pokemonTypeImage = #imageLiteral(resourceName: "Fight")
        case "flying":
            pokemonTypeImage = #imageLiteral(resourceName: "Flying")
        case "poison":
            pokemonTypeImage = #imageLiteral(resourceName: "Poison")
        case "ground":
            pokemonTypeImage = #imageLiteral(resourceName: "Ground")
        case "rock":
            pokemonTypeImage = #imageLiteral(resourceName: "Rock")
        case "bug":
            pokemonTypeImage = #imageLiteral(resourceName: "Bug")
        case "ghost":
            pokemonTypeImage = #imageLiteral(resourceName: "Ghost")
        case "steel":
            pokemonTypeImage = #imageLiteral(resourceName: "Steel")
        case "fire":
            pokemonTypeImage = #imageLiteral(resourceName: "Fire")
        case "water":
            pokemonTypeImage = #imageLiteral(resourceName: "Water")
        case "grass":
            pokemonTypeImage = #imageLiteral(resourceName: "Grass")
        case "electric":
            pokemonTypeImage = #imageLiteral(resourceName: "Electric")
        case "psychic":
            pokemonTypeImage = #imageLiteral(resourceName: "Psychic")
        case "ice":
            pokemonTypeImage = #imageLiteral(resourceName: "Ice")
        case "dragon":
            pokemonTypeImage = #imageLiteral(resourceName: "Dragon")
        case "dark":
            pokemonTypeImage = #imageLiteral(resourceName: "Dark")
        case "fairy":
            pokemonTypeImage = #imageLiteral(resourceName: "Fairy")
        case "shadow":
            pokemonTypeImage = #imageLiteral(resourceName: "Grass")
        default:
            pokemonTypeImage = #imageLiteral(resourceName: "Normal")
        }
        return pokemonTypeImage
    }
    
    func pokemonDetailType(_ pokemonType : String) -> UIImage{
        var pokemonTypeImage : UIImage = UIImage()
        switch pokemonType {
        case "normal":
            pokemonTypeImage = #imageLiteral(resourceName: "TNormal")
        case "fighting":
            pokemonTypeImage = #imageLiteral(resourceName: "TFight")
        case "flying":
            pokemonTypeImage = #imageLiteral(resourceName: "TFlying")
        case "poison":
            pokemonTypeImage = #imageLiteral(resourceName: "TPoison")
        case "ground":
            pokemonTypeImage = #imageLiteral(resourceName: "TGround")
        case "rock":
            pokemonTypeImage = #imageLiteral(resourceName: "TRock")
        case "bug":
            pokemonTypeImage = #imageLiteral(resourceName: "TBug")
        case "ghost":
            pokemonTypeImage = #imageLiteral(resourceName: "TGhost")
        case "steel":
            pokemonTypeImage = #imageLiteral(resourceName: "TSteel")
        case "fire":
            pokemonTypeImage = #imageLiteral(resourceName: "TFire")
        case "water":
            pokemonTypeImage = #imageLiteral(resourceName: "TWater")
        case "grass":
            pokemonTypeImage = #imageLiteral(resourceName: "TGrass")
        case "electric":
            pokemonTypeImage = #imageLiteral(resourceName: "TElectric")
        case "psychic":
            pokemonTypeImage = #imageLiteral(resourceName: "TPsychic")
        case "ice":
            pokemonTypeImage = #imageLiteral(resourceName: "TIce")
        case "dragon":
            pokemonTypeImage = #imageLiteral(resourceName: "TDragon")
        case "dark":
            pokemonTypeImage = #imageLiteral(resourceName: "TDark")
        case "fairy":
            pokemonTypeImage = #imageLiteral(resourceName: "TFairy")
        case "shadow":
            pokemonTypeImage = #imageLiteral(resourceName: "TGrass")
        default:
            pokemonTypeImage = #imageLiteral(resourceName: "TNormal")
        }
        return pokemonTypeImage
    }
    
}

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            clipsToBounds = true
            layer.cornerRadius = radius
            layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
        } else {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    }
}
