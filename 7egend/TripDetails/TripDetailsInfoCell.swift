//
//  TripDetailsInfoCell.swift
//  7egend
//
//  Created by Leonel Menezes on 02/04/2021.
//

import UIKit

final class TripDetailsInfoCell: UICollectionViewCell {
    static let identifier = "TripDetailsInfoCell"
    private let view = TripDescriptionView().makeCodableLayoutView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TripDetailsInfoCell: CodableViewLayout {
    func buildViewHierarchy() {
        addSubview(view)
    }
    
    func constraintViews() {
        view.constrainToEdges()
    }
}

extension TripDetailsInfoCell: ConfigurableView {
    func setup(with viewModel: TripDescriptionViewModel) {
        view.setup(with: viewModel)
    }
}
