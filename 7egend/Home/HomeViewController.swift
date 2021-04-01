//
//  HomeViewController.swift
//  7egend
//
//  Created by Leonel Menezes on 31/03/2021.
//

import UIKit

class HomeViewController: UIViewController {
    private let homeView = HomeView()
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        let items = (1...10).map({  _ in
            return TripShowCaseViewModel(imageSource: "rio",
                                         name: "Rio De Janeiro",
                                         seasonImageSource: "",
                                         period: "Verão, Rio De Janeiro - 22/03 - 28/08")
        })
        homeView.setup(with: items)
    }
}
