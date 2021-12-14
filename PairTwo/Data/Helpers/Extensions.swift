//
//  Extensions.swift
//  PairTwo
//
//  Created by Anibal Ventura on 14/12/21.
//

import Foundation

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
