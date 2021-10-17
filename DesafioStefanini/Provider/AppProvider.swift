//
//  AppProvider.swift
//  DesafioPopcode
//
//  Created by Filipe de Souza on 15/10/21.
//

import UIKit

class AppProvider: GaleryProviderProtocol {
    
    let apiService = APIService()
    
    func obterGalery(galery: String, completion: @escaping (GaleryModel?) -> Void) {
        
        apiService.performRequestGalery(galery: galery, completion: { (result) in
            
            if result != nil{
                completion(result   )
            }
            
        }, onError: {(error) in
            
            switch error{
            case .invalidJSON:
                print("JSON inválido")
            case .noData:
                print("Sem dados")
            case .noResponse:
                print("Sem resposta da API")
            case .erroResposta:
                print("Sem resposta da API")
            default:
                print("Erro genérico")
            }
            
        })
        
    }
    
}
