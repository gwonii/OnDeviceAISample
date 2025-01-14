//
//  Collection+Extension.swift
//  OnDeviceAISample
//
//  Created by nhn on 1/14/25.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
