//
//  AppBusiness.swift
//  DesafioPopcode
//
//  Created by Filipe de Souza on 15/10/21.
//

import UIKit

class AppBusiness {
    
    let provider = AppProvider()
    
    func obtemGalery(galery: String, completion: @escaping(GaleryModel?) -> Void){
        
        provider.obterGalery(galery: galery, completion: {(result) in
            
            if result != nil{
                do{
                    let galery = result
                    completion(galery)
                }
            }else{
                return
            }
            
        })
        
    }
    
}
