//
//  HomeTripCell.swift
//  7egend
//
//  Created by Leonel Menezes on 31/03/2021.
//

import UIKit

final class HomeTripCell: UICollectionViewCell {
    static let identifier = "HomeTripCell"
    private let view = TripShowCaseView().makeCodableLayoutView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeTripCell: CodableViewLayout {
    func buildViewHierarchy() {
        addSubview(view)
    }
    
    func constraintViews() {
        view.constrainToEdges()
    }
}

extension HomeTripCell: ConfigurableView {

    func setup(with viewModel: TripShowCaseViewModel) {
        view.setup(with: viewModel)
    }
}
