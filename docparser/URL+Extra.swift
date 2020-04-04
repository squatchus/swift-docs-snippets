//
//  URL+Extra.swift
//  docparser
//
//  Created by Sergey Mazulev on 04.04.2020.
//  Copyright © 2020 squatch. All rights reserved.
//

import Foundation

extension URL {
    func replacingLast(k: Int, with components: [String]) -> URL {
        var url = self
        for _ in 0..<k {
            url = url.deletingLastPathComponent()
        }
        for comp in components {
            url = url.appendingPathComponent(comp)
        }
        return url
    }
}
