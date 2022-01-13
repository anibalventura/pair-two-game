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

// Remove duplicate chars on a String.
// print("AAABCC".squeezed) --> "ABC"
extension RangeReplaceableCollection where Element: Hashable {
    var squeezed: Self {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
