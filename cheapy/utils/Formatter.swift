//
//  Formatter.swift
//  cheapy
//
//  Created by Mufti Alie Satriawan on 12/12/22.
//

import Foundation

public func formatNet(input : Float) -> String {
    return String(format: "%.2f", input)
}

public func calculateCheapest(money : Int, net :Float) -> Float {
    return Float(money) / net
}
