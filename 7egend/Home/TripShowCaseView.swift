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
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
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
        seasonIcon.constrainSize(height: 16, width: 16)
    }
    
    func additionalSetup() {
        setupLayer()
        setupNameLabelAppearance()
        setupPeriodLabelAppearance()
    }
    
    private func setupLayer() {
        clipsToBounds = true
        layer.cornerRadius = 16
    }
    
    private func setupNameLabelAppearance() {
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
    }
    
    private func setupPeriodLabelAppearance() {
        periodLabel.textColor = .white
        periodLabel.font = UIFont.systemFont(ofSize: 8, weight: .medium)
    }
}

extension TripShowCaseView: ConfigurableView {
    func setup(with viewModel: TripShowCaseViewModel) {
        imageView.image = UIImage(named: viewModel.imageSource)
        seasonIcon.image = UIImage(named: viewModel.seasonImageSource)
        nameLabel.text = viewModel.name
        periodLabel.text = viewModel.period
    }
}
