//
//  UIView+TranslateConstraintsFalse.swift
//  7egend
//
//  Created by Leonel Menezes on 31/03/2021.
//

import UIKit

extension UIView {
    
    func makeCodableLayoutView() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    ///Constrain view to superview by default, positive values go inwards, negative values go outwards the view
    func constrainToEdges(to view: UIView? = nil, padding: UIEdgeInsets = .zero) {
        guard let view = view ?? superview else { return }
        constrainLeading(to: view, spacing: padding.left)
        constrainTop(to: view, spacing: padding.top)
        constrainBottom(to: view, spacing: padding.bottom)
        constrainTrailing(to: view, spacing: padding.right)
    }
    
    ///Constrain view to superview by default, positive values go inwards, negative values go outwards the view
    func constrainLeading(to view: UIView? = nil, spacing: CGFloat = 0) {
        guard let view = view ?? superview else { return }
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacing)
        ])
    }
    
    ///Constrain view to superview by default, positive values go inwards, negative values go outwards the view
    func constrainBottom(to view: UIView? = nil, spacing: CGFloat = 0) {
        guard let view = view ?? superview else { return }
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -spacing)
        ])
    }
    
    ///Constrain view to superview by default, positive values go inwards, negative values go outwards the view
    func constrainTrailing(to view: UIView? = nil, spacing: CGFloat = 0) {
        guard let view = view ?? superview else { return }
        NSLayoutConstraint.activate([
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacing)
        ])
    }
    
    ///Constrain view to superview by default, positive values go inwards, negative values go outwards the view
    func constrainTop(to view: UIView? = nil, spacing: CGFloat = 0) {
        guard let view = view ?? superview else { return }
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor, constant: spacing)
        ])
    }
    
    func constrainSize(height: CGFloat, width: CGFloat) {
        constrain(width: width)
        constrain(height: height)
    }
    
    func constrain(height: CGFloat) {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    func constrain(width: CGFloat) {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: width)
        ])
    }
    
}
