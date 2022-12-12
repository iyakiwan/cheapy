//
//  MainModel.swift
//  cheapy
//
//  Created by Mufti Alie Satriawan on 12/12/22.
//

import Foundation

struct Item: Identifiable {
    let id: UUID
    let brand: String
    let net: Float
    let realNet: Float
    let unit: UnitItem
    let money: Int
}

let dummyWeightItems: [Item] = [
    .init(id: UUID(), brand: "Head & Shoulders", net: 70, realNet: 70 * 1000, unit: UnitItem.ml, money: 13900),
    .init(id: UUID(), brand: "Head & Shoulders", net: 160, realNet: 160 * 1000, unit: UnitItem.ml, money: 33900)
]

let dummyVolumeItems: [Item] = [
    .init(id: UUID(), brand: "Pepsodent 190 + 15", net: 205, realNet: 205 * 1000, unit: UnitItem.g, money: 12000),
    .init(id: UUID(), brand: "Pepsodent 190 + 25", net: 215, realNet: 215 * 1000, unit: UnitItem.ml, money: 13000)
]

let dummyResultWeightItem = Item(id: UUID(), brand: "Head & Shoulders", net: 70, realNet: 70 * 1000, unit: UnitItem.ml, money: 13900)
let dummyResultVolumeItem = Item(id: UUID(), brand: "Pepsodent 190 + 15", net: 205, realNet: 205 * 1000, unit: UnitItem.g, money: 12000)

enum FilterItem: String {
    case weight = "By Weight"
    case volume = "By Volume"
}

enum UnitItem: String {
    case g = "g"
    case kg = "kg"
    case l = "l"
    case ml = "ml"
}

func calculateWeightCheapest(listItems: [Item]) -> Item {
    var resultCheapest: Item = listItems[0]
    var calCheapestCounter = calculateCheapest(money: listItems[0].money, net: listItems[0].realNet)
    for item in listItems {
        let calCheapestItem = calculateCheapest(money: item.money, net: item.realNet)
        if calCheapestItem < calCheapestCounter {
            calCheapestCounter = calCheapestItem
            resultCheapest = item
        }
    }
    return resultCheapest
}
