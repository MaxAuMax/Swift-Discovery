//
//  HexagonParameters.swift
//  Landmarks
//
//  Created by Maxime Mallet on 11/07/2022.
//  Copyright © 2022 Apple. All rights reserved.
//

import Foundation
import CoreGraphics

struct HexagonParameters {
    struct Segment {
        let line: CGPoint
        let curve: CGPoint
        let controle: CGPoint
    }
    
    static let adjustment: CGFloat = 0.085
    
    static let segments = [
        Segment(
            line:     CGPoint(x: 0.60, y: 0.05),
            curve:    CGPoint(x: 0.40, y: 0.05),
            controle: CGPoint(x: 0.50, y: 0.00)
        ),
        Segment(
            line:     CGPoint(x: 0.05, y: 0.20 + adjustment),
            curve:    CGPoint(x: 0.00, y: 0.30 + adjustment),
            controle: CGPoint(x: 0.00, y: 0.25 + adjustment)
        ),
        Segment(
            line:     CGPoint(x: 0.00, y: 0.70 - adjustment),
            curve:    CGPoint(x: 0.05, y: 0.80 - adjustment),
            controle: CGPoint(x: 0.00, y: 0.75 - adjustment)
        ),
        Segment(
            line:     CGPoint(x: 0.40, y: 0.95),
            curve:    CGPoint(x: 0.60, y: 0.95),
            controle: CGPoint(x: 0.50, y: 1.00)
        ),
        Segment(
            line:     CGPoint(x: 0.95, y: 0.80 - adjustment),
            curve:    CGPoint(x: 1.00, y: 0.70 - adjustment),
            controle: CGPoint(x: 1.00, y: 0.75 - adjustment)
        ),
        Segment(
            line:     CGPoint(x: 1.00, y: 0.30 + adjustment),
            curve:    CGPoint(x: 0.95, y: 0.20 + adjustment),
            controle: CGPoint(x: 1.00, y: 0.25 + adjustment)
        )
    ]
}
