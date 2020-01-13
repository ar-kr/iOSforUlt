//
//  GameTurnView.swift
//  UltGameProt1
//
//  Created by krmtmint on 2020/01/12.
//  Copyright © 2020 Airi.K. All rights reserved.
//

import SwiftUI
import Combine

class TimerHolder : ObservableObject {
    @Published var timer : Timer!
    @Published var sec = 0
    @Published var min = 0
    @Published var outSec = 0
    
    func start() {
        self.timer?.invalidate()
        //self.sec = 0
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){_ in
            self.sec += 1
            if(self.sec == 60){
                self.min += 1
                self.sec = 0
            }
        }
    }
    func outStart() {
        self.timer?.invalidate()
        self.outSec = 0
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){_ in
            self.outSec += 1
        }
    }
    func outStop() {
        self.outSec = 0
        start()
    }
    
}

struct GameTurnView: View {
    @Binding var team1: String
    @Binding var team2: String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var point1 = 0
    @State var point2 = 0
    @State var turn = 1
    //@State var flag = false
    var body: some View {
        VStack {
            VStack(alignment: .center){
                View1(turn: $turn, point1: $point1, point2: $point2)
                View2(team1: $team1, team2: $team2)
                View3(point1: $point1, point2: $point2)
                View4()
                View5()
                View6(point1: $point1, point2: $point2)
                Spacer()
            }
            .frame(width: 360, height: 700, alignment: .center)
            .background(Color.yellow)
            .navigationBarBackButtonHidden(true)
        
            Spacer()
        }
    }
}

struct View1: View {
    @Binding var turn: Int
    @Binding var point1: Int
    @Binding var point2: Int
    var body: some View {
        Text(String(turn+point1+point2) + " ターン")
            .font(.largeTitle)
            //.multilineTextAlignment(.center)
            .frame(width: 360, height: 50, alignment: .center)
    }
}

struct View2: View {
    @Binding var team1: String
    @Binding var team2: String
    var body: some View {
        HStack{
            Text(team1)
                .multilineTextAlignment(.leading)
                .frame(width: 180, height: 20)
            
            Text(team2)
                .multilineTextAlignment(.trailing)
                .frame(width: 180, height: 20)        
        }.frame(height: 50)
    }
}

struct View3: View {
    @Binding var point1: Int
    @Binding var point2: Int
    var body: some View {
        HStack{
            Text(String(point1))
                .font(.largeTitle)
                .multilineTextAlignment(.leading)
                .frame(width: 80.0)
            Spacer().frame(width: 80.0)
            Text(String(point2))
                .font(.largeTitle)
                .multilineTextAlignment(.trailing)
                .frame(width: 80.0)
        }
        .frame(width: 240, height: 80.0)
    }
}

struct View4: View {
    @EnvironmentObject var timerHolder : TimerHolder
    
    @State var Min = ""
    @State var sec = 0
    
    var body: some View {
        VStack{
            //Button("Start"){self.timerHolder.start()}
            Button(action: {
                self.timerHolder.start()
            }){
                Text("Start")
            }
            .frame(height: 20.0)
            HStack{
                //Text(String(format: "%02d", self.timerHolder.min))
                Text(String(self.timerHolder.min))
                    .font(.largeTitle)
                    .frame(height: 100.0)
                Text(":")
                    .font(.largeTitle)
                    .frame(height: 100.0)
                Text(String(self.timerHolder.sec))
                    .font(.largeTitle)
                    .frame(height: 100.0)
            }
            .frame(height: 100.0)
            
        }
    }
}

struct View5: View {
    @EnvironmentObject var timerHolder : TimerHolder
    @State var flag = false
    var body: some View {
        VStack {
            Button(action: {
                if(self.flag){
                    //self.labelText = "SwiftUI Test"
                    self.timerHolder.outStop()
                    self.flag = false
                }
                else{
                    //self.labelText = "tapped !"
                    self.timerHolder.outStart()
                    self.flag = true
                }
            }){
                Text("タイムアウト")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(height: 30.0)
            }
            //.padding(.all)
            .background(Color.blue)
            
            Text(String(self.timerHolder.outSec))
                .frame(height: 20)
        }
    }
}

struct View6: View {
    @Binding var point1: Int
    @Binding var point2: Int
    var body: some View {
        HStack{
            Button(action: {
                self.point1 += 1
            }){
                Text("自分得点")
                    .font(.largeTitle)
            }
            .padding(.all)
            Button(action: {
                self.point2 += 1
            }){
                Text("相手得点")
                    .font(.largeTitle)
            }
            .padding(.all)
        }.frame(height: 80.0)
    }
}
