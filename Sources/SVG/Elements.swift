//
//  Elements.swift
//  swift-svg
//
//  Created by Coen ten Thije Boonkkamp
//

import SVG_Renderable
import SVG_Standard

// MARK: - Basic Shapes

/// Creates an SVG circle element.
public func circle<Content: SVG.View>(
    cx: Double? = nil,
    cy: Double? = nil,
    r: Double? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Shapes.Circle, Content> {
    SVG.Element(
        SVG_Standard.Shapes.Circle(
            cx: cx,
            cy: cy,
            r: r
        ),
        content: content
    )
}

/// Creates an SVG rectangle element.
public func rect<Content: SVG.View>(
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    rx: Double? = nil,
    ry: Double? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Shapes.Rectangle, Content> {
    SVG.Element(
        SVG_Standard.Shapes.Rectangle(
            x: x,
            y: y,
            width: width,
            height: height,
            rx: rx,
            ry: ry
        ),
        content: content
    )
}

/// Creates an SVG ellipse element.
public func ellipse<Content: SVG.View>(
    cx: Double? = nil,
    cy: Double? = nil,
    rx: Double? = nil,
    ry: Double? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Shapes.Ellipse, Content> {
    SVG.Element(
        SVG_Standard.Shapes.Ellipse(
            cx: cx,
            cy: cy,
            rx: rx,
            ry: ry
        ),
        content: content
    )
}

/// Creates an SVG line element.
public func line<Content: SVG.View>(
    x1: Double? = nil,
    y1: Double? = nil,
    x2: Double? = nil,
    y2: Double? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Shapes.Line, Content> {
    SVG.Element(
        SVG_Standard.Shapes.Line(
            x1: x1,
            y1: y1,
            x2: x2,
            y2: y2
        ),
        content: content
    )
}

/// Creates an SVG polygon element.
public func polygon<Content: SVG.View>(
    points: String? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Shapes.Polygon, Content> {
    SVG.Element(
        SVG_Standard.Shapes.Polygon(points: points),
        content: content
    )
}

/// Creates an SVG polygon element from coordinates.
public func polygon<Content: SVG.View>(
    coordinates: [(Double, Double)],
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Shapes.Polygon, Content> {
    SVG.Element(
        SVG_Standard.Shapes.Polygon(coordinates: coordinates),
        content: content
    )
}

/// Creates an SVG polyline element.
public func polyline<Content: SVG.View>(
    points: String? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Shapes.Polyline, Content> {
    SVG.Element(
        SVG_Standard.Shapes.Polyline(points: points),
        content: content
    )
}

/// Creates an SVG polyline element from coordinates.
public func polyline<Content: SVG.View>(
    coordinates: [(Double, Double)],
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Shapes.Polyline, Content> {
    SVG.Element(
        SVG_Standard.Shapes.Polyline(coordinates: coordinates),
        content: content
    )
}

// MARK: - Path

/// Creates an SVG path element.
public func path<Content: SVG.View>(
    d: String? = nil,
    fillRule: SVG_Standard.Painting.FillRule? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Paths.Path, Content> {
    SVG.Element(
        SVG_Standard.Paths.Path(
            d: d,
            fillRule: fillRule
        ),
        content: content
    )
}

// MARK: - Text

/// Creates an SVG text element.
public func text<Content: SVG.View>(
    _ text: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    dx: Double? = nil,
    dy: Double? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Text.Text, Content> {
    SVG.Element(
        SVG_Standard.Text.Text(
            x: x,
            y: y,
            dx: dx,
            dy: dy,
            content: text
        ),
        content: content
    )
}

/// Creates an SVG tspan element.
public func tspan<Content: SVG.View>(
    _ text: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    dx: Double? = nil,
    dy: Double? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Text.TSpan, Content> {
    SVG.Element(
        SVG_Standard.Text.TSpan(
            x: x,
            y: y,
            dx: dx,
            dy: dy,
            content: text
        ),
        content: content
    )
}

// MARK: - Containers

/// Creates an SVG group element.
public func g<Content: SVG.View>(
    id: String? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Document.Group, Content> {
    SVG.Element(
        SVG_Standard.Document.Group(id: id),
        content: content
    )
}

/// Creates an SVG root element.
public func svg<Content: SVG.View>(
    x: SVG_Standard.Types.Length? = nil,
    y: SVG_Standard.Types.Length? = nil,
    width: SVG_Standard.Types.Length? = nil,
    height: SVG_Standard.Types.Length? = nil,
    viewBox: SVG_Standard.Types.ViewBox? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Document.SVG, Content> {
    SVG.Element(
        SVG_Standard.Document.SVG(
            x: x,
            y: y,
            width: width,
            height: height,
            viewBox: viewBox
        ),
        content: content
    )
}

/// Creates an SVG root element with simple numeric dimensions.
public func svg<Content: SVG.View>(
    width: Double,
    height: Double,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Document.SVG, Content> {
    SVG.Element(
        SVG_Standard.Document.SVG(
            width: .number(width),
            height: .number(height)
        ),
        content: content
    )
}

/// Creates an SVG root element with simple string viewBox.
public func svg<Content: SVG.View>(
    viewBox: String,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Document.SVG, Content> {
    let components = viewBox.split(separator: " ").compactMap { Double($0) }
    guard components.count == 4 else {
        return SVG.Element(
            SVG_Standard.Document.SVG(),
            content: content
        )
    }
    let vb = SVG_Standard.Types.ViewBox(
        minX: components[0],
        minY: components[1],
        width: components[2],
        height: components[3]
    )
    return SVG.Element(
        SVG_Standard.Document.SVG(viewBox: vb),
        content: content
    )
}

/// Creates an SVG defs element.
public func defs<Content: SVG.View>(
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Document.Defs, Content> {
    SVG.Element(
        SVG_Standard.Document.Defs(),
        content: content
    )
}

/// Creates an SVG symbol element.
public func symbol<Content: SVG.View>(
    id: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    viewBox: SVG_Standard.Types.ViewBox? = nil,
    refX: Double? = nil,
    refY: Double? = nil,
    preserveAspectRatio: String? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Document.Symbol, Content> {
    SVG.Element(
        SVG_Standard.Document.Symbol(
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
        content: content
    )
}

/// Creates an SVG use element.
public func use<Content: SVG.View>(
    href: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Document.Use, Content> {
    SVG.Element(
        SVG_Standard.Document.Use(
            href: href,
            x: x,
            y: y,
            width: width,
            height: height
        ),
        content: content
    )
}

// MARK: - Clipping and Masking

/// Creates an SVG clipPath element.
public func clipPath<Content: SVG.View>(
    id: String? = nil,
    clipPathUnits: SVG_Standard.Painting.ClipPath.ClipPathUnits? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Painting.ClipPath, Content> {
    SVG.Element(
        SVG_Standard.Painting.ClipPath(
            id: id,
            clipPathUnits: clipPathUnits
        ),
        content: content
    )
}

/// Creates an SVG mask element.
public func mask<Content: SVG.View>(
    id: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    maskUnits: SVG_Standard.Painting.Mask.MaskUnits? = nil,
    maskContentUnits: SVG_Standard.Painting.Mask.MaskUnits? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Painting.Mask, Content> {
    SVG.Element(
        SVG_Standard.Painting.Mask(
            id: id,
            x: x,
            y: y,
            width: width,
            height: height,
            maskUnits: maskUnits,
            maskContentUnits: maskContentUnits
        ),
        content: content
    )
}

// MARK: - Gradients and Patterns

/// Creates an SVG linear gradient element.
public func linearGradient<Content: SVG.View>(
    id: String? = nil,
    x1: String? = nil,
    y1: String? = nil,
    x2: String? = nil,
    y2: String? = nil,
    href: String? = nil,
    gradientUnits: SVG_Standard.PaintServers.LinearGradient.GradientUnits? = nil,
    gradientTransform: String? = nil,
    spreadMethod: SVG_Standard.PaintServers.LinearGradient.SpreadMethod? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.PaintServers.LinearGradient, Content> {
    SVG.Element(
        SVG_Standard.PaintServers.LinearGradient(
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
        content: content
    )
}

/// Creates an SVG radial gradient element.
public func radialGradient<Content: SVG.View>(
    id: String? = nil,
    cx: String? = nil,
    cy: String? = nil,
    r: String? = nil,
    fx: String? = nil,
    fy: String? = nil,
    fr: String? = nil,
    href: String? = nil,
    gradientUnits: SVG_Standard.PaintServers.RadialGradient.GradientUnits? = nil,
    gradientTransform: String? = nil,
    spreadMethod: SVG_Standard.PaintServers.RadialGradient.SpreadMethod? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.PaintServers.RadialGradient, Content> {
    SVG.Element(
        SVG_Standard.PaintServers.RadialGradient(
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
        content: content
    )
}

/// Creates an SVG gradient stop element.
public func stop<Content: SVG.View>(
    offset: String? = nil,
    stopColor: String? = nil,
    stopOpacity: Double? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.PaintServers.Stop, Content> {
    SVG.Element(
        SVG_Standard.PaintServers.Stop(
            offset: offset,
            stopColor: stopColor,
            stopOpacity: stopOpacity
        ),
        content: content
    )
}

/// Creates an SVG pattern element.
public func pattern<Content: SVG.View>(
    id: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    viewBox: SVG_Standard.Types.ViewBox? = nil,
    href: String? = nil,
    patternUnits: SVG_Standard.PaintServers.Pattern.PatternUnits? = nil,
    patternContentUnits: SVG_Standard.PaintServers.Pattern.PatternUnits? = nil,
    patternTransform: String? = nil,
    preserveAspectRatio: String? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.PaintServers.Pattern, Content> {
    SVG.Element(
        SVG_Standard.PaintServers.Pattern(
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
        content: content
    )
}

// MARK: - Other Elements

/// Creates an SVG image element.
public func image<Content: SVG.View>(
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    href: String? = nil,
    preserveAspectRatio: String? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Embedded.Image, Content> {
    SVG.Element(
        SVG_Standard.Embedded.Image(
            x: x,
            y: y,
            width: width,
            height: height,
            href: href,
            preserveAspectRatio: preserveAspectRatio
        ),
        content: content
    )
}

/// Creates an SVG marker element.
public func marker<Content: SVG.View>(
    id: String? = nil,
    viewBox: SVG_Standard.Types.ViewBox? = nil,
    refX: Double? = nil,
    refY: Double? = nil,
    markerWidth: Double? = nil,
    markerHeight: Double? = nil,
    orient: String? = nil,
    markerUnits: SVG_Standard.Painting.Marker.MarkerUnits? = nil,
    preserveAspectRatio: String? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Painting.Marker, Content> {
    SVG.Element(
        SVG_Standard.Painting.Marker(
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
        content: content
    )
}

/// Creates an SVG foreignObject element.
public func foreignObject<Content: SVG.View>(
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Embedded.ForeignObject, Content> {
    SVG.Element(
        SVG_Standard.Embedded.ForeignObject(
            x: x,
            y: y,
            width: width,
            height: height
        ),
        content: content
    )
}

/// Creates an SVG switch element.
public func svgSwitch<Content: SVG.View>(
    @SVG.Builder content: () -> Content = { SVG.Empty() }
) -> SVG.Element<SVG_Standard.Scripting.Switch, Content> {
    SVG.Element(
        SVG_Standard.Scripting.Switch(),
        content: content
    )
}
