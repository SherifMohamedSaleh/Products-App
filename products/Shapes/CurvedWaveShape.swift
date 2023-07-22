//
//  CurvedWaveShape.swift
//  products
//
//  Created by Sherif Abd El-Moniem on 22/07/2023.
//

import SwiftUI

struct CurvedWaveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to : CGPoint(x: rect.minX , y :  rect.minY ))
        let to1 = CGPoint(x: rect.maxX  , y: rect.minY )
        let controol1 = CGPoint(x: rect.minX + 60, y: rect.minY + 150 )
        let controol2 = CGPoint(x: rect.maxX - 60 , y: rect.minY + 150 )
        path.addCurve(to: to1, control1: controol1, control2: controol2)
        path.addLine(to: CGPoint(x: rect.maxX  , y: rect.maxY ))
        path.addLine(to: CGPoint(x: rect.minX  , y: rect.maxY ))
        path.closeSubpath()

        return path

    }
}
struct CurvedWaveShape_Previews: PreviewProvider {
    static var previews: some View {
        CurvedWaveShape()
            .stroke(Color.green  , lineWidth :2)
            .frame(height : 200)
            .padding()
    }
}
