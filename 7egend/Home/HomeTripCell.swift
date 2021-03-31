//
//  HomeTripCell.swift
//  7egend
//
//  Created by Leonel Menezes on 31/03/2021.
//

import UIKit

final class HomeTripCell: UICollectionViewCell {
    static let identifier = "HomeTripCell"
    private let view = TripShowCaseView()
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
        
    }
}
