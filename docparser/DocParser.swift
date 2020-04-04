//
//  DocParser.swift
//  docparser
//
//  Created by Sergey Mazulev on 04.04.2020.
//  Copyright © 2020 squatch. All rights reserved.
//

import Foundation
import Kanna

class Chapter {
    var url: URL
    var fileName: String
    var title: String
    var content = ""
    var toc = ""
    
    init(url: URL, title: String) {
        self.url = url
        self.title = title
        self.fileName = url.lastPathComponent.replacing(dict: ["html": "md"])
    }
}

class DocParser {
    let tocURL: URL
    let baseURL: URL
    var chapters = [Chapter]()
    
    init(tocURL: URL) {
        self.tocURL = tocURL
        self.baseURL = tocURL.deletingLastPathComponent()
    }
    
    func parse() {
        parseTableOfContents()
        renderTableOfContents()
        parseChapters()
        renderChapters()
        print("parsing complete")
    }
    
    fileprivate func parseTableOfContents() {
        if let toc = try? Kanna.HTML(url: tocURL, encoding: .utf8) {
            for chapter in toc.xpath("//ul[@class='current']/li/ul[@class='current']/li/a") {
                let href = chapter["href"]!
                let fixedHref = href.replacing(dict: ["#": "TheBasics.html"])
                let url = baseURL.appendingPathComponent(fixedHref)
                let title = chapter.text!
                let chapter = Chapter(url: url, title: title)
                chapters.append(chapter)
            }
        }
    }
    
    fileprivate func renderTableOfContents() {
        var toc = "# Table of Contents\n"
        for chapter in chapters {
            let title = chapter.title
            let name = chapter.url.lastPathComponent.replacing(dict: ["html": "md"])
            toc += "* [\(title)](../master/chapters/\(name))\n"
        }
        
        let fileURL = #file.asFileURL.replacingLast(k: 2, with: ["README.md"])
        try! toc.write(to: fileURL, atomically: true, encoding: .utf8)
    }
    
    fileprivate func parseChapters() {
        var waitForResponse = false
        var queue = [Chapter](chapters)
        while (queue.count > 0) {
            if (waitForResponse == false) {
                waitForResponse = true
                parse(queue.first!) {
                    queue.removeFirst()
                    waitForResponse = false
                }
            }
        }
    }
    
    fileprivate func renderChapters() {
        for chapter in chapters {
            let title = chapter.title
            let name = chapter.url.lastPathComponent.replacing(dict: ["html": "md"])
            let content = "# \(title)\n"+"\(chapter.toc)\n"+"\(chapter.content)"

            let fileURL = #file.asFileURL.replacingLast(k: 2, with: ["chapters", name])
            try! content.write(to: fileURL, atomically: true, encoding: .utf8)
        }
    }
    
    fileprivate func parse(_ chapter: Chapter, completion: @escaping () -> ()) {
        let url = chapter.url
        if let doc = try? Kanna.HTML(url: url, encoding: .utf8) {
            let section = doc.xpath("//div[@class='section']")[0]
            var occurance = 0
            for node in section.xpath("//h1 | //h2 | //h3 | //div[@class='highlight-swift notranslate']") {
                // skip first 2
                occurance += 1
                if occurance <= 2 { continue }
                
                let content = node.text!.replacing(dict: ["¶": ""]).trimmed()
                let link = content.replacing(dict: [ " ": "-", ",": ""]).lowercased()

                if ["h1", "h2", "h3"].contains(node.tagName) {
                    if node.tagName == "h1" {
                        chapter.toc += "* [\(content)](../master/chapters/\(chapter.fileName)#\(link))\n"
                        chapter.content += "# \(content)\n\n"
                    } else if node.tagName == "h2" {
                        chapter.toc += "* [ - \(content)](../master/chapters/\(chapter.fileName)#\(link))\n"
                        chapter.content += "## \(content)\n\n"
                    } else if node.tagName == "h3" {
                        chapter.toc += "* [ - - \(content)](../chapters/\(chapter.fileName)#\(link))\n"
                        chapter.content += "### \(content)\n\n"
                    }
                } else {
                    chapter.content += "```Swift\n\(content)\n```\n\n"
                }
            }
            completion()
        }
    }

}
