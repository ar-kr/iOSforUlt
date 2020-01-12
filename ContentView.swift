//
//  ContentView.swift
//  UltGameProt1
//
//  Created by krmtmint on 2020/01/11.
//  Copyright © 2020 Airi.K. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var labelText = "Hello World"
    @State var flag = false
    
    var body: some View {
        NavigationView {
            VStack {
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
                }
            }
        }
    }
}

struct SecondView: View {
    var body: some View {
        Text("OK!")
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
