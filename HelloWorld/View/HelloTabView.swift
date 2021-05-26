//
//  HelloTabView.swift
//  HelloWorld
//
//  Created by 五百蔵和也 on 2021/05/25.
//

import SwiftUI
import Combine

struct HelloTabView : View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            ContentView()
                .font(.title)
                .tabItem{Image("home")
                    Text("home")}
                .tag(0)
            ContentView2()
                .font(.title)
                .tabItem{Image("list")
                    Text("list")}
                .tag(1)
            ContentView3()
                .font(.title)
                .tabItem{Text("mypage")}
                .tag(2)
            ContentView4()
                .font(.title)
                .tabItem{Text("donate")}
                .tag(3)

        }
    }
}

#if DEBUG
struct HelloTabView_Previews : PreviewProvider {
    static var previews: some View {
        HelloTabView()
    }
}
#endif
