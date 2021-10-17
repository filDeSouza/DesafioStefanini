//
//  Utils.swift
//  DesafioPopcode
//
//  Created by Filipe de Souza on 15/10/21.
//

import UIKit

class Utils {
    
    func popularCelulaGalery(_ galeryModel: GaleryModel,_ cell: GaleryTableViewCell, _ indexPath: IndexPath){
        cell.labelTitle.text = galeryModel.data[indexPath.row]?.title
        cell.setupViews(galeryImages: galeryModel.data[indexPath.row])
    }
    
    func popularImagensGalery(_ galeryModel: GaleryTotal,_ cell: ImagesCollectionViewCell, _ indexPath: IndexPath){
        
        cell.imageTitle.text = galeryModel.images?[indexPath.row].description
        guard let url = URL(string: galeryModel.images?[indexPath.row].link ?? "https://www.elegantthemes.com/blog/wp-content/uploads/2020/02/000-404.png") else {return}
        getData(from: url) { data, response, error in
            if error != nil{
                DispatchQueue.main.async {
                    cell.imageView.image = UIImage(named: "404_not_found")
                    print("erro ao carregar imagem")
                }
            }else{
                guard let data = data else {return}
                guard let response = response as? HTTPURLResponse else{
                    return
                }
                
                if response.statusCode == 404 {
                    DispatchQueue.main.async {
                        cell.imageView.image = UIImage(named: "404_not_found")
                        print("erro ao carregar imagem")
                    }
                }else{
                    DispatchQueue.main.async() { [weak self] in
                    cell.imageView?.image = UIImage(data: data)
                }
                

                }
            }
        }
    }
    
    //MARK: - Obter dados da imagem
    func getImage(url: String, imageView: UIImageView){
        
        guard let url = URL(string: url) else {return}
        
        getData(from: url) { data, response, error in
            if error != nil{
                DispatchQueue.main.async {
                    imageView.image = UIImage(named: "Logomarca_Sicredi")
                }
            }else{
                guard let data = data else {return}
                guard let response = response as? HTTPURLResponse else{
                    return
                }
                
                if response.statusCode == 404 {
                    DispatchQueue.main.async {
                        imageView.image = UIImage(named: "Logomarca_Sicredi")
                    }
                }else{
                    DispatchQueue.main.async() { [weak self] in
                        imageView.image = UIImage(data: data)
                }
                }
        }
    }
    }
        
        //MARK: - Obter valor da imagem por meio da URLSession
        func getData(from url: URL, completion: @escaping(Data?, URLResponse?, Error?) -> ()){
            URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
        }
    
}

//MARK: - Extensão ImageView para obter dados da imagem pela URL
extension UIImageView{
    func load(url: URL){
        DispatchQueue.global().async { [weak self] in
            
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
            
        }
    }
}
