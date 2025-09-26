//
//  DocumentTests.swift
//  swift-svg
//
//  Created by Coen ten Thije Boonkkamp
//

import Testing
import SVG
import SVGTypes

@Suite("Document Tests")
struct DocumentTests {

    @Test("Document with XML declaration renders correctly")
    func documentWithXMLDeclaration() {
        let doc = Document(includeXMLDeclaration: true) {
            svg(width: 100, height: 100) {
                circle(cx: 50, cy: 50, r: 40)
            }
        }

        let rendered = doc.render()
        #expect(rendered.starts(with: "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"))
        #expect(rendered.contains("<svg"))
        #expect(rendered.contains("<circle"))
    }

    @Test("Document with DOCTYPE renders correctly")
    func documentWithDOCTYPE() {
        let doc = Document(includeXMLDeclaration: true, includeDOCTYPE: true) {
            svg(width: 100, height: 100) {
                rect(x: 10, y: 10, width: 80, height: 80)
            }
        }

        let rendered = doc.render()
        #expect(rendered.contains("<?xml version=\"1.0\" encoding=\"UTF-8\"?>"))
        #expect(rendered.contains("<!DOCTYPE svg PUBLIC"))
        #expect(rendered.contains("svg11.dtd"))
        #expect(rendered.contains("<svg"))
        #expect(rendered.contains("<rect"))
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