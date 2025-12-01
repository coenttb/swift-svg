//
//  TextTests.swift
//  swift-svg
//
//  Created by Coen ten Thije Boonkkamp
//

import SVG
import SVG_Standard
import Testing

@Suite("Text Elements Tests")
struct TextTests {

    @Test("Text element renders correctly")
    func textRendering() {
        let svgElement = text("Hello, World!", x: 10, y: 30) {
            fontFamily("Arial")
            fontSize(20)
            fill("black")
        }

        let rendered = svgElement.render()
        #expect(rendered.contains("<text"))
        #expect(rendered.contains("x=\"10\""))
        #expect(rendered.contains("y=\"30\""))
        #expect(rendered.contains("font-family=\"Arial\""))
        #expect(rendered.contains("font-size=\"20\""))
        #expect(rendered.contains("fill=\"black\""))
        #expect(rendered.contains(">Hello, World!</text>"))
    }

    @Test("Text with tspan renders correctly")
    func textWithTspanRendering() {
        let svgElement = text(x: 10, y: 30) {
            fontSize(14)
            tspan("First line")
            tspan("Second line", x: 10, dy: 20)
        }

        let rendered = svgElement.render()
        #expect(rendered.contains("<text"))
        #expect(rendered.contains("font-size=\"14\""))
        #expect(rendered.contains("<tspan"))
        #expect(rendered.contains(">First line</tspan>"))
        #expect(rendered.contains("dy=\"20\""))
        #expect(rendered.contains(">Second line</tspan>"))
        #expect(rendered.contains("</text>"))
    }

    @Test("Text with rotate attribute renders correctly")
    func textRotationRendering() {
        let svgElement = text("Rotated", x: 100, y: 100)
            .attribute("rotate", "0 15 30 45 60")
            .fill("purple")

        let rendered = svgElement.render()
        #expect(rendered.contains("rotate=\"0 15 30 45 60\""))
        #expect(rendered.contains(">Rotated</text>"))
    }

    @Test("Text anchor renders correctly")
    func textAnchorRendering() {
        let svgElement = text("Centered", x: 150, y: 50) {
            textAnchor("middle")
            fill("blue")
        }

        let rendered = svgElement.render()
        #expect(rendered.contains("text-anchor=\"middle\""))
        #expect(rendered.contains(">Centered</text>"))
    }
}
