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
        title = "Petitions"
        
        navigationItem.backButtonTitle = ""
        
        setupTableView()
        loadData()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Credits",
            style: .plain,
            target: self,
            action: #selector(didTapCredits)
        )
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Filter",
            style: .plain,
            target: self,
            action: #selector(didTapFilter)
        )
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 100
        //tableView.separatorStyle = .singleLine
        
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
        let urlString = "https:www.hackingwithswift.com/samples/petitions-1.json"
        
        viewModel.loadPetitions(from: urlString) { [weak self] success in
            guard let self = self else { return }
            
            if success {
                self.tableView.reloadData()
            } else {
                self.showError()
            }
        }
    }
    
    private func showError() {
        let alert = UIAlertController(
            title: "Erro",
            message: "Não foi possível carregar os dados. Verifique sua conexão.",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
    }
    
}

private extension ViewController {
    
    @objc func didTapCredits() {
        let alert = UIAlertController(
            title: "Credits",
            message: "Data comes from the 'We The People' API of the White House.",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
    }
}

private extension ViewController {
    
    @objc func didTapFilter() {
        let alert = UIAlertController(
            title: "Filter",
            message: "Enter a keyword to filter petitions",
            preferredStyle: .alert
        )
        
        alert.addTextField()
        
        let filterAction = UIAlertAction(title: "Apply", style: .default) { [weak self] _ in
            guard let self = self,
                  let text = alert.textFields?.first?.text else { return }
            
            self.viewModel.filterPetitions(by: text)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(filterAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
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
           cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
           
           cell.textLabel?.numberOfLines = 2

           cell.detailTextLabel?.text = petition.body
           cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 14)
           cell.detailTextLabel?.textColor = .secondaryLabel

           cell.detailTextLabel?.numberOfLines = 2

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
