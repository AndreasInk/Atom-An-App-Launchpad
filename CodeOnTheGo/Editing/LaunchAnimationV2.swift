//
//  LaunchGame.swift
//  CodeOnTheGo
//
//  Created by Andreas Ink on 12/6/20.
//

import SwiftUI

struct LaunchViewV2: View {
    @State var move = false
    @State var thrust = false
    @State var deThrust = false
    @State var drift = false
    @State var i = 0
    @State var rotation = 0.0
    var body: some View {
        GeometryReader { geo in
        ZStack {
            Color("dark")
                .overlay(
                    Image("background")
                .resizable()
                .frame(width: geo.size.width*4, height: geo.size.height * 4)
        )
                .onAppear() {
                    let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                        withAnimation(.easeIn(duration: 1.0)) {
                            thrust.toggle()
                            i += 1
                            if i == 4 {
                            timer.invalidate()
                                
                                deThrust = true
                        }
                        }
                    }
                    let timer2 = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
                        withAnimation(.easeIn(duration: 1.0)) {
                            
                            if deThrust {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                           // drift.toggle()
                                  //  rotation =  Double(Int.random(in: 25..<45))
                            }
                            }
                        }
                    }
                    withAnimation(.easeIn(duration: 4.0)) {
                    move = true
                }
                }
            if move {
            Image("sky")
                .resizable()
              //  .offset(y: 50)
                .frame(width: geo.size.width, height: geo.size.height * 4)
                .animation(Animation.easeInOut(duration: 4))
                .transition(.offset(y: -geo.size.height*2))
                .offset(x: CGFloat(drift ? rotation : rotation))
            }
        } .ignoresSafeArea()
            VStack {
                Spacer()
            HStack {
                Spacer()
                VStack {
            Image("ship")
                .resizable()
                .frame(width: geo.size.width/3, height: geo.size.width/3)
                .rotationEffect(deThrust ? Angle.init(degrees: 25) : Angle.init(degrees: .zero), anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .rotationEffect(drift ? Angle.init(degrees:  Double(Int.random(in: 25..<45))) : Angle.init(degrees: rotation), anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .animation(deThrust ? Animation.easeInOut(duration: 3) : Animation.easeInOut(duration: 1) )
                Image("thrust")
                    .resizable()
                    .frame(width: geo.size.width/10, height: thrust ? geo.size.width/4 : geo.size.width/3.5)
                    .opacity(deThrust ? 0.0 : 1.0)
                    .offset(y: -10)
                    .animation(deThrust ? Animation.easeInOut(duration: 0.1) : Animation.easeInOut(duration: 1) )
                }
                Spacer()
    }
        }
        }
    }
}
