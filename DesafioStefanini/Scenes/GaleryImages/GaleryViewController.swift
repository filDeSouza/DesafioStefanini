//
//  ViewController.swift
//  DesafioPopcode
//
//  Created by Filipe de Souza on 14/10/21.
//

import UIKit
import ProgressHUD

protocol GaleryDisplayLogic {
    func displayGalery(viewModel: GaleryModels.Acao.ViewModel)
}

class GaleryViewController: UIViewController, GaleryDisplayLogic {

    var galery: GaleryModel?
    var interactor: GaleryBusinessLogic?
    var router: (NSObjectProtocol & GaleryDataPassing)?
    var galeriaString: String?
    var utils = Utils()

    
    @IBOutlet weak var tableViewGalery: UITableView!
    
    

    required init?(coder aDecoder: NSCoder)
    {
      super.init(coder: aDecoder)
      setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProgressHUD.show()
        
        navigationItem.searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController?.hidesNavigationBarDuringPresentation = true
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.sizeToFit()
        navigationController?.title = Constants.navigationTitle
        navigationItem.searchController?.searchBar.placeholder = Constants.searchPlaceholder
        navigationItem.searchController?.searchBar.backgroundColor = UIColor(named: Constants.BrandColors.searchBackground)
        
        navigationItem.searchController?.searchBar.delegate = self
        
        tableViewGalery.dataSource = self
        tableViewGalery.delegate = self
        tableViewGalery.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        
        interactor?.galeryRealizaRequest(galery: "Earth", request: GaleryModels.Acao.Request())
            
    }

    // MARK: - Setup
    private func setup(){
        let viewController = self
        let interactor = GaleryInteractor()
        let presenter = GaleryPresenter()
        let router = GaleryRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
    }
    
    func displayGalery(viewModel: GaleryModels.Acao.ViewModel) {
        DispatchQueue.main.async {
            ProgressHUD.dismiss()
            self.galery = viewModel.galery
            self.tableViewGalery.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
            self.tableViewGalery.reloadData()
        }
    }

}

extension GaleryViewController: UISearchBarDelegate{
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {

        print("Valor do SearchBar: \(searchBar.text!)")
        
        if let galery = searchBar.text{
            ProgressHUD.show()
            interactor?.galeryRealizaRequest(galery: galery, request: GaleryModels.Acao.Request())
        }
        
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        
        if searchBar.text != "" {
            return true
        }else{
            searchBar.placeholder = "Digite a galeria desejada"
            return false
        }
        
    }
    
}

extension GaleryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let galeryPopulado = galery else{return 0}
        return galeryPopulado.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewGalery.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! GaleryTableViewCell
        let galeryPopulado = galery
        utils.popularCelulaGalery(galeryPopulado!, cell, indexPath)
        return cell
    }
    
}
