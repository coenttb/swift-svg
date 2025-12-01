# swift-svg

[![CI](https://github.com/coenttb/swift-svg/workflows/CI/badge.svg)](https://github.com/coenttb/swift-svg/actions/workflows/ci.yml)
![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

A Swift package providing type-safe SVG generation with SwiftUI-like DSL syntax.

## Overview

swift-svg provides a type-safe, SwiftUI-like DSL for generating SVG graphics in Swift. It combines strongly-typed SVG elements with compile-time validation for vector graphics generation.

```swift
import SVG

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
```

## Features

- Type-safe SVG element definitions
- Compile-time validation of SVG structures
- SwiftUI-like DSL syntax
- Complete SVG element support (shapes, text, gradients, patterns, transforms)
- HTML integration via swift-html
- Lightweight with minimal dependencies

## Installation

Add swift-svg to your Swift package:

```swift
dependencies: [
    .package(url: "https://github.com/coenttb/swift-svg", from: "0.1.0")
]
```

## Quick Start

```swift
import SVG

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
```

## Usage Examples

### Basic Shapes

```swift
import SVG

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
```

### Gradients

```swift
import SVG

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
```

### Text Elements

```swift
import SVG

let textExample = svg(width: 200, height: 100) {
    text("Hello SVG", x: 100, y: 50) {
        fontSize(24)
        fontFamily("system-ui, sans-serif")
        textAnchor("middle")
        fill("black")
    }
}
```

## Testing

swift-svg includes snapshot testing support via SVGTestSupport:

```swift
import Testing
import SVG
import SVG_TestSupport

@Test
func testLogo() {
    let logo = svg(width: 100, height: 100) {
        circle(cx: 50, cy: 50, r: 45) {
            fill("blue")
        }
    }

    assertInlineSnapshot(of: logo, as: .svg) {
        """
        <svg width="100" height="100">
          <circle cx="50" cy="50" r="45" fill="blue"/>
        </svg>
        """
    }
}
```

## Related Packages

### Dependencies

- [swift-svg-printer](https://github.com/coenttb/swift-svg-printer): A Swift package for rendering SVG to String or bytes.
- [swift-svg-standard](https://github.com/swift-standard/swift-svg-standard): A Swift package with foundational types for SVG.

### Used By

- [coenttb-com-server](https://github.com/coenttb/coenttb-com-server): Production server for coenttb.com built with Boiler.
- [swift-html](https://github.com/coenttb/swift-html): The Swift library for domain-accurate and type-safe HTML & CSS.

### Third-Party Dependencies

- [pointfreeco/swift-snapshot-testing](https://github.com/pointfreeco/swift-snapshot-testing): Delightful snapshot testing for Swift.

## Contributing

Contributions are welcome. Please open an issue or submit a pull request.

## License

Apache License 2.0. See [LICENSE](LICENSE) for details.
