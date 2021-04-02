//
//  TripDetailsViewController.swift
//  7egend
//
//  Created by Leonel Menezes on 01/04/2021.
//

import UIKit

final class TripDetailsViewController: UIViewController {
    private let mainView = TripDetailsView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        let showCase = TripShowCaseViewModel(imageSource: "rio",
                                             name: "Rio De Janeiro",
                                             seasonImageSource: "leaf",
                                             period: "Verão, 32 de março - 21 dias.")
        let description = TripDescriptionViewModel(title: "Rio de Janeiro",
                                                   description: "O Rio de Janeiro é uma grande cidade brasileira à beira-mar, famosa pelas praias de Copacabana e Ipanema, pela estátua de 38 metros de altura do Cristo Redentor, no topo do Corcovado, e pelo Pão de Açúcar, um pico de granito com teleféricos até seu cume. A cidade também é conhecida pelas grandes favelas. O empolgante Carnaval, com carros alegóricos, fantasias extravagantes e sambistas, é considerado o maior do mundo.")
        let viewModel = TripDetailsView.ViewModel(showCaseViewModel: showCase,
                                                  descriptionViewModel: description)
        mainView.setup(with: viewModel)
        mainView.backgroundColor = .white
    }
}
