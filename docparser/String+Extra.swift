//
//  String+Extra.swift
//  docparser
//
//  Created by Sergey Mazulev on 04.04.2020.
//  Copyright © 2020 squatch. All rights reserved.
//

import Foundation

extension String {
    var asURL: URL {
        URL(string: self)!
    }
    var asFileURL: URL {
        URL(fileURLWithPath: self)
    }
    
    func replacing(dict: Dictionary<String, String>) -> String {
        var string = self
        for (key, value) in dict {
            string = string.replacingOccurrences(of: key, with: value)
        }
        return string
    }
    
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
