//
//  TextButtonView.swift
//  LionSpellApp
//
//  Created by Wei Lin Weng on 8/25/22.
//

import SwiftUI

struct diamondShape : Shape{
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        
        }
    }
    
}

struct pentagonShape : Shape{
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horizontalOffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - horizontalOffset*2.4))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + horizontalOffset*2.6))
        
        }
    }
    
}

struct hexagonShape : Shape{
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width: CGFloat = 100
            let height: CGFloat = 100
            
            path.move(to: CGPoint(x: 0.2*width, y: 0*height))
            path.addLine(to: CGPoint(x: 0.8*width, y: 0*height))
            path.addLine(to: CGPoint(x: 1*width, y: 0.5*height))
            path.addLine(to: CGPoint(x: 0.8*width, y: 1*height))
            path.addLine(to: CGPoint(x: 0.2*width, y: 1*height))
            path.addLine(to: CGPoint(x: 0*width, y: 0.5*height))
        
        }
    }
    
}

struct TextButtonView: View {
    var textListArr : [String] = []
    var letterAction : (String) -> Void
    var diaXPos = [200.0, 100.0, 100.0, 300.0, 300.0]
    var diaYPos = [200.0, 100.0, 300.0, 100.0, 300.0]
    var penXPos = [200.0, 130.0, 100.0, 270.0, 300.0, 200.0]
    var penYPos = [200.0, 130.0, 250.0, 130.0, 250.0, 320.0]
    var hexXPos = [200.0, 100.0, 100.0, 200.0, 300.0, 200.0, 300.0]
    var hexYPos = [200.0, 130.0, 270.0, 80.0, 130.0, 320.0, 270.0]
    var body: some View {
        ZStack{
            
            //Diamond 5 buttons
            Spacer()
            if(textListArr.count > 4 && textListArr.count < 6){
                Button(action: {letterAction(textListArr[0])}){
                    Text(textListArr[0])
                        .foregroundColor(.white)
                        .font(.title)
                }.background(diamondShape()
                    .fill(Color.yellow).opacity(1)
                    .frame(width: 100, height: 100))
                .position(x: diaXPos[0], y: diaYPos[0])
                ForEach (1..<5) { index in
                    Button(action: {letterAction(textListArr[index])}){
                        Text(textListArr[index])
                            .foregroundColor(.white)
                            .font(.title)
                    }.background(diamondShape()
                        .fill(Color.red)
                        .frame(width: 100, height: 100))
                    .position(x: diaXPos[index], y: diaYPos[index])
                    Spacer()
                }
            //Pentagon 6 buttons
            }else if (textListArr.count > 5 && textListArr.count < 7){
                Button(action: {letterAction(textListArr[0])}){
                    Text(textListArr[0])
                        .foregroundColor(.white)
                        .font(.title)
                        .rotationEffect(.degrees(-180))
                }.background(pentagonShape()
                    .fill(Color.yellow).opacity(1)
                    .frame(width: 100, height: 100))
                .rotationEffect(.degrees(-180))
                .position(x: penXPos[0], y: penYPos[0])
                ForEach (1..<6) { index in
                    Button(action: {letterAction(textListArr[index])}){
                        Text(textListArr[index])
                            .foregroundColor(.white)
                            .font(.title)
                    }.background(pentagonShape()
                        .fill(Color.red)
                        .frame(width: 100, height: 100))
                    .position(x: penXPos[index], y: penYPos[index])
                    Spacer()
                }
            //Hexagon 7 buttons
            }else if (textListArr.count > 6 && textListArr.count < 8){
                Button(action: {letterAction(textListArr[0])}){
                    Text(textListArr[0])
                        .foregroundColor(.white)
                        .font(.title)
                }.background(hexagonShape()
                    .fill(Color.yellow).opacity(1)
                    .frame(width: 100, height: 100))
                .position(x: hexXPos[0], y: hexYPos[0])
                ForEach (1..<7) { index in
                    Button(action: {letterAction(textListArr[index])}){
                        Text(textListArr[index])
                            .foregroundColor(.white)
                            .font(.title)
                    }.background(hexagonShape()
                        .fill(Color.red)
                        .frame(width: 100, height: 100))
                    .position(x: hexXPos[index], y: hexYPos[index])
                    Spacer()
                }
            }
        }.frame(width: 400, height: 400)
    }
}


struct TextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TextButtonView(textListArr: ["t","p","e","s","y","c","k"], letterAction : {String_ in })
    }
}
