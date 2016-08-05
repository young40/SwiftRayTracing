//
//  DoubleExtension.swift
//  SwiftRayTracing
//
//  Created by Peter Young on 8/6/16.
//  Copyright © 2016 Peter Young. All rights reserved.
//

extension Double {
    func format(_ f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}
