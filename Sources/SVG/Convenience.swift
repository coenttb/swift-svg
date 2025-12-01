//
//  Convenience.swift
//  swift-svg
//
//  Convenience functions for creating SVG elements
//

import SVG_Rendering
import SVG_Standard

// MARK: - Basic Shapes

/// Creates a circle element.
public func circle<Content: SVG.View>(
    cx: Double? = nil,
    cy: Double? = nil,
    r: Double? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    SVG_Standard.Shapes.Circle(cx: cx, cy: cy, r: r)(content)
}

/// Creates a rectangle element.
public func rect<Content: SVG.View>(
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    rx: Double? = nil,
    ry: Double? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    SVG_Standard.Shapes.Rectangle(x: x, y: y, width: width, height: height, rx: rx, ry: ry)(content)
}

/// Creates an ellipse element.
public func ellipse<Content: SVG.View>(
    cx: Double? = nil,
    cy: Double? = nil,
    rx: Double? = nil,
    ry: Double? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    SVG_Standard.Shapes.Ellipse(cx: cx, cy: cy, rx: rx, ry: ry)(content)
}

/// Creates a line element.
public func line<Content: SVG.View>(
    x1: Double? = nil,
    y1: Double? = nil,
    x2: Double? = nil,
    y2: Double? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    SVG_Standard.Shapes.Line(x1: x1, y1: y1, x2: x2, y2: y2)(content)
}

/// Creates a polygon element.
public func polygon<Content: SVG.View>(
    points: String? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    SVG_Standard.Shapes.Polygon(points: points)(content)
}

/// Creates a polygon element from coordinate tuples.
public func polygon<Content: SVG.View>(
    coordinates: [(Double, Double)],
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    let pointsString = coordinates.map { "\($0.0.formatted(.number)),\($0.1.formatted(.number))" }.joined(separator: " ")
    return SVG_Standard.Shapes.Polygon(points: pointsString)(content)
}

/// Creates a polyline element.
public func polyline<Content: SVG.View>(
    points: String? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    SVG_Standard.Shapes.Polyline(points: points)(content)
}

// MARK: - Paths

/// Creates a path element.
public func path<Content: SVG.View>(
    d: String? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    SVG_Standard.Paths.Path(d: d)(content)
}

// MARK: - Document Structure

/// Creates an SVG root element.
public func svg<Content: SVG.View>(
    width: Double? = nil,
    height: Double? = nil,
    viewBox: SVG_Standard.Types.ViewBox? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    SVG_Standard.Document.SVG(
        width: width.map { .number($0) },
        height: height.map { .number($0) },
        viewBox: viewBox
    )(content)
}

/// Creates a group element.
public func g<Content: SVG.View>(
    id: String? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    SVG_Standard.Document.Group(id: id)(content)
}

/// Creates a defs element.
public func defs<Content: SVG.View>(
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    SVG_Standard.Document.Defs()(content)
}

/// Creates a symbol element.
public func symbol<Content: SVG.View>(
    id: String? = nil,
    viewBox: SVG_Standard.Types.ViewBox? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    SVG_Standard.Document.Symbol(id: id, viewBox: viewBox)(content)
}

/// Creates a use element.
public func use(
    href: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil
) -> some SVG.View {
    SVG_Standard.Document.Use(href: href, x: x, y: y, width: width, height: height)()
}

// MARK: - Text

/// Creates a text element.
public func text<Content: SVG.View>(
    _ content: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    dx: Double? = nil,
    dy: Double? = nil,
    @SVG.Builder children: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    SVG_Standard.Text.Text(x: x, y: y, dx: dx, dy: dy, content: content)(children)
}

/// Creates a tspan element.
public func tspan<Content: SVG.View>(
    _ content: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    dx: Double? = nil,
    dy: Double? = nil,
    @SVG.Builder children: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    SVG_Standard.Text.TSpan(x: x, y: y, dx: dx, dy: dy, content: content)(children)
}

// MARK: - Gradients

/// Creates a linear gradient element.
public func linearGradient<Content: SVG.View>(
    id: String? = nil,
    x1: String? = nil,
    y1: String? = nil,
    x2: String? = nil,
    y2: String? = nil,
    gradientUnits: SVG_Standard.PaintServers.LinearGradient.GradientUnits? = nil,
    gradientTransform: String? = nil,
    spreadMethod: SVG_Standard.PaintServers.LinearGradient.SpreadMethod? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    SVG_Standard.PaintServers.LinearGradient(
        id: id,
        x1: x1,
        y1: y1,
        x2: x2,
        y2: y2,
        gradientUnits: gradientUnits,
        gradientTransform: gradientTransform,
        spreadMethod: spreadMethod
    )(content)
}

/// Creates a radial gradient element.
public func radialGradient<Content: SVG.View>(
    id: String? = nil,
    cx: String? = nil,
    cy: String? = nil,
    r: String? = nil,
    fx: String? = nil,
    fy: String? = nil,
    gradientUnits: SVG_Standard.PaintServers.RadialGradient.GradientUnits? = nil,
    gradientTransform: String? = nil,
    spreadMethod: SVG_Standard.PaintServers.RadialGradient.SpreadMethod? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    SVG_Standard.PaintServers.RadialGradient(
        id: id,
        cx: cx,
        cy: cy,
        r: r,
        fx: fx,
        fy: fy,
        gradientUnits: gradientUnits,
        gradientTransform: gradientTransform,
        spreadMethod: spreadMethod
    )(content)
}

/// Creates a gradient stop element.
public func stop(
    offset: String? = nil,
    stopColor: String? = nil,
    stopOpacity: Double? = nil
) -> some SVG.View {
    SVG_Standard.PaintServers.Stop(offset: offset, stopColor: stopColor, stopOpacity: stopOpacity)()
}

// MARK: - Painting

/// Creates a clipPath element.
public func clipPath<Content: SVG.View>(
    id: String? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    SVG_Standard.Painting.ClipPath(id: id)(content)
}

/// Creates a mask element.
public func mask<Content: SVG.View>(
    id: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    SVG_Standard.Painting.Mask(id: id, x: x, y: y, width: width, height: height)(content)
}

/// Creates a marker element.
public func marker<Content: SVG.View>(
    id: String? = nil,
    viewBox: SVG_Standard.Types.ViewBox? = nil,
    refX: Double? = nil,
    refY: Double? = nil,
    markerWidth: Double? = nil,
    markerHeight: Double? = nil,
    orient: String? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    SVG_Standard.Painting.Marker(
        id: id,
        viewBox: viewBox,
        refX: refX,
        refY: refY,
        markerWidth: markerWidth,
        markerHeight: markerHeight,
        orient: orient
    )(content)
}

// MARK: - Embedded Content

/// Creates an image element.
public func image(
    href: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    preserveAspectRatio: String? = nil
) -> some SVG.View {
    SVG_Standard.Embedded.Image(
        x: x,
        y: y,
        width: width,
        height: height,
        href: href,
        preserveAspectRatio: preserveAspectRatio
    )()
}

/// Creates a foreignObject element.
public func foreignObject<Content: SVG.View>(
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    SVG_Standard.Embedded.ForeignObject(x: x, y: y, width: width, height: height)(content)
}

// MARK: - Linking

/// Creates an anchor element.
public func a<Content: SVG.View>(
    href: String? = nil,
    target: String? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> some SVG.View {
    SVG_Standard.Linking.Anchor(href: href, target: target)(content)
}
