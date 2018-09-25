//
//  String+LinkExtractor.swift
//  LearnFlux
//
//  Created by Martin Tjandra on 1/3/18.
//  Copyright © 2018 Martin Darma Kusuma Tjandra. All rights reserved.
//

import Foundation

extension String {
    
    func extractURLs() -> [URL] {
        var urls : [URL] = []
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
            detector.enumerateMatches(in: self,
                                      options: [],
                                      range: NSMakeRange(0, count),
                                      using: { (result, _, _) in
                                        if let match = result, let url = match.url {
                                            urls.append(url)
                                        }
            })
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return urls
    }
    
}
