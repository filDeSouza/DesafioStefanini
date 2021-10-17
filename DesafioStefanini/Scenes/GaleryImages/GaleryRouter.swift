//
//  PopularMoviesRouter.swift
//  DesafioPopcode
//
//  Created by Filipe de Souza on 15/10/21.
//

import Foundation

protocol GaleryDataPassing {
    var dataStore: GaleryDataStore? {get}
}

class GaleryRouter: NSObject, GaleryDataPassing {
    
    var dataStore: GaleryDataStore?
    weak var viewController: GaleryViewController?
    
    
}
