//
//  CodableViewLayout.swift
//  7egend
//
//  Created by Leonel Menezes on 31/03/2021.
//

import Foundation

protocol CodableViewLayout {
    func buildViewHierarchy()
    func constraintViews()
    func additionalSetup()
}

extension CodableViewLayout {
    func setupViews() {
        buildViewHierarchy()
        constraintViews()
        additionalSetup()
    }
    
    func additionalSetup() {}
}
