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
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    private func loadData() {
        let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        
        viewModel.loadPetitions(from: urlString) { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return viewModel.petitions.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
           
           let petition = viewModel.petitions[indexPath.row]
           
           cell.textLabel?.text = petition.title
           cell.detailTextLabel?.text = petition.body
           
           return cell
       }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = DetailViewController()
        vc.petition = viewModel.petitions[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
