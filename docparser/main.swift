//
//  main.swift
//  docparser
//
//  Created by Sergey Mazulev on 04/07/2019.
//  Copyright © 2019 squatch. All rights reserved.
//

import Foundation

let tocURL = "https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html".asURL

let parser = DocParser(tocURL: tocURL)

parser.parse()
