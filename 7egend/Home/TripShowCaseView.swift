//
//  TripShowCaseView.swift
//  7egend
//
//  Created by Leonel Menezes on 31/03/2021.
//

import UIKit

final class TripShowCaseView: UIView {
    let imageView = UIImageView().makeCodableLayoutView()
    let seasonIcon = UIImageView().makeCodableLayoutView()
    let nameLabel = UILabel().makeCodableLayoutView()
    let periodLabel = UILabel().makeCodableLayoutView()
}

extension TripShowCaseView: CodableViewLayout {
    func buildViewHierarchy() {
        [imageView, seasonIcon, nameLabel, periodLabel].forEach(addSubview)
    }
    
    func constraintViews() {
        imageView.constrainToEdges()
        periodLabel.constrainLeading(spacing: 32)
        periodLabel.constrainBottom(spacing: 32)
        nameLabel.constrainBottom(to: periodLabel, spacing: 16)
        nameLabel.constrainLeading(to: periodLabel)
        seasonIcon.constrainBottom(to: nameLabel, spacing: 16)
        seasonIcon.constrainLeading(to: nameLabel)
    }
}
