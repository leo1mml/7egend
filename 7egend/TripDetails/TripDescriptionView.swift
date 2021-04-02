//
//  TripDescriptionView.swift
//  7egend
//
//  Created by Leonel Menezes on 02/04/2021.
//

import UIKit

final class TripDescriptionView: UIView {
    private let titleLabel = UILabel().makeCodableLayoutView()
    private let descriptionLabel = UILabel().makeCodableLayoutView()
    private let containerView = UIView().makeCodableLayoutView()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        let height = titleLabel.intrinsicContentSize.height + descriptionLabel.intrinsicContentSize.height + 40
        return CGSize(width: super.intrinsicContentSize.width, height: height)
    }
}

extension TripDescriptionView: CodableViewLayout {
    func buildViewHierarchy() {
        [containerView, titleLabel, descriptionLabel].forEach(addSubview)
    }
    
    func constraintViews() {
        containerView.constrainToEdges()
        titleLabel.constrainTop(spacing: 20)
        titleLabel.constrainLeading(spacing: 16)
        descriptionLabel.constrainLeading(to: titleLabel)
        descriptionLabel.topAnchor.constrain(to: titleLabel.bottomAnchor, constant: 8)
        descriptionLabel.constrainTrailing(spacing: 16)
    }
    
    func additionalSetup() {
        setupTitleLabel()
        setupDescriptionLabel()
        setupContainerView()
    }
    
    private func setupTitleLabel() {
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        descriptionLabel.textColor = .gray
    }
    
    private func setupContainerView() {
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 32
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}

extension TripDescriptionView: ConfigurableView {
    func setup(with viewModel: TripDescriptionViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.preferredMaxLayoutWidth = UIScreen.main.bounds.width * 0.9
        descriptionLabel.sizeToFit()
        layoutIfNeeded()
    }
}
