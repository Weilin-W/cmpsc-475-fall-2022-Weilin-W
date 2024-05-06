//
//  Pentominoes.swift
//  Pentominoes
//
//  Created by Wei Lin Weng on 9/19/22.
//

import SwiftUI

struct Pentominoes: View {
    @ObservedObject var manager = BoardManager()
    
    //MARK: Random position all the pentominoes within
    var body: some View {
        ZStack(alignment: .topLeading){
            ForEach($manager.imageCenters){$rc in
                GesturesImage(center: $rc, image: $rc.index)
            }
        }
    }
}

struct Pentominoes_Previews: PreviewProvider {
    static var previews: some View {
        Pentominoes()
    }
}


struct GesturesImage: View {
    @Binding var center : Center
    @Binding var image : String
    let s : CGFloat = 50
    @State var offset = CGSize.zero
    @State var angle = 0.0
    @State var yAngle = 0.0
    @State var yAxis : CGFloat = 0.0
    
    var tap : some Gesture{
        TapGesture().onEnded { angle in
            self.angle += 90.0
        }
    }
    var longPress : some Gesture{
        LongPressGesture(minimumDuration: 1.5).onEnded { yAngle in
            self.yAngle += 180
            self.yAxis = 1.0
        }
    }
    
    var body: some View {
        
        //MARK: Enable drag gesture
        let drag = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { value in
                center.moveBy(width: value.translation.width, height: value.translation.height)
                offset = CGSize.zero
            }
        
        Image(image)
        //MARK: Determine the initial position of each asset images
            .position(x: center.x, y: center.y)
            .offset(offset)
            .gesture(longPress)
            .gesture(drag)
            .gesture(tap)
            .rotationEffect(.degrees(angle))
            .rotation3DEffect(.degrees(yAngle), axis: (x: 0.0, y: yAxis, z: 0.0))
    }
}
