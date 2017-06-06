//
//  MasterViewController.swift
//  SwiftLearning
//
//  Created by Al on 6/6/17.
//  Copyright © 2017 suorui. All rights reserved.
//

import UIKit

protocol PokemonSelectionDelegate: class {
    func pokemonSelected(_ newPokemon: Pokemon)
}

class MasterViewController: UITableViewController {
    var pokemons = LibraryAPI.sharedInstance.getPokemons()
    var filteredPokemons = [Pokemon]()
    weak var delegate: PokemonSelectionDelegate?
    
    fileprivate let tap = UITapGestureRecognizer.init(target: self, action: Selector.dismissKeyboard)
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        filteredPokemons = pokemons
    }

    fileprivate func setupUI() {
        self.title = "精灵列表"
        view.addGestureRecognizer(tap)
        definesPresentationContext = true
        
        
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPokemons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MasterViewController
        let pokemon = filteredPokemons[(indexPath as NSIndexPath).row]
        cell.awakeFromNib(pokemon.id, name: pokemon.name, pokeImageUrl: pokemon.pokeImgUrl)
        
        return cell
    }
}

private extension Selector {
    static let dismissKeyboard = #selector(MasterViewController.dismissKeyboard)
}
