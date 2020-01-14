//
//  ContentView.swift
//  UltGameProt1
//
//  Created by krmtmint on 2020/01/11.
//  Copyright © 2020 Airi.K. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    /*
    @State var labelText = "Hello World"
    @State var flag = false
    */
    
    var body: some View {
        
        VStack {
            NavigationView {
                        VStack {
                            /*
                            Text(labelText)
                                .font(.largeTitle)
                                .padding(.bottom)
                            
                            Button(action: {
                                if(self.flag){
                                    self.labelText = "SwiftUI Test"
                                    self.flag = false
                                }
                                else{
                                    self.labelText = "tapped !"
                                    self.flag = true
                                }
                            }){
                                Text("Button")
                                    .font(.largeTitle)
                                    .foregroundColor(Color.white)
                            }
                            .padding(.all)
                            .background(Color.blue)
                            
                            NavigationLink(destination: SecondView()){
                                Text("next page")
                            */
                            NewGameView().padding()
                            ViewView().padding()
                        Spacer()
                    
                        }
                        .frame(width: 300.0, height: 500.0)
                    }
            //.frame(width: 300.0, height: 200.0)
            //Spacer()
                //.frame(height: 200.0)
        }
        
    }
}


/*
struct SecondView: View {
    var body: some View {
        Text("OK!")
    }
}
*/

struct NewGameView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: NewGameSecondView()) {
                    Text("新規登録")
                    .font(.largeTitle)
            }
        }
    }
}

struct NewGameSecondView: View {
    @State var topText = "試合概要入力"
    @State private var team1 = ""
    @State private var team2 = ""
    @State private var date = ""
    @State private var field = ""
    @State private var weather = ""
    @State private var gameTime = ""
    @State private var timeOut = ""
    //@State private var OFDF = ""
    @State private var offence = true
    //@State private var flip = ""
    @State private var cort = true
    @State private var team3 = ""
    
    /*
    enum OFDF : String, CaseIterable, Hashable{
        case of = "先攻"
        case df = "後攻"
    }
    */
    
    var body: some View {
        NavigationView {
            VStack {
                Text(topText)
                    .font(.largeTitle)
                    //.multilineTextAlignment(.center)
                    //.frame(width: 300.0, height: 25.0)
                    //.padding(.top)
                
                Group {
                    VStack {
                        TextField("自チーム", text: $team1)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                
                    TextField("相手チーム", text: $team2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("日時", text: $date)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("場所", text: $field)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("天候", text: $weather)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("試合時間", text: $gameTime)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("タイムアウト回数", text: $timeOut)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                /*
                Picker(selection: NewGameSecondView.OFDF, label: Text("先攻/後攻")) {
                    Text(OFDF.of)
                    Text(OFDF.df)
                }
                */
                Toggle(isOn: $offence) {
                    Text("OFスタート:")
                }
                Toggle(isOn: $cort) {
                    Text("コート選択:")
                }
                
                NavigationLink(destination: gameTurnView(team1: $team1, team2: $team2)) {
                        Text("試合開始")
                            .font(.largeTitle)
                            .padding(.bottom)
                }
                .padding(.bottom, 15.0)
                Spacer()
                    .frame(height: 100.0)
            }
            //.navigationBarBackButtonHidden(true)
            .frame(width: 300, height: 660, alignment: .center)
        }
    }
}

struct gameTurnView: View {
    @Binding var team1: String
    @Binding var team2: String
    var body: some View {
        GameTurnView(team1: $team1, team2: $team2)
    }
}
struct ViewView: View {
    var body: some View {
        NavigationLink(destination: ViewSecondView()) {
            Text("表示")
            .font(.largeTitle)
        }
    }
}

struct ViewSecondView: View {
    var body: some View {
        Text("未実装")
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
