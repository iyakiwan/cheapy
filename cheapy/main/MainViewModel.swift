//
//  MainViewModel.swift
//  cheapy
//
//  Created by Mufti Alie Satriawan on 11/12/22.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var listWeightItems: [Item] = []
    @Published var listVolumeItems: [Item] = []
    @Published var isShowSheetInputAdd: Bool = false
    
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
    
    func addData(isWeight: Bool, item: Item) {
        if isWeight {
            listWeightItems.append(item)
        } else {
            listVolumeItems.append(item)
        }
    }
    
    func updateData(isWeight: Bool, item: Item) {
        if isWeight {
            listWeightItems = listWeightItems.map{ $0.id == item.id ? item : $0 }
        } else {
            listVolumeItems = listVolumeItems.map{ $0.id == item.id ? item : $0 }
        }
    }
}
