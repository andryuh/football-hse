//
//  IParser.swift
//  FootballHSE
//
//  Created by Ekaterina Shtanko on 17.03.2023.
//

import Foundation

public protocol IParser {
    associatedtype Model
    func parse(data: Data) -> Model?
 }
