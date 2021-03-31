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
    private lazy var collectionViewDataSource = UICollectionViewDiffableDataSource<Int, TripShowCaseViewModel>(collectionView: collectionView) {
        (collectionView, indexPath, viewModel) -> UICollectionViewCell? in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeTripCell.identifier, for: indexPath)
        (cell as? Configurable)?.setup(with: viewModel)
        return cell
    }
}

extension HomeView: CodableViewLayout {
    func buildViewHierarchy() {
        
    }
    
    func constraintViews() {
        
    }
}

extension HomeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width * 0.9
        return CGSize(width: width, height: 300)
    }
}
