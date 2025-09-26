# swift-svg

<p align="center">
  <img src="https://img.shields.io/badge/Swift-6.0-orange.svg" alt="Swift 6.0">
  <img src="https://img.shields.io/badge/Platforms-macOS%20|%20iOS%20|%20tvOS%20|%20watchOS%20|%20Linux-lightgray.svg" alt="Platforms">
  <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" alt="License">
  <img src="https://img.shields.io/badge/Release-0.1.0-green.svg" alt="Release">
</p>

<p align="center">
  <strong>Type-safe SVG generation in Swift</strong><br>
  Build scalable vector graphics with the full power of Swift's type system
</p>

## Overview

**swift-svg** provides a type-safe, SwiftUI-like DSL for generating SVG graphics in Swift. It combines strongly-typed SVG elements, compile-time validation, and an efficient rendering engine to help you create vector graphics with confidence.

```swift
import SVG

// Type-safe SVG with SwiftUI-like syntax
let logo = SVG(width: 200, height: 200) {
    // Gradient definition
    Defs {
        LinearGradient(id: "gradient", x1: "0%", y1: "0%", x2: "100%", y2: "100%") {
            Stop(offset: "0%", stopColor: "#FF6B6B")
            Stop(offset: "100%", stopColor: "#4ECDC4")
        }
    }

    // Shapes with type-safe attributes
    Circle(cx: 100, cy: 100, r: 80)
        .fill("url(#gradient)")
        .stroke("#333")
        .strokeWidth(2)

    Text("Swift", x: 100, y: 105)
        .fontSize(24)
        .fontFamily("system-ui, sans-serif")
        .textAnchor(.middle)
        .fill("white")
}

// Render to string
let svgString = String(svg: logo)
```

## Why swift-svg?

### 🛡️ Type Safety First
- **Compile-time validation**: Catch SVG errors before runtime
- **Impossible invalid states**: Can't put invalid attributes on elements
- **IDE support**: Full autocomplete, inline documentation, and refactoring

### 🎨 Complete SVG Support
- **All standard shapes**: Circle, Rect, Path, Polygon, and more
- **Text and typography**: Full text rendering with styling
- **Gradients and patterns**: LinearGradient, RadialGradient, Pattern
- **Groups and transforms**: G, Defs, Symbol, Use with transformations
- **Filters and effects**: Coming soon

### ⚡ Performance
- **Zero runtime overhead**: All validation happens at compile time
- **Efficient rendering**: Direct byte-level rendering for server applications
- **Minimal dependencies**: Lightweight and focused

### 🧩 Composable Architecture
- **SwiftUI-like syntax**: Familiar patterns for Swift developers
- **Reusable components**: Build once, use everywhere
- **HTML integration**: Seamless embedding in HTML documents

## Quick Start

### Installation

Add swift-svg to your Swift package:

```swift
dependencies: [
    .package(url: "https://github.com/coenttb/swift-svg", from: "0.1.0")
]
```

For Xcode projects, add the package URL: `https://github.com/coenttb/swift-svg`

### Your First SVG

```swift
import SVG

let icon = SVG(width: 24, height: 24, viewBox: "0 0 24 24") {
    Path(d: "M12 2L2 7l10 5 10-5-10-5z")
        .fill("currentColor")
    Path(d: "M2 17l10 5 10-5-10-5z")
        .fill("currentColor")
        .opacity(0.7)
}

// Render it
let svgString = String(svg: icon)
```

### Complex Graphics

```swift
import SVG

struct ChartIcon: SVGDocument {
    let data: [CGFloat] = [20, 45, 30, 60, 35]

    var body: some SVG {
        SVG(width: 100, height: 60) {
            // Background grid
            for i in 0..<5 {
                Line(x1: CGFloat(i * 20), y1: 0, x2: CGFloat(i * 20), y2: 60)
                    .stroke("#e0e0e0")
                    .strokeWidth(0.5)
            }

            // Data bars
            for (index, value) in data.enumerated() {
                Rect(
                    x: CGFloat(index * 20 + 2),
                    y: 60 - value,
                    width: 16,
                    height: value
                )
                .fill("#4ECDC4")
                .rx(2)
            }
        }
    }
}

let chart = ChartIcon()
let rendered = String(svg: chart)
```

## Core Concepts

### 🏗️ SVG Elements

Every SVG element is a strongly-typed Swift type:

```swift
// Basic shapes
Circle(cx: 50, cy: 50, r: 40)
Rect(x: 10, y: 10, width: 80, height: 60)
Line(x1: 0, y1: 0, x2: 100, y2: 100)
Polygon(points: "0,0 100,0 50,100")

// Text elements
Text("Hello", x: 50, y: 50)
    .fontSize(16)
    .fontWeight(.bold)
    .textAnchor(.middle)

// Paths for complex shapes
Path(d: "M10 10 Q 50 50, 90 10")
    .fill("none")
    .stroke("black")
```

### 🎨 Styling

Apply styles with type-safe modifiers:

```swift
Circle(cx: 50, cy: 50, r: 40)
    .fill(.blue)
    .stroke(.black)
    .strokeWidth(2)
    .opacity(0.8)
    .transform("rotate(45 50 50)")
```

### 🔄 Gradients and Patterns

```swift
Defs {
    LinearGradient(id: "myGradient") {
        Stop(offset: "0%", stopColor: "red")
        Stop(offset: "100%", stopColor: "blue")
    }

    Pattern(id: "myPattern", width: 10, height: 10) {
        Circle(cx: 5, cy: 5, r: 2).fill("black")
    }
}

Circle(cx: 50, cy: 50, r: 40)
    .fill("url(#myGradient)")
```

### 🧩 Components

Build reusable SVG components:

```swift
struct Icon: SVG {
    let name: String
    let size: CGFloat

    var body: some SVG {
        SVG(width: size, height: size) {
            switch name {
            case "check":
                Path(d: "M20 6L9 17l-5-5")
                    .stroke("green")
                    .strokeWidth(2)
                    .fill("none")
            case "close":
                Path(d: "M6 6L18 18M18 6L6 18")
                    .stroke("red")
                    .strokeWidth(2)
            default:
                EmptyView()
            }
        }
    }
}
```

## HTML Integration

Seamlessly integrate with [swift-html](https://github.com/coenttb/swift-html):

```swift
import HTML
import SVG

struct IconButton: HTML {
    var body: some HTML {
        button {
            SVG(width: 16, height: 16) {
                Path(d: "M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6")
                    .stroke("currentColor")
                    .strokeWidth(2)
                    .fill("none")
            }
            span { "Home" }
        }
    }
}
```

## Testing

swift-svg includes snapshot testing support:

```swift
import SVGTestSupport

@Test
func testLogo() {
    let logo = SVG(width: 100, height: 100) {
        Circle(cx: 50, cy: 50, r: 45)
            .fill("blue")
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

## Real-World Usage

swift-svg powers production applications:

- **[coenttb.com](https://coenttb.com)**: Dynamic SVG icons and graphics
- **[coenttb-com-server](https://github.com/coenttb/coenttb-com-server)**: Server-side SVG generation

Using `swift-svg` in your project? Open an issue or submit a PR to add your project to this list!

## Related Projects

swift-svg is part of a comprehensive Swift web development ecosystem:

### Core Libraries
- [swift-svg-types](https://github.com/coenttb/swift-svg-types): Type-safe SVG element definitions
- [swift-svg-printer](https://github.com/coenttb/swift-svg-printer): SVG rendering engine
- [swift-html](https://github.com/coenttb/swift-html): Type-safe HTML & CSS DSL

### Server Integration
- [coenttb-server](https://github.com/coenttb/coenttb-server): Modern Swift server framework
- [swift-web](https://github.com/coenttb/swift-web): Modular web development tools

## Documentation

Comprehensive documentation is available at the [Swift Package Index](https://swiftpackageindex.com/coenttb/swift-svg/main/documentation/svg).

## Contributing

Contributions are welcome! Please feel free to:

- Open issues for bugs or feature requests
- Submit pull requests
- Improve documentation
- Share your projects built with swift-svg

## Feedback & Support

- **Issues**: [GitHub Issues](https://github.com/coenttb/swift-svg/issues)
- **Newsletter**: [Subscribe](http://coenttb.com/en/newsletter/subscribe)
- **Social**: [Follow @coenttb](http://x.com/coenttb)
- **Professional**: [LinkedIn](https://www.linkedin.com/in/tenthijeboonkkamp)

## License

This project is licensed under the Apache 2.0 License. See [LICENSE](LICENSE) for details.