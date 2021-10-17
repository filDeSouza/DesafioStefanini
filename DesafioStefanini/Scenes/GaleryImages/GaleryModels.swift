//
//  FavoriteMoviesModels.swift
//  DesafioPopcode
//
//  Created by Filipe de Souza on 15/10/21.
//

import Foundation

enum GaleryModels{
    enum Acao {
        struct Request {
            
        }
        struct Response{
            let galery: GaleryModel
        }
        struct ViewModel{
            let galery: GaleryModel
        }
    }
}
