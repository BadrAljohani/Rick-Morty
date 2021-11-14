import UIKit

struct FisheryManagement : Codable {
    
    enum CodingKeys: String, CodingKey {
        case SpeciesName = "Species Name"
        case ScientificName = "Scientific Name"
    }
    
    var SpeciesName : String
    var ScientificName : String
    
}

class ViewController: UIViewController {
    func getCharacters(){
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "www.fishwatch.gov"
        urlComponents.path = "/api/species"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        let urlSession = URLSession.shared

        urlSession.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error:Error?) in
            
            do {
                let jsonDecoder = JSONDecoder()
                let characters = try jsonDecoder.decode([FisheryManagement].self, from: data!)
                print(characters)
//                self.FisheryManagement = characters
            }catch{
                print("Error fetcing the data:\(error)")
            }
        }.resume()
        }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        getCharacters()
    }
    
    
}

