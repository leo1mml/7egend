//
//  TripDetailsView.swift
//  7egend
//
//  Created by Leonel Menezes on 02/04/2021.
//

import UIKit

final class TripDetailsView: UIView {
    private let showCaseView = TripShowCaseView().makeCodableLayoutView()
    private let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: flowLayout)
            .makeCodableLayoutView()
        collectionView.register(TripDetailsInfoCell.self, forCellWithReuseIdentifier: TripDetailsInfoCell.identifier)
        collectionView.contentInset = .init(top: 300, left: 0, bottom: 0, right: 0)
        return collectionView
    }()
    private lazy var collectionViewDataSource = UICollectionViewDiffableDataSource<Int, TripDescriptionViewModel>(collectionView: collectionView) {
        (collectionView, indexPath, viewModel) -> UICollectionViewCell? in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TripDetailsInfoCell.identifier,
                                                      for: indexPath)
        (cell as? Configurable)?.setup(with: viewModel)
        return cell
    }
    private var descriptionViewModel: TripDescriptionViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TripDetailsView: CodableViewLayout {
    func buildViewHierarchy() {
        [showCaseView, collectionView].forEach(addSubview)
    }
    
    func constraintViews() {
        showCaseView.constrainTop()
        showCaseView.constrainLeading()
        showCaseView.constrainTrailing()
        showCaseView.constrain(height: 380)
        collectionView.constrainToEdges()
    }
    
    func additionalSetup() {
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = collectionViewDataSource
        collectionView.alwaysBounceVertical = true
    }
}

extension TripDetailsView: ConfigurableView {
    struct ViewModel {
        let showCaseViewModel: TripShowCaseViewModel
        let descriptionViewModel: TripDescriptionViewModel
    }
    
    func setup(with viewModel: ViewModel) {
        showCaseView.setup(with: viewModel.showCaseViewModel)
        descriptionViewModel = viewModel.descriptionViewModel
        var snapshot = NSDiffableDataSourceSnapshot<Int, TripDescriptionViewModel>()
        snapshot.appendSections([1])
        snapshot.appendItems([viewModel.descriptionViewModel])
        collectionViewDataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension TripDetailsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = CGSize(width: collectionView.frame.width, height: 0)
        if let viewModel = descriptionViewModel {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TripDetailsInfoCell.identifier, for: indexPath)
            (cell as? Configurable)?.setup(with: viewModel)
            size.height = cell.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        }
        return size
    }
}
