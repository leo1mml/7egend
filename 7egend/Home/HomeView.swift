//
//  HomeView.swift
//  7egend
//
//  Created by Leonel Menezes on 31/03/2021.
//

import UIKit

final class HomeView: UIView {
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView().makeCodableLayoutView()
        return collectionView
    }()
}

extension HomeView: CodableViewLayout {
    func buildViewHierarchy() {
        
    }
    
    func constraintViews() {
        
    }
}
