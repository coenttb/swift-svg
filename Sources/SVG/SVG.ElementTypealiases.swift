//
//  SVG.ElementTypealiases.swift
//  swift-svg
//
//  Lowercase typealiases for SVG elements providing a more SVG-like syntax.
//

import SVG_Rendering
import SVG_Standard

// MARK: - Basic Shapes

/// Lowercase typealias for creating Circle elements.
///
/// Example:
/// ```swift
/// circle(cx: 50, cy: 50, r: 40)
///     .fill("red")
/// ```
public typealias circle = SVG_Standard.Shapes.Circle

/// Lowercase typealias for creating Rectangle elements.
///
/// Example:
/// ```swift
/// rect(x: 10, y: 20, width: 100, height: 50)
///     .fill("blue")
/// ```
public typealias rect = SVG_Standard.Shapes.Rectangle

/// Lowercase typealias for creating Ellipse elements.
///
/// Example:
/// ```swift
/// ellipse(cx: 100, cy: 50, rx: 80, ry: 40)
///     .fill("green")
/// ```
public typealias ellipse = SVG_Standard.Shapes.Ellipse

/// Lowercase typealias for creating Line elements.
///
/// Example:
/// ```swift
/// line(x1: 0, y1: 0, x2: 100, y2: 100)
///     .stroke("black")
/// ```
public typealias line = SVG_Standard.Shapes.Line

/// Lowercase typealias for creating Polygon elements.
///
/// Example:
/// ```swift
/// polygon(points: "100,10 40,198 190,78 10,78 160,198")
///     .fill("lime")
/// ```
public typealias polygon = SVG_Standard.Shapes.Polygon

/// Lowercase typealias for creating Polyline elements.
///
/// Example:
/// ```swift
/// polyline(points: "20,20 40,25 60,40 80,120")
///     .stroke("black")
/// ```
public typealias polyline = SVG_Standard.Shapes.Polyline

// MARK: - Paths

/// Lowercase typealias for creating Path elements.
///
/// Example:
/// ```swift
/// path(d: "M 10 10 H 90 V 90 H 10 Z")
///     .fill("none")
///     .stroke("black")
/// ```
public typealias path = SVG_Standard.Paths.Path

// MARK: - Document Structure

/// Lowercase typealias for creating SVG root elements.
///
/// Example:
/// ```swift
/// svg(width: 100, height: 100) {
///     circle(cx: 50, cy: 50, r: 40)
/// }
/// ```
public typealias svg = SVG_Standard.Document.SVG

/// Lowercase typealias for creating Group elements.
///
/// Example:
/// ```swift
/// g(id: "shapes") {
///     circle(cx: 50, r: 25)
///     rect(x: 10, y: 10, width: 30, height: 30)
/// }
/// ```
public typealias g = SVG_Standard.Document.Group

/// Lowercase typealias for creating Defs elements.
///
/// Example:
/// ```swift
/// defs {
///     linearGradient(id: "grad1") {
///         stop(offset: "0%", stopColor: "red")
///         stop(offset: "100%", stopColor: "blue")
///     }
/// }
/// ```
public typealias defs = SVG_Standard.Document.Defs

/// Lowercase typealias for creating Symbol elements.
///
/// Example:
/// ```swift
/// symbol(id: "icon", viewBox: .init(minX: 0, minY: 0, width: 100, height: 100)) {
///     circle(cx: 50, cy: 50, r: 40)
/// }
/// ```
public typealias symbol = SVG_Standard.Document.Symbol

/// Lowercase typealias for creating Use elements.
///
/// Example:
/// ```swift
/// use(href: "#icon", x: 10, y: 10)
/// ```
public typealias use = SVG_Standard.Document.Use

// MARK: - Text

/// Lowercase typealias for creating Text elements.
///
/// Example:
/// ```swift
/// text("Hello, SVG!", x: 10, y: 50)
///     .fontSize(24)
/// ```
public typealias text = SVG_Standard.Text.Text

/// Lowercase typealias for creating TSpan elements.
///
/// Example:
/// ```swift
/// text(x: 10, y: 50) {
///     tspan("Hello")
///     tspan("World", dx: 10)
/// }
/// ```
public typealias tspan = SVG_Standard.Text.TSpan

// MARK: - Gradients & Patterns

/// Lowercase typealias for creating LinearGradient elements.
///
/// Example:
/// ```swift
/// linearGradient(id: "grad1", x1: "0%", y1: "0%", x2: "100%", y2: "0%") {
///     stop(offset: "0%", stopColor: "red")
///     stop(offset: "100%", stopColor: "blue")
/// }
/// ```
public typealias linearGradient = SVG_Standard.PaintServers.LinearGradient

/// Lowercase typealias for creating RadialGradient elements.
///
/// Example:
/// ```swift
/// radialGradient(id: "grad2", cx: "50%", cy: "50%", r: "50%") {
///     stop(offset: "0%", stopColor: "white")
///     stop(offset: "100%", stopColor: "black")
/// }
/// ```
public typealias radialGradient = SVG_Standard.PaintServers.RadialGradient

/// Lowercase typealias for creating Stop elements.
///
/// Example:
/// ```swift
/// stop(offset: "50%", stopColor: "green", stopOpacity: 0.5)
/// ```
public typealias stop = SVG_Standard.PaintServers.Stop

/// Lowercase typealias for creating Pattern elements.
///
/// Example:
/// ```swift
/// pattern(id: "dots", width: 10, height: 10) {
///     circle(cx: 5, cy: 5, r: 2)
/// }
/// ```
public typealias pattern = SVG_Standard.PaintServers.Pattern

// MARK: - Painting

/// Lowercase typealias for creating ClipPath elements.
///
/// Example:
/// ```swift
/// clipPath(id: "clip") {
///     circle(cx: 50, cy: 50, r: 40)
/// }
/// ```
public typealias clipPath = SVG_Standard.Painting.ClipPath

/// Lowercase typealias for creating Mask elements.
///
/// Example:
/// ```swift
/// mask(id: "mask1") {
///     rect(x: 0, y: 0, width: 100, height: 100)
///         .fill("white")
/// }
/// ```
public typealias mask = SVG_Standard.Painting.Mask

/// Lowercase typealias for creating Marker elements.
///
/// Example:
/// ```swift
/// marker(id: "arrow", refX: 5, refY: 5, markerWidth: 10, markerHeight: 10) {
///     path(d: "M 0 0 L 10 5 L 0 10 z")
/// }
/// ```
public typealias marker = SVG_Standard.Painting.Marker

// MARK: - Embedded Content

/// Lowercase typealias for creating Image elements.
///
/// Example:
/// ```swift
/// image(href: "photo.jpg", x: 0, y: 0, width: 100, height: 100)
/// ```
public typealias image = SVG_Standard.Embedded.Image

/// Lowercase typealias for creating ForeignObject elements.
///
/// Example:
/// ```swift
/// foreignObject(x: 10, y: 10, width: 200, height: 100) {
///     // HTML content
/// }
/// ```
public typealias foreignObject = SVG_Standard.Embedded.ForeignObject

// MARK: - Scripting

/// Lowercase typealias for creating Switch elements.
public typealias `switch` = SVG_Standard.Scripting.Switch
