//
//  ContentView.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/10/22.
//

import SwiftUI

struct CharacterView: View {
    var body: some View {
        

        VStack {
            NavigationView() {
                //navigation view + search bar
            }
            Divider()
            HStack {
                Text("<<title>>")
                Text("<<name>>")
            }
            HStack {
                Text("<<level>>")
                    .font(.system(size: 14))
                Text("<<race>>")
                    .font(.system(size: 14))
                Text("<<spec>>")
                    .font(.system(size: 14))
                Text("<<class>>")
                    .font(.system(size: 14))
                Text("<<server>>")
                    .font(.system(size: 14))
            }
            Divider()
            VStack {
                HStack{
                    VStack{
                        ItemView(imageName: "itemPlaceholder")
                        ItemView(imageName: "itemPlaceholder")
                        ItemView(imageName: "itemPlaceholder")
                        ItemView(imageName: "itemPlaceholder")
                        ItemView(imageName: "itemPlaceholder")
                        ItemView(imageName: "itemPlaceholder")
                        ItemView(imageName: "itemPlaceholder")
                        ItemView(imageName: "itemPlaceholder")
                    }
                    Spacer()
                    VStack{
                        ItemView(imageName: "itemPlaceholder")
                        ItemView(imageName: "itemPlaceholder")
                        ItemView(imageName: "itemPlaceholder")
                        ItemView(imageName: "itemPlaceholder")
                        ItemView(imageName: "itemPlaceholder")
                        ItemView(imageName: "itemPlaceholder")
                        ItemView(imageName: "itemPlaceholder")
                        ItemView(imageName: "itemPlaceholder")
                    }
                }
                HStack {
                    ItemView(imageName: "itemPlaceholder")
                    ItemView(imageName: "itemPlaceholder")
                }
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CharacterView()
                .previewDevice("iPhone 13 Pro")
        }
    }
}

