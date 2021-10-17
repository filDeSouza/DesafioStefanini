//
//  PopularMoviesWorker.swift
//  DesafioPopcode
//
//  Created by Filipe de Souza on 15/10/21.
//

import UIKit

class GaleryWorker {
    
    let appManager = AppManager()
    
    func fetchGalery(galery: String, completion: @escaping(GaleryModel?) -> Void){
        
        appManager.obtemGalery(galery: galery, completion: { (result) in
            
            if result != nil{
                completion(result)
            }else{
                return
            }
            
        })
        
    }
    
}

