//
//  ViewController.swift
//  PROYECTO_Alfa
//
//  Created by Alberto on 19/05/2019.
//  Copyright © 2019 Alberto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var buscador: Buscador!
    
    
    var detallesViewController: DetallesViewController?  = nil
    var menus = [Menu]()
    var filtradoMenus = [Menu]()
    let busquedaController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Setup the Search Controller
        busquedaController.searchResultsUpdater = self
        busquedaController.obscuresBackgroundDuringPresentation = false
        busquedaController.searchBar.placeholder = "Busqueda"
        navigationItem.searchController = busquedaController
        definesPresentationContext = true
        
        busquedaController.searchBar.scopeButtonTitles = ["Todos", "Proyectos", "Ejercicios", "Manuales"]
        busquedaController.searchBar.delegate = self
        
        // Setup the search Menu pie de pagina
        tableView.tableFooterView = buscador
    
        menus = [
            Menu(categoria:"Proyectos", nombre:"ATE"),
            Menu(categoria:"Proyectos", nombre:"PLATOS"),
            Menu(categoria:"proyectos", nombre:"mapView"),
             Menu(categoria:"Ejercicios", nombre:"Notificaciones Fechas"),
//              Menu(categoria:"Ejercicios", nombre:"WebView"),
            Menu(categoria:"Manuales", nombre:"WebView")]
        
        if let dividirViewController = splitViewController {
            let controllers = dividirViewController.viewControllers
            detallesViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetallesViewController
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        if splitViewController!.isCollapsed {
            if let selectionIndexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectionIndexPath, animated: animated)
            }
        }
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltrado() {
            buscador.setFiltradoMostrar(recuentoItemsFiltrados: filtradoMenus.count, of: menus.count)
            return filtradoMenus.count
        }
        
        buscador.setFiltros()
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let menu: Menu
        if isFiltrado() {
            menu = filtradoMenus[indexPath.row]
        } else {
            menu = menus[indexPath.row]
        }
        cell.textLabel!.text = menu.nombre
        cell.detailTextLabel!.text = menu.categoria
        return cell
    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VerDetalles" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let menu: Menu
                if isFiltrado() {
                    menu = filtradoMenus[indexPath.row]
                } else {
                    menu = menus[indexPath.row]
                }
                let controller = (segue.destination as! UINavigationController).topViewController as! DetallesViewController
                controller.detallesMenu = menu
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    // MARK: - Private instance methods
    
    func filterContentForSearchText(_ searchText: String, alcance: String = "Todos") {
        filtradoMenus = menus.filter({( menu : Menu) -> Bool in
            let doesCategoryMatch = (alcance == "Todos") || (menu.categoria == alcance)
            
            if searchBarIsEmpty() {
                return doesCategoryMatch
            } else {
                return doesCategoryMatch && menu.nombre.lowercased().contains(searchText.lowercased())
            }
        })
        tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        return busquedaController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltrado() -> Bool {
        let searchBarScopeIsFiltering = busquedaController.searchBar.selectedScopeButtonIndex != 0
        return busquedaController.isActive && (!searchBarIsEmpty() || searchBarScopeIsFiltering)
    }
}

extension ViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, alcance: searchBar.scopeButtonTitles![selectedScope])
    }
}

extension ViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, alcance: scope)
    }
}



