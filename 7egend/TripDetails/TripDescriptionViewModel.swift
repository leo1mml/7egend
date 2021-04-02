//
//  TripDescriptionViewModel.swift
//  7egend
//
//  Created by Leonel Menezes on 02/04/2021.
//

import Foundation

struct TripDescriptionViewModel: Hashable {
    let id = UUID()
    let title: String
    let description: String
}
