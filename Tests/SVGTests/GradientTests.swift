//
//  GradientTests.swift
//  swift-svg
//
//  Created by Coen ten Thije Boonkkamp
//

import SVG
import SVGTypes
import Testing

@Suite("Gradient Tests")
struct GradientTests {

  @Test("Linear gradient renders correctly")
  func linearGradientRendering() {
    let svgElement = svg {
      defs {
        linearGradient(id: "grad1", x1: "0%", y1: "0%", x2: "100%", y2: "0%") {
          stop(offset: "0%", stopColor: "rgb(255,255,0)", stopOpacity: 1)
          stop(offset: "100%", stopColor: "rgb(255,0,0)", stopOpacity: 1)
        }
      }
      ellipse(cx: 200, cy: 70, rx: 85, ry: 55) {
        fill("url(#grad1)")
      }
    }

    let rendered = svgElement.render()
    #expect(rendered.contains("<linearGradient"))
    #expect(rendered.contains("id=\"grad1\""))
    #expect(rendered.contains("x1=\"0%\""))
    #expect(rendered.contains("y1=\"0%\""))
    #expect(rendered.contains("x2=\"100%\""))
    #expect(rendered.contains("y2=\"0%\""))
    #expect(rendered.contains("<stop"))
    #expect(rendered.contains("offset=\"0%\""))
    #expect(rendered.contains("stop-color=\"rgb(255,255,0)\""))
    #expect(rendered.contains("stop-opacity=\"1\""))
    #expect(rendered.contains("fill=\"url(#grad1)\""))
  }

  @Test("Radial gradient renders correctly")
  func radialGradientRendering() {
    let svgElement = svg {
      defs {
        radialGradient(id: "grad2", cx: "50%", cy: "50%", r: "50%", fx: "50%", fy: "50%") {
          stop(offset: "0%", stopColor: "white")
          stop(offset: "100%", stopColor: "blue")
        }
      }
      circle(cx: 100, cy: 100, r: 80) {
        fill("url(#grad2)")
      }
    }

    let rendered = svgElement.render()
    #expect(rendered.contains("<radialGradient"))
    #expect(rendered.contains("id=\"grad2\""))
    #expect(rendered.contains("cx=\"50%\""))
    #expect(rendered.contains("cy=\"50%\""))
    #expect(rendered.contains("r=\"50%\""))
    #expect(rendered.contains("fx=\"50%\""))
    #expect(rendered.contains("fy=\"50%\""))
    #expect(rendered.contains("stop-color=\"white\""))
    #expect(rendered.contains("stop-color=\"blue\""))
  }

  @Test("Gradient with spread method renders correctly")
  func gradientSpreadMethodRendering() {
    let svgElement = linearGradient(
      id: "spread",
      x1: "30%",
      x2: "70%",
      spreadMethod: .reflect
    ) {
      stop(offset: "0%", stopColor: "red")
      stop(offset: "100%", stopColor: "blue")
    }

    let rendered = svgElement.render()
    #expect(rendered.contains("spread-method=\"reflect\""))
  }

  @Test("Gradient transform renders correctly")
  func gradientTransformRendering() {
    let svgElement = linearGradient(
      id: "transformed",
      gradientTransform: "rotate(45)"
    ) {
      stop(offset: "0%", stopColor: "black")
      stop(offset: "100%", stopColor: "white")
    }

    let rendered = svgElement.render()
    #expect(rendered.contains("gradient-transform=\"rotate(45)\""))
  }
}
