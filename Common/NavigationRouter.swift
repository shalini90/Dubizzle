//
//  NavigationRouter.swift
//  Dubizzle
//
//  Created by Shalini Padmanabhan on 12/22/19.
//  Copyright © Shalini Padmanabhan. All rights reserved.
//

import Foundation
import UIKit


class NavigationRouter {
    
    var navController: UINavigationController!
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func setupListViewController() {
        let classifiedListVC = navController.viewControllers.first as? ClassfiedListViewController
        let apiService = ApiService()
        let viewModel = ClassifiedListViewModel(service: apiService)
        classifiedListVC?.viewModel = viewModel
    }
    
    func showDetailViewController(detail: ResultDetail) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(withIdentifier: "ClasiifiedsDetailViewController") as? ClasiifiedsDetailViewController {
            let detailViewModel = ClassifiedsDetailViewModel()
            detailViewController.viewModel = detailViewModel
            detailViewModel.detail = detail
            navController?.pushViewController(detailViewController, animated: true)
        }
    }
}
