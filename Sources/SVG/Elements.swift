//
//  Elements.swift
//  swift-svg
//
//  Created by Coen ten Thije Boonkkamp
//

import SVGPrinter
import SVG_Standard

// MARK: - Basic Shapes

/// Creates an SVG circle element.
public func circle(
    cx: Double? = nil,
    cy: Double? = nil,
    r: Double? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Shapes.Circle> {
    Element(W3C_SVG2.Shapes.Circle(cx: cx, cy: cy, r: r), content: content())
}

/// Creates an SVG rectangle element.
public func rect(
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    rx: Double? = nil,
    ry: Double? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Shapes.Rectangle> {
    Element(W3C_SVG2.Shapes.Rectangle(x: x, y: y, width: width, height: height, rx: rx, ry: ry), content: content())
}

/// Creates an SVG ellipse element.
public func ellipse(
    cx: Double? = nil,
    cy: Double? = nil,
    rx: Double? = nil,
    ry: Double? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Shapes.Ellipse> {
    Element(W3C_SVG2.Shapes.Ellipse(cx: cx, cy: cy, rx: rx, ry: ry), content: content())
}

/// Creates an SVG line element.
public func line(
    x1: Double? = nil,
    y1: Double? = nil,
    x2: Double? = nil,
    y2: Double? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Shapes.Line> {
    Element(W3C_SVG2.Shapes.Line(x1: x1, y1: y1, x2: x2, y2: y2), content: content())
}

public func line2(
    x1: Double? = nil,
    y1: Double? = nil,
    x2: Double? = nil,
    y2: Double? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Shapes.Line> {
    Element(W3C_SVG2.Shapes.Line(x1: x1, y1: y1, x2: x2, y2: y2), content: content())
}

/// Creates an SVG polygon element.
public func polygon(
    points: String? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Shapes.Polygon> {
    Element(W3C_SVG2.Shapes.Polygon(points: points), content: content())
}

/// Creates an SVG polygon element from coordinates.
public func polygon(
    coordinates: [(Double, Double)],
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Shapes.Polygon> {
    Element(W3C_SVG2.Shapes.Polygon(coordinates: coordinates), content: content())
}

/// Creates an SVG polyline element.
public func polyline(
    points: String? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Shapes.Polyline> {
    Element(W3C_SVG2.Shapes.Polyline(points: points), content: content())
}

/// Creates an SVG polyline element from coordinates.
public func polyline(
    coordinates: [(Double, Double)],
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Shapes.Polyline> {
    Element(W3C_SVG2.Shapes.Polyline(coordinates: coordinates), content: content())
}

// MARK: - Path

/// Creates an SVG path element.
public func path(
    d: String? = nil,
    fillRule: W3C_SVG2.Painting.FillRule? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Paths.Path> {
    Element(W3C_SVG2.Paths.Path(d: d, fillRule: fillRule), content: content())
}

// MARK: - Text

/// Creates an SVG text element.
public func text(
    _ text: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    dx: Double? = nil,
    dy: Double? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Text.Text> {
    Element(
        W3C_SVG2.Text.Text(
            x: x,
            y: y,
            dx: dx,
            dy: dy,
            content: text
        ),
        content: content()
    )
}

/// Creates an SVG tspan element.
public func tspan(
    _ text: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    dx: Double? = nil,
    dy: Double? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Text.TSpan> {
    Element(
        W3C_SVG2.Text.TSpan(x: x, y: y, dx: dx, dy: dy, content: text),
        content: content()
    )
}

// MARK: - Containers

/// Creates an SVG group element.
public func g(
    id: String? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Document.Group> {
    Element(W3C_SVG2.Document.Group(id: id), content: content())
}

/// Creates an SVG root element.
public func svg(
    x: W3C_SVG2.Types.Length? = nil,
    y: W3C_SVG2.Types.Length? = nil,
    width: W3C_SVG2.Types.Length? = nil,
    height: W3C_SVG2.Types.Length? = nil,
    viewBox: W3C_SVG2.Types.ViewBox? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Document.SVG> {
    Element(
        W3C_SVG2.Document.SVG(
            x: x,
            y: y,
            width: width,
            height: height,
            viewBox: viewBox
        ),
        content: content()
    )
}

/// Creates an SVG root element with simple numeric dimensions.
public func svg(
    width: Double,
    height: Double,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Document.SVG> {
    Element(W3C_SVG2.Document.SVG(width: .number(width), height: .number(height)), content: content())
}

/// Creates an SVG root element with simple string viewBox.
public func svg(
    viewBox: String,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Document.SVG> {
    let components = viewBox.split(separator: " ").compactMap { Double($0) }
    guard components.count == 4 else {
        return Element(W3C_SVG2.Document.SVG(), content: content())
    }
    let vb = W3C_SVG2.Types.ViewBox(
        minX: components[0],
        minY: components[1],
        width: components[2],
        height: components[3]
    )
    return Element(W3C_SVG2.Document.SVG(viewBox: vb), content: content())
}

/// Creates an SVG defs element.
public func defs(
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Document.Defs> {
    Element(W3C_SVG2.Document.Defs(), content: content())
}

/// Creates an SVG symbol element.
public func symbol(
    id: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    viewBox: W3C_SVG2.Types.ViewBox? = nil,
    refX: Double? = nil,
    refY: Double? = nil,
    preserveAspectRatio: String? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Document.Symbol> {
    Element(
        W3C_SVG2.Document.Symbol(
            id: id,
            x: x,
            y: y,
            width: width,
            height: height,
            viewBox: viewBox,
            refX: refX,
            refY: refY,
            preserveAspectRatio: preserveAspectRatio
        ),
        content: content()
    )
}

/// Creates an SVG use element.
public func use(
    href: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Document.Use> {
    Element(W3C_SVG2.Document.Use(href: href, x: x, y: y, width: width, height: height), content: content())
}

// MARK: - Clipping and Masking

/// Creates an SVG clipPath element.
public func clipPath(
    id: String? = nil,
    clipPathUnits: W3C_SVG2.Painting.ClipPath.ClipPathUnits? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Painting.ClipPath> {
    Element(W3C_SVG2.Painting.ClipPath(id: id, clipPathUnits: clipPathUnits), content: content())
}

/// Creates an SVG mask element.
public func mask(
    id: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    maskUnits: W3C_SVG2.Painting.Mask.MaskUnits? = nil,
    maskContentUnits: W3C_SVG2.Painting.Mask.MaskUnits? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Painting.Mask> {
    Element(
        W3C_SVG2.Painting.Mask(
            id: id,
            x: x,
            y: y,
            width: width,
            height: height,
            maskUnits: maskUnits,
            maskContentUnits: maskContentUnits
        ),
        content: content()
    )
}

// MARK: - Gradients and Patterns

/// Creates an SVG linear gradient element.
public func linearGradient(
    id: String? = nil,
    x1: String? = nil,
    y1: String? = nil,
    x2: String? = nil,
    y2: String? = nil,
    href: String? = nil,
    gradientUnits: W3C_SVG2.PaintServers.LinearGradient.GradientUnits? = nil,
    gradientTransform: String? = nil,
    spreadMethod: W3C_SVG2.PaintServers.LinearGradient.SpreadMethod? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.PaintServers.LinearGradient> {
    Element(
        W3C_SVG2.PaintServers.LinearGradient(
            id: id,
            x1: x1,
            y1: y1,
            x2: x2,
            y2: y2,
            href: href,
            gradientUnits: gradientUnits,
            gradientTransform: gradientTransform,
            spreadMethod: spreadMethod
        ),
        content: content()
    )
}

/// Creates an SVG radial gradient element.
public func radialGradient(
    id: String? = nil,
    cx: String? = nil,
    cy: String? = nil,
    r: String? = nil,
    fx: String? = nil,
    fy: String? = nil,
    fr: String? = nil,
    href: String? = nil,
    gradientUnits: W3C_SVG2.PaintServers.RadialGradient.GradientUnits? = nil,
    gradientTransform: String? = nil,
    spreadMethod: W3C_SVG2.PaintServers.RadialGradient.SpreadMethod? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.PaintServers.RadialGradient> {
    Element(
        W3C_SVG2.PaintServers.RadialGradient(
            id: id,
            cx: cx,
            cy: cy,
            r: r,
            fx: fx,
            fy: fy,
            fr: fr,
            href: href,
            gradientUnits: gradientUnits,
            gradientTransform: gradientTransform,
            spreadMethod: spreadMethod
        ),
        content: content()
    )
}

/// Creates an SVG gradient stop element.
public func stop(
    offset: String? = nil,
    stopColor: String? = nil,
    stopOpacity: Double? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.PaintServers.Stop> {
    Element(
        W3C_SVG2.PaintServers.Stop(offset: offset, stopColor: stopColor, stopOpacity: stopOpacity),
        content: content()
    )
}

/// Creates an SVG pattern element.
public func pattern(
    id: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    viewBox: W3C_SVG2.Types.ViewBox? = nil,
    href: String? = nil,
    patternUnits: W3C_SVG2.PaintServers.Pattern.PatternUnits? = nil,
    patternContentUnits: W3C_SVG2.PaintServers.Pattern.PatternUnits? = nil,
    patternTransform: String? = nil,
    preserveAspectRatio: String? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.PaintServers.Pattern> {
    Element(
        W3C_SVG2.PaintServers.Pattern(
            id: id,
            x: x,
            y: y,
            width: width,
            height: height,
            viewBox: viewBox,
            href: href,
            patternUnits: patternUnits,
            patternContentUnits: patternContentUnits,
            patternTransform: patternTransform,
            preserveAspectRatio: preserveAspectRatio
        ),
        content: content()
    )
}

// MARK: - Other Elements

/// Creates an SVG image element.
public func image(
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    href: String? = nil,
    preserveAspectRatio: String? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Embedded.Image> {
    Element(
        W3C_SVG2.Embedded.Image(
            x: x,
            y: y,
            width: width,
            height: height,
            href: href,
            preserveAspectRatio: preserveAspectRatio
        ),
        content: content()
    )
}

/// Creates an SVG marker element.
public func marker(
    id: String? = nil,
    viewBox: W3C_SVG2.Types.ViewBox? = nil,
    refX: Double? = nil,
    refY: Double? = nil,
    markerWidth: Double? = nil,
    markerHeight: Double? = nil,
    orient: String? = nil,
    markerUnits: W3C_SVG2.Painting.Marker.MarkerUnits? = nil,
    preserveAspectRatio: String? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Painting.Marker> {
    Element(
        W3C_SVG2.Painting.Marker(
            id: id,
            viewBox: viewBox,
            refX: refX,
            refY: refY,
            markerWidth: markerWidth,
            markerHeight: markerHeight,
            orient: orient,
            markerUnits: markerUnits,
            preserveAspectRatio: preserveAspectRatio
        ),
        content: content()
    )
}

/// Creates an SVG foreignObject element.
public func foreignObject(
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Embedded.ForeignObject> {
    Element(W3C_SVG2.Embedded.ForeignObject(x: x, y: y, width: width, height: height), content: content())
}

/// Creates an SVG switch element.
public func svgSwitch(
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<W3C_SVG2.Scripting.Switch> {
    Element(W3C_SVG2.Scripting.Switch(), content: content())
}
