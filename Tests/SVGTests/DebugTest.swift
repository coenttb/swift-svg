//
//  DebugTest.swift
//  swift-svg
//
//  Created by Coen ten Thije Boonkkamp
//

import Dependencies
import Foundation
import SVG
import SVGPrinter
import SVG_Standard
import Testing

@Suite("Debug")
struct DebugTest {
    @Test func simpleCircleRenders() {
        let svgElement = circle(cx: 50, cy: 50, r: 40)

        let rendered = svgElement.render()
        print("Rendered: '\(rendered)'")
        #expect(!rendered.isEmpty)
    }

    @Test func manualCircleRenders() {
        var printer = SVGPrinter()
        let circle = Circle(cx: 50, cy: 50, r: 40)
        let element = Element(circle, content: SVGEmpty())

        Element<Circle>._render(element, into: &printer)

        let rendered = String(decoding: printer.bytes, as: UTF8.self)
        print("Manual rendered: '\(rendered)'")
        #expect(!rendered.isEmpty)
    }

    @Test("Check document rendering for extra newlines")
    func documentRenderingNewlines() {
        let doc = Document(includeXMLDeclaration: false) {
            svg(width: .number(100), height: .number(100)) {
                circle(cx: 50, cy: 50, r: 40) {
                    fill("red")
                    stroke("black", width: 2)
                }
            }
        }

        let output = doc.render(.pretty)
        print("Output: [\(output)]")
        print("Length: \(output.count)")
        print("Last char: '\(output.last ?? " ")' (code: \(output.last?.asciiValue ?? 0))")
        print("Ends with newline: \(output.hasSuffix("\n"))")

        // Check the expected output
        let expected = """
            <svg width="100" height="100" xmlns="http://www.w3.org/2000/svg">
              <circle cx="50" cy="50" r="40" fill="red" stroke="black" stroke-width="2"></circle>
            </svg>
            """

        // Compare without trailing newline
        #expect(output.trimmingCharacters(in: .newlines) == expected)

        // Check if there's an extra newline
        if output.hasSuffix("\n") {
            print("WARNING: Output has trailing newline")
        }
    }
}
