//
//  ViewController.swift
//  PetitionsExplorer
//
//  Created by Karla E. Martins Fernandes on 16/03/26.
//

import UIKit

final class ViewController: UIViewController {
    
    private let viewModel = PetitionsViewModel()
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupTableView()
        loadData()
    }
}

