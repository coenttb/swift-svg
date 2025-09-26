//
//  ContainerTests.swift
//  swift-svg
//
//  Created by Coen ten Thije Boonkkamp
//

import Testing
import SVG
import SVGTypes

@Suite("Container Elements Tests")
struct ContainerTests {

    @Test("SVG root element renders correctly")
    func svgRootRendering() {
        let svgElement = svg(width: 200, height: 100) {
            circle(cx: 50, cy: 50, r: 40) {
                fill("red")
            }
        }

        let rendered = svgElement.render()
        #expect(rendered.contains("<svg"))
        #expect(rendered.contains("width=\"200\""))
        #expect(rendered.contains("height=\"100\""))
        #expect(rendered.contains("<circle"))
        #expect(rendered.contains("</svg>"))
    }

    @Test("Group element renders correctly")
    func groupRendering() {
        let svgElement = g(transform: .translate(x: 50, y: 50)) {
            circle(cx: 0, cy: 0, r: 25) {
                fill("blue")
            }
            rect(x: -10, y: -10, width: 20, height: 20) {
                fill("white")
            }
        }

        let rendered = svgElement.render()
        #expect(rendered.contains("<g"))
        #expect(rendered.contains("transform=\"translate(50 50)\""))
        #expect(rendered.contains("<circle"))
        #expect(rendered.contains("<rect"))
        #expect(rendered.contains("</g>"))
    }

    @Test("Nested groups render correctly")
    func nestedGroupsRendering() {
        let svgElement = svg(width: 300, height: 200) {
            g(transform: .scale(x: 2)) {
                g(transform: .rotate(angle: 45)) {
                    rect(x: 0, y: 0, width: 50, height: 50) {
                        fill("red")
                    }
                }
            }
        }

        let rendered = svgElement.render()
        #expect(rendered.contains("transform=\"scale(2)\""))
        #expect(rendered.contains("transform=\"rotate(45)\""))
        #expect(rendered.contains("<rect"))
    }

    @Test("Defs element renders correctly")
    func defsRendering() {
        let svgElement = svg {
            defs {
                linearGradient(id: "myGradient", x1: "0%", y1: "0%", x2: "100%", y2: "0%") {
                    stop(offset: "0%", stopColor: "rgb(255,255,0)")
                    stop(offset: "100%", stopColor: "rgb(255,0,0)")
                }
            }
            circle(cx: 50, cy: 50, r: 40) {
                fill("url(#myGradient)")
            }
        }

        let rendered = svgElement.render()
        #expect(rendered.contains("<defs>"))
        #expect(rendered.contains("<linearGradient"))
        #expect(rendered.contains("id=\"myGradient\""))
        #expect(rendered.contains("<stop"))
        #expect(rendered.contains("</defs>"))
        #expect(rendered.contains("fill=\"url(#myGradient)\""))
    }

    @Test("Symbol and use elements render correctly")
    func symbolAndUseRendering() {
        let svgElement = svg {
            defs {
                symbol(id: "mySymbol", viewBox: "0 0 100 100") {
                    circle(cx: 50, cy: 50, r: 40) {
                        fill("green")
                    }
                }
            }
            use(href: "#mySymbol", x: 10, y: 10, width: 100, height: 100)
        }

        let rendered = svgElement.render()
        #expect(rendered.contains("<symbol"))
        #expect(rendered.contains("id=\"mySymbol\""))
        #expect(rendered.contains("viewBox=\"0 0 100 100\""))
        #expect(rendered.contains("<use"))
        #expect(rendered.contains("href=\"#mySymbol\""))
        #expect(rendered.contains("x=\"10\""))
        #expect(rendered.contains("y=\"10\""))
    }
}