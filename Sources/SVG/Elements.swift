//
//  Elements.swift
//  swift-svg
//
//  Created by Coen ten Thije Boonkkamp
//

import SVGTypes
import SVGPrinter

// MARK: - Basic Shapes

/// Creates an SVG circle element.
public func circle(
    cx: Double? = nil,
    cy: Double? = nil,
    r: Double? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<Circle> {
    Element(Circle(cx: cx, cy: cy, r: r), content: content())
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
) -> Element<Rect> {
    Element(Rect(x: x, y: y, width: width, height: height, rx: rx, ry: ry), content: content())
}

/// Creates an SVG ellipse element.
public func ellipse(
    cx: Double? = nil,
    cy: Double? = nil,
    rx: Double? = nil,
    ry: Double? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<Ellipse> {
    Element(Ellipse(cx: cx, cy: cy, rx: rx, ry: ry), content: content())
}

/// Creates an SVG line element.
public func line(
    x1: Double? = nil,
    y1: Double? = nil,
    x2: Double? = nil,
    y2: Double? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<Line> {
    Element(Line(x1: x1, y1: y1, x2: x2, y2: y2), content: content())
}

public func line2(
    x1: Double? = nil,
    y1: Double? = nil,
    x2: Double? = nil,
    y2: Double? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<Line> {
    Element(Line(x1: x1, y1: y1, x2: x2, y2: y2), content: content())
}

/// Creates an SVG polygon element.
public func polygon(
    points: String? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<Polygon> {
    Element(Polygon(points: points), content: content())
}

/// Creates an SVG polygon element from coordinates.
public func polygon(
    coordinates: [(Double, Double)],
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<Polygon> {
    Element(Polygon(coordinates: coordinates), content: content())
}

/// Creates an SVG polyline element.
public func polyline(
    points: String? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<Polyline> {
    Element(Polyline(points: points), content: content())
}

/// Creates an SVG polyline element from coordinates.
public func polyline(
    coordinates: [(Double, Double)],
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<Polyline> {
    Element(Polyline(coordinates: coordinates), content: content())
}

// MARK: - Path

/// Creates an SVG path element.
public func path(
    d: String? = nil,
    fillRule: SVGFillRule? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<Path> {
    Element(Path(d: d, fillRule: fillRule), content: content())
}

// MARK: - Text

/// Creates an SVG text element.
public func text(
    _ text: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    dx: Double? = nil,
    dy: Double? = nil,
    rotate: String? = nil,
    textLength: Double? = nil,
    lengthAdjust: Text.TextLengthAdjust? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<Text> {
    Element(Text(x: x, y: y, dx: dx, dy: dy, rotate: rotate, textLength: textLength, lengthAdjust: lengthAdjust, content: text), content: content())
}

/// Creates an SVG tspan element.
public func tspan(
    _ text: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    dx: Double? = nil,
    dy: Double? = nil,
    rotate: String? = nil,
    textLength: Double? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<TSpan> {
    Element(TSpan(x: x, y: y, dx: dx, dy: dy, rotate: rotate, textLength: textLength, content: text), content: content())
}

// MARK: - Containers

/// Creates an SVG group element.
public func g(
    transform: [SVGTransform]? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<G> {
    Element(G(transform: transform), content: content())
}

/// Creates an SVG group element with a single transform.
public func g(
    transform: SVGTransform,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<G> {
    Element(G(transform: transform), content: content())
}

/// Creates an SVG root element.
public func svg(
    viewBox: SVGViewBox? = nil,
    width: SVGLength? = nil,
    height: SVGLength? = nil,
    preserveAspectRatio: String? = nil,
    xmlns: String? = "http://www.w3.org/2000/svg",
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<SVGElement> {
    Element(SVGElement(viewBox: viewBox, width: width, height: height, preserveAspectRatio: preserveAspectRatio, xmlns: xmlns), content: content())
}

/// Creates an SVG root element with simple numeric dimensions.
public func svg(
    width: Double,
    height: Double,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<SVGElement> {
    Element(SVGElement(width: .number(width), height: .number(height)), content: content())
}

/// Creates an SVG root element with simple string viewBox.
public func svg(
    viewBox: String,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<SVGElement> {
    let components = viewBox.split(separator: " ").compactMap { Double($0) }
    guard components.count == 4 else {
        return Element(SVGElement(), content: content())
    }
    let vb = SVGViewBox(minX: components[0], minY: components[1], width: components[2], height: components[3])
    return Element(SVGElement(viewBox: vb), content: content())
}

/// Creates an SVG defs element.
public func defs(
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<Defs> {
    Element(Defs(), content: content())
}

/// Creates an SVG symbol element.
public func symbol(
    id: String? = nil,
    viewBox: String? = nil,
    preserveAspectRatio: String? = nil,
    refX: Double? = nil,
    refY: Double? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<Symbol> {
    Element(Symbol(id: id, viewBox: viewBox, preserveAspectRatio: preserveAspectRatio, refX: refX, refY: refY), content: content())
}

/// Creates an SVG use element.
public func use(
    href: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<Use> {
    Element(Use(href: href, x: x, y: y, width: width, height: height), content: content())
}

// MARK: - Clipping and Masking

/// Creates an SVG clipPath element.
public func clipPath(
    id: String? = nil,
    clipPathUnits: ClipPath.ClipPathUnits? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<ClipPath> {
    Element(ClipPath(id: id, clipPathUnits: clipPathUnits), content: content())
}

/// Creates an SVG mask element.
public func mask(
    id: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    maskContentUnits: Mask.MaskUnits? = nil,
    maskUnits: Mask.MaskUnits? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<Mask> {
    Element(Mask(id: id, x: x, y: y, width: width, height: height, maskContentUnits: maskContentUnits, maskUnits: maskUnits), content: content())
}

// MARK: - Gradients and Patterns

/// Creates an SVG linear gradient element.
public func linearGradient(
    id: String? = nil,
    x1: String? = nil,
    y1: String? = nil,
    x2: String? = nil,
    y2: String? = nil,
    gradientUnits: LinearGradient.GradientUnits? = nil,
    gradientTransform: String? = nil,
    spreadMethod: LinearGradient.SpreadMethod? = nil,
    href: String? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<LinearGradient> {
    Element(
        LinearGradient(
            id: id,
            x1: x1,
            y1: y1,
            x2: x2,
            y2: y2,
            gradientUnits: gradientUnits,
            gradientTransform: gradientTransform,
            spreadMethod: spreadMethod,
            href: href
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
    gradientUnits: RadialGradient.GradientUnits? = nil,
    gradientTransform: String? = nil,
    spreadMethod: RadialGradient.SpreadMethod? = nil,
    href: String? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<RadialGradient> {
    Element(
        RadialGradient(
            id: id,
            cx: cx,
            cy: cy,
            r: r,
            fx: fx,
            fy: fy,
            fr: fr,
            gradientUnits: gradientUnits,
            gradientTransform: gradientTransform,
            spreadMethod: spreadMethod,
            href: href
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
) -> Element<Stop> {
    Element(Stop(offset: offset, stopColor: stopColor, stopOpacity: stopOpacity), content: content())
}

/// Creates an SVG pattern element.
public func pattern(
    id: String? = nil,
    x: Double? = nil,
    y: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    patternContentUnits: Pattern.PatternUnits? = nil,
    patternUnits: Pattern.PatternUnits? = nil,
    patternTransform: String? = nil,
    viewBox: String? = nil,
    preserveAspectRatio: String? = nil,
    href: String? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<Pattern> {
    Element(
        Pattern(
            id: id,
            x: x,
            y: y,
            width: width,
            height: height,
            patternContentUnits: patternContentUnits,
            patternUnits: patternUnits,
            patternTransform: patternTransform,
            viewBox: viewBox,
            preserveAspectRatio: preserveAspectRatio,
            href: href
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
) -> Element<Image> {
    Element(Image(x: x, y: y, width: width, height: height, href: href, preserveAspectRatio: preserveAspectRatio), content: content())
}

/// Creates an SVG marker element.
public func marker(
    id: String? = nil,
    refX: String? = nil,
    refY: String? = nil,
    markerWidth: Double? = nil,
    markerHeight: Double? = nil,
    markerUnits: Marker.MarkerUnits? = nil,
    orient: String? = nil,
    viewBox: String? = nil,
    preserveAspectRatio: String? = nil,
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<Marker> {
    Element(
        Marker(
            id: id,
            refX: refX,
            refY: refY,
            markerWidth: markerWidth,
            markerHeight: markerHeight,
            markerUnits: markerUnits,
            orient: orient,
            viewBox: viewBox,
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
) -> Element<ForeignObject> {
    Element(ForeignObject(x: x, y: y, width: width, height: height), content: content())
}

/// Creates an SVG switch element.
public func svgSwitch(
    @SVGBuilder content: () -> some SVG = { SVGEmpty() }
) -> Element<Switch> {
    Element(Switch(), content: content())
}
