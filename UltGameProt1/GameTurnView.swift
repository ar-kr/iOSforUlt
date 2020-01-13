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
        NavigationView{
            VStack(alignment: .center){
                Text("nターン")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .frame(height: 40.0)
                Spacer().frame(height: 100.0)
                HStack{
                    Text(team1)
                        .multilineTextAlignment(.leading)
                        
                    
                    Text(team2)
                        .multilineTextAlignment(.trailing)
                        
                }.frame(height: 20.0)
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
                Text("試合時間")
                    .font(.largeTitle)
                    .frame(height: 120.0)
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
                HStack{
                    Button(action: {
                        
                    }){
                        Text("自分得点")
                            .font(.largeTitle)
                    }
                    .padding(.all)
                    Button(action: {
                        
                    }){
                        Text("相手得点")
                            .font(.largeTitle)
                    }
                    .padding(.all)
                }.frame(height: 80.0)
                Spacer()
                .frame(height: 250.0)
            }
            //.navigationBarTitle("finish")
            
            
            //.foregroundColor(Color.blue)
                
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxHeight: .infinity)
        .background(Color.blue)
    }
}
