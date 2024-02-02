//
//  ContentView.swift
//  CanadaMaple
//
//  Created by Don Jose on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            let portrait = geometry.size.width < geometry.size.height
            
            Group {
                Maple()
                    .stroke(Color.CANRedEnsign, lineWidth: 1)
                Maple()
                    .stroke(Color.CANRedEnsign, lineWidth: 1)
                    .rotation3DEffect(.degrees(180), axis: (0, 1, 0))
            }
            .aspectRatio(portrait ? 1/2 : 2/1, contentMode: .fit)
            .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
        }
    }
}

#Preview {
    ContentView()
}

extension Color {
    static let CANRedEnsign = Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1))
}

struct Maple: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let landscape = rect.size.width > rect.size.height
            let width = rect.size.width / (landscape ? 1920: 960)
            let height = rect.size.height / (landscape ? 960 : 1920)
            
            func position(_ xy: Double...) -> CGPoint {
                CGPoint(x: rect.midX + xy[0] * width,
                        y: rect.midY + xy[1] * height)
            }
            
            func addLine(_ xy: Double...) {
                path.addLine(to: position(xy[0],xy[1]))
            }
            
            path.move(to: position(0,406)) // Arc A
            addLine(-18,406)
            addLine(-8.955,233.418)
            path.addRelativeArc(center: position(-27.929,232.423),
                                radius: 19 * width,
                                startAngle: .degrees(3),
                                delta: .degrees(-103))
            
            //            path.move(to: position(-31.229,213.712)) Arc B
            addLine(-203,244)
            addLine(-179.705,179.999)
            path.addRelativeArc(center: position(-191.921,175.553),
                                radius: 13 * width,
                                startAngle: .degrees(20),
                                delta: .degrees(-71))
            
            //            path.move(to: position (-183.740,165.450)) Arc C
            addLine(-372,13)
            addLine(-329.678,-6.735)
            path.addRelativeArc(center: position(-335.172,-18.517),
                                radius: 13 * width,
                                startAngle: .degrees(65),
                                delta: .degrees(-83))
            
            //            path.move(to: position(-322.808,-22.534)) Arc D
            addLine(-360,-137)
            addLine(-251.637,-113.967)
            path.addRelativeArc(center: position(-248.934,-126.683),
                                radius: 13 * width,
                                startAngle: .degrees(98),
                                delta: .degrees(-79))
            
            //            path.move(to: position(-236.968,-121.603)) Arc E
            addLine(-216,-171)
            addLine(-131.369,-80.245)
            path.addRelativeArc(center: position(-121.862,-89.111),
                                radius: 13 * width,
                                startAngle: .degrees(157),
                                delta: .degrees(-148))
            
            //            path.move(to: position(-109.101,-91.591)) Arc F
            addLine(-150,-302)
            addLine(-84.543,-264.208)
            path.addRelativeArc(center: position(-78.043,-275.467),
                                radius: 13 * width,
                                startAngle: .degrees(140),
                                delta: .degrees(-93))
            
            //            path.move(to: position(-66.460,-269.565))
            addLine(0,-400)
        }
    }
}
