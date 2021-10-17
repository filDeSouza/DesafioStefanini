//
//  AppManager.swift
//  DesafioPopcode
//
//  Created by Filipe de Souza on 15/10/21.
//

import UIKit

class AppManager {
    
    let appBusiness = AppBusiness()
    
    func obtemGalery(galery: String, completion: @escaping(GaleryModel?) -> Void){
        
        appBusiness.obtemGalery(galery: galery, completion: { (result) in
            
            if result != nil{
                completion(result)
            }else{
                return
            }
            
        })
        
    }
    
}
