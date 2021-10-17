//
//  MovieModel.swift
//  DesafioPopcode
//
//  Created by Filipe de Souza on 14/10/21.
//

import Foundation

struct GaleryModel: Decodable {
    var data: [GaleryTotal?]
}

struct GaleryTotal: Decodable {
    var id: String
    var title: String
    var datetime: Int
    var images: [ImagesModel]?
}

struct ImagesModel: Decodable{
    var id: String
    var description: String? = ""
    var type: String? = ""
    var link: String? = ""
}
