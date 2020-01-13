//
//  GameTurnView.swift
//  UltGameProt1
//
//  Created by krmtmint on 2020/01/12.
//  Copyright © 2020 Airi.K. All rights reserved.
//

import UIKit
import SwiftUI

struct GameTurnView: View {
    @Binding var team1: String
    @Binding var team2: String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var point1 = 0
    @State var point2 = 0
    @State var flag = false
    var body: some View {
        VStack {
            VStack(alignment: .center){
                View1()
                View2()
                View3()
                View4()
                View5()
                View6()
                //Spacer()
            }
            .frame(width: 360, height: 500, alignment: .center)
            .background(Color.yellow)
            .navigationBarBackButtonHidden(true)
        
            Spacer()
        }
    }
}

struct View1: View {
    var body: some View {
        Text("nターン")
            .font(.largeTitle)
            //.multilineTextAlignment(.center)
            .frame(width: 360, height: 50, alignment: .center)
    }
}

struct View2: View {
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
    var body: some View {
        Text("試合時間")
            .font(.largeTitle)
            .frame(height: 120, alignment: .center)
    }
}

struct View5: View {
    var body: some View {
        Button(action: {
            if(self.flag){
                //self.labelText = "SwiftUI Test"
                self.flag = false
            }
            else{
                //self.labelText = "tapped !"
                self.flag = true
            }
        }){
            Text("タイムアウト")
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .frame(height: 50.0)
        }
        //.padding(.all)
        .background(Color.blue)
    }
}

struct View6: View {
    var body: some View {
        HStack{
            Button(action: {
                point1 += 1
            }){
                Text("自分得点")
                    .font(.largeTitle)
            }
            .padding(.all)
            Button(action: {
                point2 += 1
            }){
                Text("相手得点")
                    .font(.largeTitle)
            }
            .padding(.all)
        }.frame(height: 80.0)
    }
}
