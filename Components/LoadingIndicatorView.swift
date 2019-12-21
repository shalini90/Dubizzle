//
//  LoadingIndicatorView.swift
//  Dubizzle
//
//  Created by Shalini Padmanabhan on 20/12/19.
//  Copyright © Shalini Padmanabhan All rights reserved.
//

import UIKit


extension UIView {
    func showLoader() {
            let loaderView = LoadingIndicatorView.loaderView
            loaderView.frame = self.bounds
            addSubview(loaderView)
            loaderView.startAnimating()
    }
    
    func hideLoader() {
        LoadingIndicatorView.loaderView.removeFromSuperview()
    }
}


class LoadingIndicatorView: UIView {
    
   static let loaderView = LoadingIndicatorView.getLoaderView()
    @IBOutlet private weak var spinner: UIActivityIndicatorView!
    
   class func getLoaderView() -> LoadingIndicatorView {
        return UINib(nibName: "LoadingIndicatorView", bundle: nil).instantiate(withOwner: self, options: nil).first as! LoadingIndicatorView
    }
    
    func startAnimating() {
        spinner.startAnimating()
    }

}
