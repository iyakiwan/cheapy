//
//  MainViewModel.swift
//  cheapy
//
//  Created by Mufti Alie Satriawan on 11/12/22.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var listWeightItems: [Item] = dummyWeightItems
    @Published var listVolumeItems: [Item] = dummyVolumeItems
}
