//
//  Constantes.swift
//  DesafioPopcode
//
//  Created by Filipe de Souza on 14/10/21.
//

import Foundation

class Constants{
    
    static let base_url = "https://api.imgur.com"
    static let api_key = "Client-ID 555be318cba9167"
    static let endpoint_search_galery = "/3/gallery/search/score?q="
    static let page = "&page=1"
    static let cellIdentifier = "reusableCell"
    static let cellNibName = "GaleryTableViewCell"
    
    static let cellImages = "reusableCellImages"
    static let cellNibImages = "ImagesCollectionViewCell"
    
    static let navigationTitle = "Desafio Stefanini"
    static let searchPlaceholder = "Digite a galeria desejada"
    
    struct BrandColors{
        static let searchBackground = "searchBarColor"

    }
}
