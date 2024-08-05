//
//  File.swift
//  
//
//  Created by SeanHuang on 7/27/24.
//

import Foundation
import SwiftUI

public struct DetailMealResponse : Codable{
    public let meals : [DetailMealModel]
}

//DesertModel for holding meal information
//assume there must be an unique id for any meal
public struct DetailMealModel: Codable, Identifiable{
    private let idMeal : String
    public let strMeal : String?
    public let strDrinkAlternate : String?
    public let strCategory : String?
    public let strArea : String?
    public let strInstructions : String?
    public let strTags: String?
    private let strMealThumb: String?
    private let strYoutube: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    private let strSource: String?
    private let strImageSource: String?
    public let strCreativeCommonsConfirmed : String?
    public let dateModified: String?
    public var id: Int{
        return Int(idMeal)!
    }
    public var mealThumb:URL?{
        if let str = strMealThumb{
            guard let url = URL(string: str) else{
               return nil
            }
            return url
        }else{
            return nil
        }
    }
    public var youTube: URL?{
        if let str = strYoutube{
            guard let url = URL(string: str) else{
               return nil
            }
            return url
        }else{
            return nil
        }
    }
    
    public var mizanplas: [(String, String)]{
        var arr : [(String,String)] = []
        if let ingredient = strIngredient1{
            if !ingredient.isEmpty{
                if let measure = strMeasure1{
                    arr.append((ingredient,measure))
                }else{
                    arr.append((ingredient, "TBD"))
                }
            }
        }
        if let ingredient = strIngredient2{
            if !ingredient.isEmpty{
                if let measure = strMeasure2{
                    arr.append((ingredient,measure))
                }else{
                    arr.append((ingredient, "TBD"))
                }
            }
        }
        if let ingredient = strIngredient3{
            if !ingredient.isEmpty{
                if let measure = strMeasure3{
                    arr.append((ingredient,measure))
                }else{
                    arr.append((ingredient, "TBD"))
                }
            }
        }
        if let ingredient = strIngredient4{
            if !ingredient.isEmpty{
                if let measure = strMeasure4{
                    arr.append((ingredient,measure))
                }else{
                    arr.append((ingredient, "TBD"))
                }
            }
        }
        if let ingredient = strIngredient5{
            if !ingredient.isEmpty{
                
                if let measure = strMeasure5{
                    arr.append((ingredient,measure))
                }else{
                    arr.append((ingredient, "TBD"))
                }
            }
        }
        if let ingredient = strIngredient6{
            if !ingredient.isEmpty{
                
                if let measure = strMeasure6{
                    arr.append((ingredient,measure))
                }else{
                    arr.append((ingredient, "TBD"))
                }
            }
        }
        if let ingredient = strIngredient7{
            if !ingredient.isEmpty{
                if let measure = strMeasure7{
                    arr.append((ingredient,measure))
                }else{
                    arr.append((ingredient, "TBD"))
                }
            }
        }
        if let ingredient = strIngredient8{
            if !ingredient.isEmpty{
                
                if let measure = strMeasure8{
                    arr.append((ingredient,measure))
                }else{
                    arr.append((ingredient, "TBD"))
                }
            }
        }
        if let ingredient = strIngredient9{
            if !ingredient.isEmpty{
                
                if let measure = strMeasure9{
                    arr.append((ingredient,measure))
                }else{
                    arr.append((ingredient, "TBD"))
                }
            }
        }
        if let ingredient = strIngredient10{
            if !ingredient.isEmpty{
                
                if let measure = strMeasure10{
                    arr.append((ingredient,measure))
                }else{
                    arr.append((ingredient, "TBD"))
                }
            }
        }
        if let ingredient = strIngredient11{
            if !ingredient.isEmpty{
                
                if let measure = strMeasure11{
                    arr.append((ingredient,measure))
                }else{
                    arr.append((ingredient, "TBD"))
                }
            }
        }
        if let ingredient = strIngredient12{
            if !ingredient.isEmpty{
                
                if let measure = strMeasure12{
                    arr.append((ingredient,measure))
                }else{
                    arr.append((ingredient, "TBD"))
                }
            }
        }
        if let ingredient = strIngredient13{
            if !ingredient.isEmpty{
                
                if let measure = strMeasure13{
                    arr.append((ingredient,measure))
                }else{
                    arr.append((ingredient, "TBD"))
                }
            }
        }
        if let ingredient = strIngredient14{
            if !ingredient.isEmpty{
                
                if let measure = strMeasure14{
                    arr.append((ingredient,measure))
                }else{
                    arr.append((ingredient, "TBD"))
                }
            }
        }
        if let ingredient = strIngredient15{
            if !ingredient.isEmpty{
                
                if let measure = strMeasure15{
                    arr.append((ingredient,measure))
                }else{
                    arr.append((ingredient, "TBD"))
                }
            }
        }
        if let ingredient = strIngredient16{
            if !ingredient.isEmpty{
                
                if let measure = strMeasure16{
                    arr.append((ingredient,measure))
                }else{
                    arr.append((ingredient, "TBD"))
                }
            }
        }
        if let ingredient = strIngredient17{
            if !ingredient.isEmpty{
                
                if let measure = strMeasure17{
                    arr.append((ingredient,measure))
                }else{
                    arr.append((ingredient, "TBD"))
                }
            }
        }
        if let ingredient = strIngredient18{
            if !ingredient.isEmpty{
                
                if let measure = strMeasure18{
                    arr.append((ingredient,measure))
                }else{
                    arr.append((ingredient, "TBD"))
                }
            }
        }
        if let ingredient = strIngredient19{
            if !ingredient.isEmpty{
                
                if let measure = strMeasure19{
                    arr.append((ingredient,measure))
                }else{
                    arr.append((ingredient, "TBD"))
                }
            }
        }
        if let ingredient = strIngredient20{
            if !ingredient.isEmpty{
                
                if let measure = strMeasure20{
                    arr.append((ingredient,measure))
                }else{
                    arr.append((ingredient, "TBD"))
                }
            }
        }
        return arr
    }
    public var allTags : [String]{
        if let tags = strTags {
            return tags.split(separator: ",") as! [String]
        }
        return[]
    }
}
