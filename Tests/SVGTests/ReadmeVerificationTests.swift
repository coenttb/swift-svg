//
//  ReadmeVerificationTests.swift
//  swift-svg
//
//  README verification tests - ensures all code examples compile and work
//

import SVG
import SVGTypes
import Testing

@Suite("README Verification")
struct ReadmeVerificationTests {

  @Test("Overview example from README line 13-37")
  func overviewExample() {
    let logo = svg(width: 200, height: 200) {
      defs {
        linearGradient(id: "gradient", x1: "0%", y1: "0%", x2: "100%", y2: "100%") {
          stop(offset: "0%", stopColor: "#FF6B6B")
          stop(offset: "100%", stopColor: "#4ECDC4")
        }
      }

      circle(cx: 100, cy: 100, r: 80) {
        fill("url(#gradient)")
        stroke("#333")
        strokeWidth(2)
      }

      text("Swift", x: 100, y: 105) {
        fontSize(24)
        fontFamily("system-ui, sans-serif")
        textAnchor("middle")
        fill("white")
      }
    }

    let svgString = logo.render()
    #expect(svgString.contains("<svg"))
    #expect(svgString.contains("width=\"200\""))
    #expect(svgString.contains("height=\"200\""))
    #expect(svgString.contains("linearGradient"))
    #expect(svgString.contains("gradient"))
    #expect(svgString.contains("circle"))
    #expect(svgString.contains("text"))
  }

  @Test("Quick Start example from README line 62-74")
  func quickStartExample() {
    let icon = svg(viewBox: "0 0 24 24") {
      path(d: "M12 2L2 7l10 5 10-5-10-5z") {
        fill("currentColor")
      }
      path(d: "M2 17l10 5 10-5-10-5z") {
        fill("currentColor")
        opacity(0.7)
      }
    }

    let svgString = icon.render()
    #expect(svgString.contains("<svg"))
    #expect(svgString.contains("viewBox=\"0 0 24 24\""))
    #expect(svgString.contains("<path"))
    #expect(svgString.contains("M12 2L2 7l10 5 10-5-10-5z"))
    #expect(svgString.contains("M2 17l10 5 10-5-10-5z"))
    #expect(svgString.contains("fill=\"currentColor\""))
    #expect(svgString.contains("opacity=\"0.7\""))
  }

  @Test("Basic shapes example from README line 82-96")
  func basicShapesExample() {
    let basicShapes = svg(width: 200, height: 200) {
      circle(cx: 50, cy: 50, r: 40) {
        fill("red")
        stroke("black", width: 2)
      }

      rect(x: 100, y: 10, width: 80, height: 60, rx: 5) {
        fill("blue")
        opacity(0.5)
      }
    }

    let output = basicShapes.render()
    #expect(output.contains("<svg"))
    #expect(output.contains("<circle"))
    #expect(output.contains("cx=\"50\""))
    #expect(output.contains("cy=\"50\""))
    #expect(output.contains("r=\"40\""))
    #expect(output.contains("fill=\"red\""))
    #expect(output.contains("stroke=\"black\""))
    #expect(output.contains("stroke-width=\"2\""))
    #expect(output.contains("<rect"))
    #expect(output.contains("x=\"100\""))
    #expect(output.contains("y=\"10\""))
    #expect(output.contains("width=\"80\""))
    #expect(output.contains("height=\"60\""))
    #expect(output.contains("rx=\"5\""))
    #expect(output.contains("fill=\"blue\""))
    #expect(output.contains("opacity=\"0.5\""))
  }

  @Test("Gradients example from README line 102-115")
  func gradientsExample() {
    let gradientExample = svg(width: 200, height: 200) {
      defs {
        linearGradient(id: "myGradient", x1: "0%", y1: "0%", x2: "100%", y2: "0%") {
          stop(offset: "0%", stopColor: "red")
          stop(offset: "100%", stopColor: "blue")
        }
      }

      circle(cx: 100, cy: 100, r: 80) {
        fill("url(#myGradient)")
      }
    }

    let output = gradientExample.render()
    #expect(output.contains("<svg"))
    #expect(output.contains("<defs"))
    #expect(output.contains("linearGradient"))
    #expect(output.contains("id=\"myGradient\""))
    #expect(output.contains("x1=\"0%\""))
    #expect(output.contains("y1=\"0%\""))
    #expect(output.contains("x2=\"100%\""))
    #expect(output.contains("y2=\"0%\""))
    #expect(output.contains("stop"))
    #expect(output.contains("offset=\"0%\""))
    #expect(output.contains("stop-color=\"red\""))
    #expect(output.contains("offset=\"100%\""))
    #expect(output.contains("stop-color=\"blue\""))
    #expect(output.contains("<circle"))
    #expect(output.contains("fill=\"url(#myGradient)\""))
  }

  @Test("Text elements example from README line 121-130")
  func textElementsExample() {
    let textExample = svg(width: 200, height: 100) {
      text("Hello SVG", x: 100, y: 50) {
        fontSize(24)
        fontFamily("system-ui, sans-serif")
        textAnchor("middle")
        fill("black")
      }
    }

    let output = textExample.render()
    #expect(output.contains("<svg"))
    #expect(output.contains("width=\"200\""))
    #expect(output.contains("height=\"100\""))
    #expect(output.contains("<text"))
    #expect(output.contains("x=\"100\""))
    #expect(output.contains("y=\"50\""))
    #expect(output.contains("font-size=\"24\""))
    #expect(output.contains("font-family=\"system-ui, sans-serif\""))
    #expect(output.contains("text-anchor=\"middle\""))
    #expect(output.contains("fill=\"black\""))
    #expect(output.contains("Hello SVG"))
  }

  @Test("Testing example from README line 143-157")
  func testingExample() {
    let logo = svg(width: 100, height: 100) {
      circle(cx: 50, cy: 50, r: 45) {
        fill("blue")
      }
    }

    let output = logo.render()
    #expect(output.contains("<svg"))
    #expect(output.contains("width=\"100\""))
    #expect(output.contains("height=\"100\""))
    #expect(output.contains("<circle"))
    #expect(output.contains("cx=\"50\""))
    #expect(output.contains("cy=\"50\""))
    #expect(output.contains("r=\"45\""))
    #expect(output.contains("fill=\"blue\""))
  }
}
