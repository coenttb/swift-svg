//
//  DocumentTests.swift
//  swift-svg
//
//  Created by Coen ten Thije Boonkkamp
//

import SVG
import SVG_Standard
import Testing

@Suite("Document Tests")
struct DocumentTests {

    @Test("SVG element renders with dimensions")
    func svgWithDimensions() {
        let svgElement = svg(width: 100, height: 100) {
            circle(cx: 50, cy: 50, r: 40)
        }

        let rendered = svgElement.render()
        #expect(rendered.contains("<svg"))
        #expect(rendered.contains("width=\"100\""))
        #expect(rendered.contains("height=\"100\""))
        #expect(rendered.contains("<circle"))
        #expect(rendered.contains("</svg>"))
    }

    @Test("SVG with nested elements renders correctly")
    func svgWithNestedElements() {
        let svgElement = svg(width: 100, height: 100) {
            rect(x: 10, y: 10, width: 80, height: 80)
        }

        let rendered = svgElement.render()
        #expect(rendered.contains("<svg"))
        #expect(rendered.contains("<rect"))
        #expect(rendered.contains("</svg>"))
    }

    @Test("Pretty printing works correctly")
    func prettyPrintingRendering() {
        let svgElement = svg {
            g {
                circle(cx: 50, cy: 50, r: 40)
                rect(x: 10, y: 10, width: 30, height: 30)
            }
        }

        let rendered = svgElement.render(.pretty)
        #expect(rendered.contains("\n"))
        #expect(rendered.contains("  "))  // Indentation
    }

    @Test("Compact rendering works correctly")
    func compactRendering() {
        let svgElement = svg {
            circle(cx: 50, cy: 50, r: 40)
        }

        let rendered = svgElement.render(.default)
        #expect(!rendered.contains("\n"))
    }
}
