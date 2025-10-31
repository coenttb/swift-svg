//
//  TransformTests.swift
//  swift-svg
//
//  Created by Coen ten Thije Boonkkamp
//

import SVG
import SVGTypes
import Testing

@Suite("Transform Tests")
struct TransformTests {

  @Test("Single transform renders correctly")
  func singleTransformRendering() {
    let svgElement = rect(x: 10, y: 10, width: 50, height: 50) {
      transform(.rotate(angle: 45))
      fill("red")
    }

    let rendered = svgElement.render()
    #expect(rendered.contains("transform=\"rotate(45)\""))
  }

  @Test("Multiple transforms render correctly")
  func multipleTransformsRendering() {
    let svgElement = rect(x: 0, y: 0, width: 30, height: 30) {
      transform([
        .translate(x: 50, y: 50),
        .rotate(angle: 45),
        .scale(x: 2),
      ])
      fill("blue")
    }

    let rendered = svgElement.render()
    #expect(rendered.contains("transform=\"translate(50 50) rotate(45) scale(2)\""))
  }

  @Test("Transform types render correctly")
  func transformTypesRendering() {
    // Translate
    let translate = SVGTransform.translate(x: 10, y: 20).stringValue
    #expect(translate == "translate(10 20)")

    // Scale with both values
    let scale = SVGTransform.scale(x: 2, y: 3).stringValue
    #expect(scale == "scale(2 3)")

    // Scale with single value
    let scaleUniform = SVGTransform.scale(x: 2).stringValue
    #expect(scaleUniform == "scale(2)")

    // Rotate simple
    let rotate = SVGTransform.rotate(angle: 45).stringValue
    #expect(rotate == "rotate(45)")

    // Rotate around center
    let rotateCenter = SVGTransform.rotate(angle: 45, cx: 50, cy: 50).stringValue
    #expect(rotateCenter == "rotate(45 50 50)")

    // SkewX
    let skewX = SVGTransform.skewX(angle: 30).stringValue
    #expect(skewX == "skewX(30)")

    // SkewY
    let skewY = SVGTransform.skewY(angle: 30).stringValue
    #expect(skewY == "skewY(30)")

    // Matrix
    let matrix = SVGTransform.matrix(a: 1, b: 0, c: 0, d: 1, e: 30, f: 40).stringValue
    #expect(matrix == "matrix(1 0 0 1 30 40)")
  }

  @Test("Transform on group renders correctly")
  func groupTransformRendering() {
    let svgElement = g(transform: [.scale(x: 1.5), .translate(x: 10, y: 20)]) {
      circle(cx: 0, cy: 0, r: 25)
      rect(x: -10, y: -10, width: 20, height: 20)
    }

    let rendered = svgElement.render()
    #expect(rendered.contains("transform=\"scale(1.5) translate(10 20)\""))
  }
}
