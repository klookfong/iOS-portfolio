//
//  Settings.swift
//  ColorSwitch
//
//  Created by Kyle L. on 12/11/20.
//

import SpriteKit

enum Phy{
    static let none: UInt32 = 0
    static let ball: UInt32 = 0x1
    static let color: UInt32 = 0x1 << 1
}

enum BallColors{
    static let colors = [
        UIColor.green,
        UIColor.blue,
        UIColor.yellow,
        UIColor.red
    ]
}

enum ColorState: Int{
    case green, blue, yellow, red 
}
