//
//  DebugDetailedTest.swift
//  swift-svg
//
//  Created by Coen ten Thije Boonkkamp
//

import SVG
import SVG_Standard
import Testing

@Suite("Debug Detailed")
struct DebugDetailedTest {
    @Test func detailedAttributeFlow() {
        // Step 1: Test that attribute creates an _Attributes wrapper
        let fillAttr = fill("red")
        let fillRendered = fillAttr.render()
        // The fill attribute alone renders as empty (it's meant to be combined with elements)
        #expect(fillRendered.isEmpty || fillRendered.contains("fill"))

        // Step 2: Test circle with attributes
        let circleElement = circle(cx: 50, cy: 50, r: 40) {
            fill("blue")
            stroke("black")
        }
        let circleRendered = circleElement.render()
        #expect(circleRendered.contains("<circle"))
        #expect(circleRendered.contains("fill=\"blue\""))
        #expect(circleRendered.contains("stroke=\"black\""))
        #expect(circleRendered.contains("cx=\"50"))
        #expect(circleRendered.contains("cy=\"50"))
        #expect(circleRendered.contains("r=\"40"))

        // Step 3: Full circle with attributes using method chaining
        let chainedCircle = circle(cx: 50, cy: 50, r: 40)
            .fill("green")
            .stroke("red", width: 2)
        let chainedResult = chainedCircle.render()
        #expect(chainedResult.contains("fill=\"green\""))
        #expect(chainedResult.contains("stroke=\"red\""))
        #expect(chainedResult.contains("stroke-width=\"2"))
    }
}
