//
//  TrailSwiftUIView.swift
//  TiGuia
//
//  Created by Nádia Bordoni on 16/11/20.
//

import SwiftUI

let p1 = CGPoint(x:50, y:50)
let p2 = CGPoint(x: 100, y: 25)
let p3 = CGPoint(x: 100, y: 100)

struct TrailSwiftUIView: View {
    @State var toggle = true
    var body: some View {
        VStack {
            Button("Toggle") {
                withAnimation { self.toggle.toggle() }
            }
            Path { p in
                p.move(to: toggle ? p1: p2)
                p.addLine(to: p3)
            } .stroke(lineWidth: 3)
        }
    }
    
}
struct Line: Shape {
    var start, end: CGPoint
    
    func path(in rect: CGRect) -> Path {
        Path { p in
            p.move(to: start)
            p.addLine(to: end)
        }
    }
}
extension Line {
    var animatbleData: AnimatablePair<CGPoint.AnimatableData, CGPoint.AnimatableData> {
        get { AnimatablePair(start.animatableData, end.animatableData) }
        set { (start.animatableData, end.animatableData) = (newValue.first, newValue.second)}
    }
}

struct TrailSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TrailSwiftUIView()
    }
}
