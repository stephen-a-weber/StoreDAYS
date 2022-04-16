//
//  slidingDoor.swift
//  transition
//
//  Created by stephen weber on 4/15/22.
// Modified from nerdyak.tech/development/2020/10/12/transitions-in-swiftui.html
// followed suggestions at end of article and made it branch in
// four ways

import Foundation
import SwiftUI

extension AnyTransition{
    static var door: AnyTransition {
        .modifier(active:SlidingDoorEffect(HSplit:-700,VSplit:-770), identity: SlidingDoorEffect(HSplit:0,VSplit:0))
    }
}


struct SlidingDoorEffect : ViewModifier {
    let HSplit : CGFloat
    let VSplit : CGFloat
    
    func body(content:Content) -> some View {
        let c = content
        return ZStack {
            c.clipShape(HalfClipShape(left:false,up:false)).offset(x:-HSplit, y:0)//bottomright
            c.clipShape(HalfClipShape(left:true,up:true)).offset(x:HSplit,y:0)//TopLeft
            c.clipShape(HalfClipShape(left:false,up:true)).offset(x:0,y:VSplit)
            c.clipShape(HalfClipShape(left:true,up:false)).offset(x:0,y:-VSplit)
            
        }
    }
}

struct HalfClipShape: Shape {
    var left: Bool
    var up: Bool
    
    func path (in rect: CGRect) -> Path {
        
        
        return Path { path in
            
            
            let width = rect.width
            let height = rect.height
            let startx: CGFloat = left ? 0 : width/2
            let starty: CGFloat = up ? 0 : height/2
            let shapeWidth:CGFloat = width/2
            let shapeHeight:CGFloat = height/2
            
            path.move(to: CGPoint(x:startx,y:starty))
            
            path.addLines([
                CGPoint(x:startx+shapeWidth,y:starty),
                CGPoint(x:startx+shapeWidth,y:starty+shapeHeight),
                CGPoint(x:startx,y:starty+shapeHeight),
                CGPoint(x:startx,y:starty)])
        }
    }
}
