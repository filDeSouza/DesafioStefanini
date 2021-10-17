//
//  GaleryTableViewCell.swift
//  DesafioStefanini
//
//  Created by Filipe de Souza on 17/10/21.
//

import UIKit

class GaleryTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var collectionImages: UICollectionView!
    
    var utils = Utils()
    var galeryImages: GaleryTotal?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionImages.register(UINib(nibName: Constants.cellNibImages, bundle: nil), forCellWithReuseIdentifier: Constants.cellImages)
    }
    
    func setupViews(galeryImages: GaleryTotal?){
        self.galeryImages = galeryImages
        collectionImages.delegate = self
        collectionImages.dataSource = self
        collectionImages.register(UINib(nibName: Constants.cellNibImages, bundle: nil), forCellWithReuseIdentifier: Constants.cellImages)
        collectionImages.reloadData()
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let numeroImagens = galeryImages?.images?.count else {return 1}
        return numeroImagens
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionImages.dequeueReusableCell(withReuseIdentifier: Constants.cellImages, for: indexPath) as! ImagesCollectionViewCell
        utils.popularImagensGalery(galeryImages!, cell, indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let columns: CGFloat = 2
        
        let spacing: CGFloat = 8
        let totalHorizontalSpacing = (columns - 1) * spacing
        
        let itemWidth = (collectionView.bounds.width - totalHorizontalSpacing) / columns
        let itemSize = CGSize(width: itemWidth, height: itemWidth * 1.1)
        
        return itemSize
        
    }
    
}
