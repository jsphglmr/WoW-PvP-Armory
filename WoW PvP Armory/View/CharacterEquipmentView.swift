//
//  CharacterEquipmentView.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/19/22.
//

import SwiftUI

struct CharacterEquipmentView: View {
    
    @State var name: String = ""
    @State var realm: String = ""
    
    init(name: String, realm: String) {
        self.name = name
        self.realm = realm
    }
    
    var body: some View {
        VStack {
            NavigationView() {
                //navigation view + search bar
                
            }
            Divider()
            HStack {
                Text("<<title>>")
                Text(name)
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
                Text(realm)
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

struct CharacterEquipmentView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterEquipmentView(name: "Jojo", realm: "Tichondrius")
    }
}
