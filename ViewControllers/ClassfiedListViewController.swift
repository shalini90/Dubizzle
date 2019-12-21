//
//  ClassfiedListViewController.swift
//  Dubizzle
//
//  Created by Shalini Padmanabhan on 19/12/19.
//  Copyright © Shalini Padmanabhan All rights reserved.
//

import UIKit

class ClassfiedListViewController: UIViewController {

    @IBOutlet private weak var listTableView: UITableView!
    @IBOutlet private weak var listSearchBar: UISearchBar!
    var viewModel: ClassifiedListViewModel!
    var isSearch: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Classifieds"
        setupUI()
        bindViewModel()
    }
    
    func setupUI() {
        let classifiedListCell = String(describing: ClassifiedListTableViewCell.self)
        listTableView.register(UINib(nibName: classifiedListCell, bundle: .main),
                               forCellReuseIdentifier: classifiedListCell)
        listTableView.estimatedRowHeight = 50.0
        listTableView.rowHeight = UITableView.automaticDimension
    }
    
    func bindViewModel() {
        view.showLoader()
        viewModel.fetchClassifiedList(onSuccess: {[weak self] in
            self?.listTableView.reloadData()
            self?.view.hideLoader()
        }) { [weak self] (_) in
            self?.showErrorAlert()
            self?.view.hideLoader()
        }
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: nil, message: AppError.unknown.description, preferredStyle: .alert)
        let action = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}


extension ClassfiedListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ClassifiedListTableViewCell.self),
                                                 for: indexPath)
        if let listCell = cell as? ClassifiedListTableViewCell, let lists = viewModel?.getDataSource(isSearch: isSearch) {
            listCell.populateList(result: lists[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = viewModel?.getDataSource(isSearch: isSearch).count {
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let result = viewModel.getDataSource(isSearch: isSearch)[indexPath.row]
        let dataObject = result.asResultDetail()
        AppDelegate.router.showDetailViewController(detail: dataObject)
    }
}

extension ClassfiedListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text, !searchText.isEmpty {
            isSearch = true
            viewModel.search(searchText: searchText)
            searchBar.resignFirstResponder()
            listTableView.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearch = false
            listTableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        isSearch = false
        searchBar.resignFirstResponder()
        listTableView.reloadData()
    }
}
