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
    
    func clearData(isWeight: Bool) {
        if isWeight {
            listWeightItems = []
        } else {
            listVolumeItems = []
        }
    }
    
    func deleteDataById(isWeight: Bool, selectedId: UUID) {
        if isWeight {
            listWeightItems = listWeightItems.filter{$0.id != selectedId}
        } else {
            listVolumeItems = listVolumeItems.filter{$0.id != selectedId}
        }
    }
}
