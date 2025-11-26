//
//  SVGSnapshotTests.swift
//  swift-svg
//
//  Created by Coen ten Thije Boonkkamp
//

import InlineSnapshotTesting
import SVG
import SVGTestSupport
import SVG_Standard
import Testing

@Suite(
    "SVG Snapshot Tests",
    .snapshots(record: .never)
)
struct SVGSnapshotTests {

    // MARK: - Basic Shapes

    @Test("Circle element snapshot")
    func circleSnapshot() {
        assertInlineSnapshot(
            of: Document.test(width: 100, height: 100) {
                circle(cx: 50, cy: 50, r: 40) {
                    fill("red")
                    stroke("black", width: 2)
                }
            },
            as: .svgDocument
        ) {
            """
            <svg width="100" height="100" xmlns="http://www.w3.org/2000/svg">
              <circle cx="50" cy="50" r="40" fill="red" stroke="black" stroke-width="2"></circle>
            </svg>
            """
        }
    }

    @Test("Rectangle element snapshot")
    func rectangleSnapshot() {
        assertInlineSnapshot(
            of: Document.test(width: 120, height: 80) {
                rect(x: 10, y: 10, width: 100, height: 60, rx: 5, ry: 5) {
                    fill("blue")
                    opacity(0.7)
                }
            },
            as: .svgDocument
        ) {
            """
            <svg width="120" height="80" xmlns="http://www.w3.org/2000/svg">
              <rect x="10" y="10" width="100" height="60" rx="5" ry="5" fill="blue" opacity="0.7"></rect>
            </svg>
            """
        }
    }

    @Test("Ellipse element snapshot")
    func ellipseSnapshot() {
        assertInlineSnapshot(
            of: Document.test(width: 200, height: 100) {
                ellipse(cx: 100, cy: 50, rx: 80, ry: 40) {
                    fill("green")
                    strokeWidth(3)
                    stroke("purple")
                }
            },
            as: .svgDocument
        ) {
            """
            <svg width="200" height="100" xmlns="http://www.w3.org/2000/svg">
              <ellipse cx="100" cy="50" rx="80" ry="40" fill="green" stroke-width="3" stroke="purple"></ellipse>
            </svg>
            """
        }
    }

    @Test("Line element snapshot")
    func lineSnapshot() {
        assertInlineSnapshot(
            of: Document.test(width: 200, height: 200) {
                line(x1: 10, y1: 10, x2: 190, y2: 190) {
                    stroke("red")
                    strokeWidth(2)
                    strokeDasharray(5, 5)
                }
            },
            as: .svgDocument
        ) {
            """
            <svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
              <line x1="10" y1="10" x2="190" y2="190" stroke="red" stroke-width="2" stroke-dasharray="5 5"></line>
            </svg>
            """
        }
    }

    @Test("Polygon element snapshot")
    func polygonSnapshot() {
        assertInlineSnapshot(
            of: Document.test(width: 200, height: 200) {
                polygon(coordinates: [(100, 10), (40, 198), (190, 78), (10, 78), (160, 198)]) {
                    fill("lime")
                    stroke("purple")
                    strokeWidth(1)
                }
            },
            as: .svgDocument
        ) {
            """
            <svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
              <polygon points="100,10 40,198 190,78 10,78 160,198" fill="lime" stroke="purple" stroke-width="1"></polygon>
            </svg>
            """
        }
    }

    @Test("Polyline element snapshot")
    func polylineSnapshot() {
        assertInlineSnapshot(
            of: Document.test(width: 200, height: 200) {
                polyline(coordinates: [
                    (20, 20), (40, 25), (60, 40), (80, 120), (120, 140), (200, 180),
                ]) {
                    fill("none")
                    stroke("black")
                    strokeWidth(3)
                }
            },
            as: .svgDocument
        ) {
            """
            <svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
              <polyline points="20,20 40,25 60,40 80,120 120,140 200,180" fill="none" stroke="black" stroke-width="3"></polyline>
            </svg>
            """
        }
    }

    @Test("Path element snapshot")
    func pathSnapshot() {
        assertInlineSnapshot(
            of: Document.test(width: 200, height: 200) {
                path(d: "M 10 10 L 90 10 L 50 80 Z") {
                    fill("orange")
                    stroke("black")
                }
            },
            as: .svgDocument
        ) {
            """
            <svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
              <path d="M 10 10 L 90 10 L 50 80 Z" fill="orange" stroke="black"></path>
            </svg>
            """
        }
    }

    // MARK: - Container Elements

    @Test("Group element snapshot")
    func groupSnapshot() {
        assertInlineSnapshot(
            of: Document.test(width: 200, height: 200) {
                g {
                    fill("red")
                    opacity(0.5)

                    circle(cx: 50, cy: 50, r: 30)
                    rect(x: 100, y: 100, width: 80, height: 60)
                }
            },
            as: .svgDocument
        ) {
            """
            <svg width="200" height="200" xmlns="http://www.w3.org/2000/svg" fill="red" opacity="0.5">
              <g fill="red" opacity="0.5">
                <circle cx="50" cy="50" r="30"></circle>
                <rect x="100" y="100" width="80" height="60"></rect>
              </g>
            </svg>
            """
        }
    }

    @Test("Nested groups snapshot")
    func nestedGroupsSnapshot() {
        assertInlineSnapshot(
            of: Document.test(width: 300, height: 200) {
                g {
                    transform(.translate(x: 50, y: 50))

                    g {
                        fill("blue")
                        circle(cx: 0, cy: 0, r: 20)
                        rect(x: 30, y: -10, width: 40, height: 20)
                    }

                    g {
                        fill("green")
                        transform(.rotate(angle: 45))
                        rect(x: -15, y: -15, width: 30, height: 30)
                    }
                }
            },
            as: .svgDocument
        ) {
            """
            <svg width="300" height="200" xmlns="http://www.w3.org/2000/svg" transform="rotate(45)" fill="green">
              <g transform="rotate(45)" fill="green">
                <g fill="blue">
                  <circle cx="0" cy="0" r="20"></circle>
                  <rect x="30" y="-10" width="40" height="20"></rect>
                </g>
                <g fill="green" transform="rotate(45)">
                  <rect x="-15" y="-15" width="30" height="30"></rect>
                </g>
              </g>
            </svg>
            """
        }
    }

    // MARK: - Text Elements

    @Test("Text element snapshot")
    func textSnapshot() {
        assertInlineSnapshot(
            of: Document.test(width: 300, height: 100) {
                text("Hello, SVG!", x: 10, y: 30) {
                    fontFamily("Arial")
                    fontSize(24)
                    fill("black")
                }
            },
            as: .svgDocument
        ) {
            """
            <svg width="300" height="100" xmlns="http://www.w3.org/2000/svg">
              <text x="10" y="30" font-family="Arial" font-size="24" fill="black">Hello, SVG!</text>
            </svg>
            """
        }
    }

    @Test("Text with tspan snapshot")
    func textWithTspanSnapshot() {
        assertInlineSnapshot(
            of: Document.test(width: 300, height: 100) {
                text(x: 10, y: 30) {
                    fontSize(16)

                    tspan("First line")
                    tspan("Second line", x: 10, dy: 20) {
                        fill("red")
                    }
                    tspan("Third line", x: 10, dy: 20) {
                        fontWeight("bold")
                    }
                }
            },
            as: .svgDocument
        ) {
            """
            <svg width="300" height="100" xmlns="http://www.w3.org/2000/svg" font-size="16">
              <text x="10" y="30" font-size="16">
                <tspan>First line</tspan>
                <tspan x="10" dy="20" fill="red">Second line</tspan>
                <tspan x="10" dy="20" font-weight="bold">Third line</tspan>
              </text>
            </svg>
            """
        }
    }

    // MARK: - Gradients

    @Test("Linear gradient snapshot")
    func linearGradientSnapshot() {
        assertInlineSnapshot(
            of: Document.test(width: 200, height: 100) {
                defs {
                    linearGradient(
                        id: "grad1",
                        x1: "0%",
                        y1: "0%",
                        x2: "100%",
                        y2: "0%"
                    ) {
                        stop(offset: "0%", stopColor: "rgb(255,255,0)")
                        stop(offset: "100%", stopColor: "rgb(255,0,0)")
                    }
                }

                rect(x: 10, y: 10, width: 180, height: 80) {
                    fill("url(#grad1)")
                }
            },
            as: .svgDocument
        ) {
            """
            <svg width="200" height="100" xmlns="http://www.w3.org/2000/svg">
              <defs>
                <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="0%">
                  <stop offset="0%" stop-color="rgb(255,255,0)"></stop>
                  <stop offset="100%" stop-color="rgb(255,0,0)"></stop>
                </linearGradient>
              </defs>
              <rect x="10" y="10" width="180" height="80" fill="url(#grad1)"></rect>
            </svg>
            """
        }
    }

    @Test("Radial gradient snapshot")
    func radialGradientSnapshot() {
        assertInlineSnapshot(
            of: Document.test(width: 200, height: 200) {
                defs {
                    radialGradient(
                        id: "grad2",
                        cx: "50%",
                        cy: "50%",
                        r: "50%"
                    ) {
                        stop(offset: "0%", stopColor: "white")
                        stop(offset: "100%", stopColor: "blue")
                    }
                }

                circle(cx: 100, cy: 100, r: 80) {
                    fill("url(#grad2)")
                }
            },
            as: .svgDocument
        ) {
            """
            <svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
              <defs>
                <radialGradient id="grad2" cx="50%" cy="50%" r="50%">
                  <stop offset="0%" stop-color="white"></stop>
                  <stop offset="100%" stop-color="blue"></stop>
                </radialGradient>
              </defs>
              <circle cx="100" cy="100" r="80" fill="url(#grad2)"></circle>
            </svg>
            """
        }
    }

    // MARK: - Transforms

    @Test("Transform combinations snapshot")
    func transformCombinationsSnapshot() {
        assertInlineSnapshot(
            of: Document.test(width: 300, height: 300) {
                rect(x: 50, y: 50, width: 100, height: 100) {
                    fill("red")
                    transform(
                        .translate(x: 100, y: 100),
                        .rotate(angle: 45),
                        .scale(x: 0.5, y: 0.5)
                    )
                }
            },
            as: .svgDocument
        ) {
            """
            <svg width="300" height="300" xmlns="http://www.w3.org/2000/svg">
              <rect x="50" y="50" width="100" height="100" fill="red" transform="translate(100 100) rotate(45) scale(0.5 0.5)"></rect>
            </svg>
            """
        }
    }

    // MARK: - Clipping and Masking

    @Test("ClipPath snapshot")
    func clipPathSnapshot() {
        assertInlineSnapshot(
            of: Document.test(width: 200, height: 200) {
                defs {
                    clipPath(id: "clip1") {
                        circle(cx: 100, cy: 100, r: 50)
                    }
                }

                rect(x: 0, y: 0, width: 200, height: 200) {
                    fill("blue")
                    clipPath("url(#clip1)")
                }
            },
            as: .svgDocument
        ) {
            """
            <svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
              <defs>
                <clipPath id="clip1">
                  <circle cx="100" cy="100" r="50"></circle>
                </clipPath>
              </defs>
              <rect x="0" y="0" width="200" height="200" fill="blue" clip-path="url(#clip1)"></rect>
            </svg>
            """
        }
    }

    @Test("Mask snapshot")
    func maskSnapshot() {
        assertInlineSnapshot(
            of: Document.test(width: 200, height: 200) {
                defs {
                    mask(id: "mask1") {
                        rect(x: 0, y: 0, width: 200, height: 200) {
                            fill("white")
                        }
                        circle(cx: 100, cy: 100, r: 50) {
                            fill("black")
                        }
                    }
                }

                rect(x: 0, y: 0, width: 200, height: 200) {
                    fill("red")
                    mask("url(#mask1)")
                }
            },
            as: .svgDocument
        ) {
            """
            <svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
              <defs>
                <mask id="mask1">
                  <rect x="0" y="0" width="200" height="200" fill="white"></rect>
                  <circle cx="100" cy="100" r="50" fill="black"></circle>
                </mask>
              </defs>
              <rect x="0" y="0" width="200" height="200" fill="red" mask="url(#mask1)"></rect>
            </svg>
            """
        }
    }

    // MARK: - Complex Examples

    @Test("Complex SVG composition snapshot")
    func complexCompositionSnapshot() {
        assertInlineSnapshot(
            of: Document.test(
                width: 400,
                height: 300,
                viewBox: .init(width: 400, height: 300)
            ) {
                defs {
                    linearGradient(id: "bg-gradient", x1: "0%", y1: "0%", x2: "100%", y2: "100%") {
                        stop(offset: "0%", stopColor: "#667eea")
                        stop(offset: "100%", stopColor: "#764ba2")
                    }

                    clipPath(id: "star-clip") {
                        path(
                            d:
                                "M50,5 L61,35 L95,35 L69,57 L80,91 L50,70 L20,91 L31,57 L5,35 L39,35 Z"
                        )
                    }
                }

                // Background
                rect(x: 0, y: 0, width: 400, height: 300) {
                    fill("url(#bg-gradient)")
                }

                // Clipped group
                g {
                    clipPath("url(#star-clip)")
                    transform(.translate(x: 150, y: 100), .scale(x: 2, y: 2))

                    rect(x: 0, y: 0, width: 100, height: 100) {
                        fill("yellow")
                    }
                }

                // Text overlay
                text("SVG Snapshot Testing", x: 200, y: 250) {
                    fontFamily("Arial")
                    fontSize(24)
                    fill("white")
                    textAnchor("middle")
                }
            },
            as: .svgDocument
        ) {
            """
            <svg viewBox="0 0 400 300" width="400" height="300" xmlns="http://www.w3.org/2000/svg" clip-path="url(#star-clip)" transform="translate(150 100) scale(2 2)">
              <defs>
                <linearGradient id="bg-gradient" x1="0%" y1="0%" x2="100%" y2="100%">
                  <stop offset="0%" stop-color="#667eea"></stop>
                  <stop offset="100%" stop-color="#764ba2"></stop>
                </linearGradient>
                <clipPath id="star-clip">
                  <path d="M50,5 L61,35 L95,35 L69,57 L80,91 L50,70 L20,91 L31,57 L5,35 L39,35 Z"></path>
                </clipPath>
              </defs>
              <rect x="0" y="0" width="400" height="300" fill="url(#bg-gradient)"></rect>
              <g clip-path="url(#star-clip)" transform="translate(150 100) scale(2 2)">
                <rect x="0" y="0" width="100" height="100" fill="yellow"></rect>
              </g>
              <text x="200" y="250" font-family="Arial" font-size="24" fill="white" text-anchor="middle">SVG Snapshot Testing</text>
            </svg>
            """
        }
    }
}
