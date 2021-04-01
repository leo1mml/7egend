//
//  HomeView.swift
//  7egend
//
//  Created by Leonel Menezes on 31/03/2021.
//

import UIKit

final class HomeView: UIView {
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: UICollectionViewFlowLayout())
            .makeCodableLayoutView()
        collectionView.register(HomeTripCell.self, forCellWithReuseIdentifier: HomeTripCell.identifier)
        return collectionView
    }()
    private lazy var collectionViewDataSource = UICollectionViewDiffableDataSource<Int, TripShowCaseViewModel>(collectionView: collectionView) {
        (collectionView, indexPath, viewModel) -> UICollectionViewCell? in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeTripCell.identifier,
                                                      for: indexPath)
        (cell as? Configurable)?.setup(with: viewModel)
        return cell
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: CodableViewLayout {
    func buildViewHierarchy() {
        addSubview(collectionView)
    }
    
    func constraintViews() {
        collectionView.constrainToEdges()
    }
    
    func additionalSetup() {
        collectionView.delegate = self
        collectionView.backgroundColor = .white
    }
}

extension HomeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width * 0.9
        return CGSize(width: width, height: 170)
    }
}

extension HomeView: ConfigurableView {
    func setup(with viewModel: [TripShowCaseViewModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, TripShowCaseViewModel>()
        snapshot.appendSections([1])
        snapshot.appendItems(viewModel)
        collectionViewDataSource.apply(snapshot, animatingDifferences: true)
    }
}
