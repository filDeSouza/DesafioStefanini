//
//  PopularMoviesPresenter.swift
//  DesafioPopcode
//
//  Created by Filipe de Souza on 15/10/21.
//

import UIKit

protocol GaleryPresentationLogic {
    func presentGalery(response: GaleryModels.Acao.Response)
}

class GaleryPresenter: GaleryPresentationLogic {
    
    var viewController: GaleryDisplayLogic?
    
    func presentGalery(response: GaleryModels.Acao.Response) {
        
        let viewModel = GaleryModels.Acao.ViewModel(galery: response.galery)
        
        viewController?.displayGalery(viewModel: viewModel)
        
    }
}
