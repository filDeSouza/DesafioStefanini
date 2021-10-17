//
//  PopularMoviesInteractor.swift
//  DesafioPopcode
//
//  Created by Filipe de Souza on 15/10/21.
//

import UIKit

protocol GaleryBusinessLogic {
    func galeryRealizaRequest(galery: String, request: GaleryModels.Acao.Request)
}

protocol GaleryDataStore{
    var galeryModel: GaleryModel?{get}
}

class GaleryInteractor: GaleryBusinessLogic, GaleryDataStore {
    
    var presenter: GaleryPresentationLogic?
    var galeryModel: GaleryModel?
    var worker: GaleryWorker?
    
    func galeryRealizaRequest(galery: String, request: GaleryModels.Acao.Request) {
        worker = GaleryWorker()
        worker?.fetchGalery(galery: galery, completion: { (result) in
            
            guard let resultado = result else{return}
            let response = GaleryModels.Acao.Response(galery: resultado)
            
            self.presenter?.presentGalery(response: response)
            
        })
    }
    
}
