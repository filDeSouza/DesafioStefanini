//
//  APIService.swift
//  DesafioPopcode
//
//  Created by Filipe de Souza on 14/10/21.
//

import Foundation

enum APIError{
    case url
    case taskError
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
    case erroResposta
}

class APIService{
    
    func performRequestGalery(galery: String, completion: @escaping(GaleryModel) -> Void, onError: @escaping(APIError) -> Void){
        
        let boundary = "Boundary-\(UUID().uuidString)"
        let urlString = Constants.base_url + Constants.endpoint_search_galery + galery
        let session = URLSession(configuration: .default)
        guard let url = URL(string: urlString) else{
            onError(.url)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(Constants.api_key, forHTTPHeaderField: "Authorization")
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            if error != nil{
                onError(.taskError)
                return
            }
            guard let response = response as? HTTPURLResponse else{
                onError(.erroResposta)
                return
            }
            if response.statusCode == 200{
                guard let data = data else{
                    onError(.noData)
                    return
                }
                do {
//                    let galeryString = String(data: data, encoding: .utf8)
//                    guard let string = galeryString else {return}
//                    let stringToData = Data(string.utf8)
                    let galery = try JSONDecoder().decode(GaleryModel.self, from: data)
                    completion(galery)
                } catch {
                    onError(.invalidJSON)
                }
            }else{
                onError(.noResponse)
            }
            
        })
        task.resume()
    }
    
}
