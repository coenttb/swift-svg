//
//  TransformTests.swift
//  swift-svg
//
//  Created by Coen ten Thije Boonkkamp
//

import SVG
import SVG_Standard
import Testing

@Suite("Transform Tests")
struct TransformTests {

    @Test("Transform renders correctly using method")
    func transformMethodRendering() {
        let svgElement = rect(x: 10, y: 10, width: 50, height: 50)
            .transform("rotate(45)")
            .fill("red")

        let rendered = svgElement.render()
        #expect(rendered.contains("transform=\"rotate(45)\""))
    }

    @Test("Transform renders correctly using global function")
    func transformFunctionRendering() {
        let svgElement = rect(x: 10, y: 10, width: 50, height: 50) {
            transform("rotate(45)")
            fill("red")
        }

        let rendered = svgElement.render()
        #expect(rendered.contains("transform=\"rotate(45)\""))
    }

    @Test("Translate helper renders correctly")
    func translateRendering() {
        let svgElement = rect(x: 0, y: 0, width: 30, height: 30) {
            translate(x: 50, y: 50)
            fill("blue")
        }

        let rendered = svgElement.render()
        #expect(rendered.contains("transform=\"translate(50"))
    }

    @Test("Rotate helper renders correctly")
    func rotateRendering() {
        let svgElement = rect(x: 0, y: 0, width: 30, height: 30) {
            rotate(45)
            fill("green")
        }

        let rendered = svgElement.render()
        #expect(rendered.contains("transform=\"rotate(45)\""))
    }

    @Test("Rotate with center renders correctly")
    func rotateWithCenterRendering() {
        let svgElement = rect(x: 0, y: 0, width: 30, height: 30)
            .rotate(45, cx: 50, cy: 50)

        let rendered = svgElement.render()
        #expect(rendered.contains("rotate(45"))
        #expect(rendered.contains("50"))
    }

    @Test("Scale helper renders correctly")
    func scaleRendering() {
        let svgElement = rect(x: 0, y: 0, width: 30, height: 30) {
            scale(x: 2)
            fill("purple")
        }

        let rendered = svgElement.render()
        #expect(rendered.contains("transform=\"scale(2)\""))
    }

    @Test("SkewX helper renders correctly")
    func skewXRendering() {
        let svgElement = rect(x: 0, y: 0, width: 30, height: 30) {
            skewX(30)
        }

        let rendered = svgElement.render()
        #expect(rendered.contains("transform=\"skewX(30)\""))
    }

    @Test("SkewY helper renders correctly")
    func skewYRendering() {
        let svgElement = rect(x: 0, y: 0, width: 30, height: 30) {
            skewY(30)
        }

        let rendered = svgElement.render()
        #expect(rendered.contains("transform=\"skewY(30)\""))
    }

    @Test("Transform on group renders correctly")
    func groupTransformRendering() {
        let svgElement = g {
            transform("scale(1.5)")
            circle(cx: 0, cy: 0, r: 25)
            rect(x: -10, y: -10, width: 20, height: 20)
        }

        let rendered = svgElement.render()
        #expect(rendered.contains("transform=\"scale(1.5)\""))
        #expect(rendered.contains("<circle"))
        #expect(rendered.contains("<rect"))
    }
}
