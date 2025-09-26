//
//  DebugDetailedTest.swift
//  swift-svg
//
//  Created by Coen ten Thije Boonkkamp
//

import Testing
import SVG
import SVGTypes
import OrderedCollections
@testable import SVG

@Suite("Debug Detailed")
struct DebugDetailedTest {
    @Test func detailedAttributeFlow() {
        // Step 1: Create individual components
        let fillAttr = fill("red")
        var printer = SVGPrinter()

        // Test that attribute adds to printer
        Attribute._render(fillAttr as Attribute, into: &printer)
        print("After fill attribute: printer.attributes = \(printer.attributes)")
        #expect(!printer.attributes.isEmpty)

        // Step 2: Test with SVGGroup
        printer = SVGPrinter()
        let group = SVGGroup {
            fill("blue")
            stroke("black")
        }
        type(of: group)._render(group, into: &printer)
        print("After group with attributes: printer.attributes = \(printer.attributes)")

        // Step 3: Full circle with attributes
        printer = SVGPrinter()
        let circle = circle(cx: 50, cy: 50, r: 40) {
            fill("green")
        }
        type(of: circle)._render(circle, into: &printer)
        let result = String(decoding: printer.bytes, as: UTF8.self)
        print("Final circle: '\(result)'")
        #expect(result.contains("fill"))
    }
}