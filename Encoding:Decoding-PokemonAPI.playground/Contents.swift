import Cocoa

//*** MARK: - UNCommented Version ***

/*
 Pokemon JSON (short version)
 {
 
 "name": "Some name",
 "Abilities": {},
 "types": [
    {
      "slot": 1,
      "type": {
        "name": "grass",
        "url": "https://pokeapi.co/api/v2/type/12/"
      }
    },
    {
      "slot": 2,
      "type": {
        "name": "poison",
        "url": "https://pokeapi.co/api/v2/type/4/"
      }
    }
  ]
 }
 */

var url = URL(string: "https://pokeapi.co/api/v2/pokemon/3")!

struct Pokemon {
    let name: String
    let types: [String]
    
    // Keyed Container - Pokemon
    enum PokemonKeys : String, CodingKey {
        case name
        case types
        
        // Keyed Container - types
        enum TypesKeys : String, CodingKey {
            case slot
            case type
            
            // Keyed Container - type
            enum TypeDescriptionKeys : String, CodingKey {
                case name
                case url
            }
        }
    }
}

extension Pokemon : Codable {
    
    // Manually implementing Decoding
    init(from decoder: Decoder) throws {
        
        let jsonKeyedContainer = try decoder.container(keyedBy: PokemonKeys.self)
        
        name = try! jsonKeyedContainer.decode(String.self, forKey: .name)
        
        // Get the array of types
        var typesUnKeyedContainer = try jsonKeyedContainer.nestedUnkeyedContainer(forKey: .types)
        
        // Go inside each type object
        var decodedType: [String] = []
        while !typesUnKeyedContainer.isAtEnd {
                       
            let singleTypeKeyedContainer = try typesUnKeyedContainer.nestedContainer(keyedBy: PokemonKeys.TypesKeys.self)
            
            // Go inside the "sub" type object
            let singleTypeDescriptionKeyedContainer = try singleTypeKeyedContainer.nestedContainer(keyedBy: PokemonKeys.TypesKeys.TypeDescriptionKeys.self, forKey: .type)
            
            // Get the name
            let typeName = try singleTypeDescriptionKeyedContainer.decode(String.self, forKey: PokemonKeys.TypesKeys.TypeDescriptionKeys.name)
            decodedType.append(typeName)
        }
        types = decodedType
    }
}

// Download the actual Data
let downloadData = try! Data(contentsOf: url)
print(downloadData)

// Transform from Data -> Pokemon
let decoder = JSONDecoder()
let decodedPokemon = try! decoder.decode(Pokemon.self, from: downloadData)

print(decodedPokemon)



// *** MARK: - Commented Version ***
/*
/*
 Pokemon JSON (short version)
 {
 
 "name": "Some name",
 "Abilities": {},
 "types": [
    {
      "slot": 1,
      "type": {
        "name": "grass",
        "url": "https://pokeapi.co/api/v2/type/12/"
      }
    },
    {
      "slot": 2,
      "type": {
        "name": "poison",
        "url": "https://pokeapi.co/api/v2/type/4/"
      }
    }
  ]
 }
 */

var url = URL(string: "https://pokeapi.co/api/v2/pokemon/3")!

struct Pokemon {
    let name: String
    let type: [String]
    
    // Keyed Container - Pokemon
    enum PokemonKeys : String, CodingKey {
        case name
        case types
        
        // UNKeyed container - types
            
            // Keyed Container - types
            enum TypesKeyes : String, CodingKey {
                case slot
                case type
                
                // Keyed Container - type
                enum TypeKeyes : String, CodingKey {
                    case name
                    case url
                }
            }
    }
}

extension Pokemon : Codable {
    
    // Manually Decoding
    init(from decoder: Decoder) throws {
        let jsonKeyedContainer = try decoder.container(keyedBy: PokemonKeys.self)
        
        name = try! jsonKeyedContainer.decode(String.self, forKey: .name)
        

        var typesUnKeyedContainer = try jsonKeyedContainer.nestedUnkeyedContainer(forKey: .types)
        
        var decodedType = [String]()
        
        while !typesUnKeyedContainer.isAtEnd {
            /*
             {
               "slot": 1,
               "type": {
                 "name": "grass",
                 "url": "https://pokeapi.co/api/v2/type/12/"
               }
             },
             */
            
            let singleTypeKeyedContainer = try typesUnKeyedContainer.nestedContainer(keyedBy: PokemonKeys.TypesKeyes.self)
            
            /*
             singleTypeKeyedContainer = "type": {
                                            "name": "grass",
                                            "url": "https://pokeapi.co/api/v2/type/12/"
                                        }
             */
            
            let singleTypeDescriptionKeyedContainer = try singleTypeKeyedContainer.nestedContainer(keyedBy: PokemonKeys.TypesKeyes.TypeKeyes.self, forKey: .type)
            
            /*
             singleTypeDescriptionKeyedContainer =  "name": "poison",
                                                    "url": "https://pokeapi.co/api/v2/type/4/"
             */
            
            let typeName = try singleTypeDescriptionKeyedContainer.decode(String.self, forKey: .name)
            /*
             typeName = "poison
             */
            decodedType.append(typeName)
        }
        type = decodedType
    }
}

// Download the actual Data
let downloadData = try! Data(contentsOf: url)

// Transform from Data -> Pokemon
let decoder = JSONDecoder()
let decodedPokemon = try! decoder.decode(Pokemon.self, from: downloadData)

print(decodedPokemon)
*/
