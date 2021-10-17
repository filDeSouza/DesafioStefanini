//
//  AppProviderProtocol.swift
//  DesafioPopcode
//
//  Created by Filipe de Souza on 15/10/21.
//

import UIKit

protocol GaleryProviderProtocol {
    func obterGalery(galery: String, completion: @escaping(GaleryModel?) -> Void)
}
