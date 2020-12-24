import Cocoa

let url = URL(string: "https://swapi.dev/api/people/1/")!

/*
 {
   "name": "Luke Skywalker",
   "height": "172",
   "mass": "77",
   "hair_color": "blond",
   "skin_color": "fair",
   "eye_color": "blue",
   "birth_year": "19BBY",
   "gender": "male",
   "homeworld": "http://swapi.dev/api/planets/1/",
   "films": [
     "http://swapi.dev/api/films/1/",
     "http://swapi.dev/api/films/2/",
     "http://swapi.dev/api/films/3/",
     "http://swapi.dev/api/films/6/"
   ],
   "species": [],
   "vehicles": [
     "http://swapi.dev/api/vehicles/14/",
     "http://swapi.dev/api/vehicles/30/"
   ],
   "starships": [
     "http://swapi.dev/api/starships/12/",
     "http://swapi.dev/api/starships/22/"
   ],
   "created": "2014-12-09T13:50:51.644000Z",
   "edited": "2014-12-20T21:17:56.891000Z",
   "url": "http://swapi.dev/api/people/1/"
 }
 */

struct Person : Codable {
    let name: String
    let hairColor: String
    let homeworld: URL
    let films: [URL]
    let created: Date
    
    enum PersonKeys : String, CodingKey {
        case name
        case hairColor = "hair_color"
        case homeworld
        case films
        case created
    }
}

extension Person {
    // func encode(encoder:)
    func encode(to encoder: Encoder) throws {
        
        var jsonKeyedContainer = encoder.container(keyedBy: PersonKeys.self)
        // { "name" : "Luke Skywalker" }
        try jsonKeyedContainer.encode(name, forKey: .name)
        try jsonKeyedContainer.encode(hairColor, forKey: .hairColor)
        
        // To ba safe: get the string first, then encode it
        let homeworldString = homeworld.absoluteString
        try jsonKeyedContainer.encode(homeworldString, forKey: .homeworld)
        
        // Create an unkeyed container for the PersonKey films
        // { "films" : [] }
        var filmsContainer = jsonKeyedContainer.nestedUnkeyedContainer(forKey: .films)
        // Encode each film
        for film in films {
            let filmAbsoluteString = film.absoluteURL
            try filmsContainer.encode(filmAbsoluteString)
        }
        
        // Use the dateFormatter to convert the date into a string, then encode the string
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
        let createdString = dateFormatter.string(from: created)
        
        try jsonKeyedContainer.encode(createdString, forKey: .created)
    }
    
    // init(from decoder: Decoder) -> We get for FREE but it's very limited, so we implement ourself
    
    // Manually decoding from an intermediary object
    init(from decoder: Decoder) throws {
        let jsonKeyedContainer = try decoder.container(keyedBy: PersonKeys.self)
        
        name = try jsonKeyedContainer.decode(String.self, forKey: .name)
        hairColor = try jsonKeyedContainer.decode(String.self, forKey: .hairColor)
        
        // Since URL implements decodable, we can call it immidiatly in the decodable (even if it's an array
        homeworld = try jsonKeyedContainer.decode(URL.self, forKey: .homeworld)
        films = try jsonKeyedContainer.decode([URL].self, forKey: .films)
        
        // Date has codable but there's many ways it could crash.
        // Use the DateFormatter to create the date
        let createdString = try jsonKeyedContainer.decode(String.self, forKey: .created)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
        created = dateFormatter.date(from: createdString)!
    }
}

// Downloading the actual data
let downloadedData = try! Data(contentsOf: url)

// Transforming from Data -> Person
let decodedPerson = try! JSONDecoder().decode(Person.self, from: downloadedData)

print(decodedPerson)


// Transforming from Person -> Data
let encodedPerson = try JSONEncoder().encode(decodedPerson)

// DEBUG: Represent the data as a string
let encodedPersonStringRepresentation = String(data: encodedPerson, encoding: .utf8)!


print(encodedPersonStringRepresentation)







// MARK: - Notes

/*
 
 1.
  structs = value-type
  classes = reference-type
  ** Try using structs as much as possible
 
 2. When would we use custom encoding/decoding?
 
    - Whenever keys do not match our own constants/variables
    - Whenever we need to transform the data to a custom or different type
    -
 
 3. init(from decoder: Decoder) -> We get for FREE but it's very limited, so we implement ourself
 
 Bad thing about implemeting this ourselves is that we loose EVERYTHING we used to get for free.
 So now we need to handle ALL the data ourselves in this block of code -> No more free-bes
 
 4. # ways to extract data from the Decoder (JSON)
 
    - keyed-container: Dictionary
            var keyedContainer = decoder.container(keyedBy: "CodingKey.Protocol")
 
    - unkeyed-container: Array
            var unkeyedContainer = decoder.unkeyedContainer()
 
    - single-value: String || Int || ...
 
    * ^^ Used to get all that for free, but not anymore (since your implementing decoder yourself
 
 5. How do I manually decode?
 
    - Implement init(decoder:)
    - Create a container
    - Create coding keys, and unpack
 
 6. Encoding vs Decoding Containers
 
    The container in the decoding init already has Data
            Contaner(Data)
 
    Insinde the encoder init, you create an empty container and give it data
            Data -> Contaner()
 
 */
