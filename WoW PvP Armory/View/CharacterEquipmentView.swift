//
//  CharacterEquipmentView.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/19/22.
//

import SwiftUI

struct CharacterEquipmentView: View {
    
    @StateObject private var characterVM = CharacterListViewModel()
    @State private var searchText: String = ""
    @State var name: String = ""
    @State var realm: String = ""
    
    init(name: String, realm: String) {
        self.name = name
        self.realm = realm
    }
    
    var body: some View {
        ZStack {
            Color.ui.background
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    VStack {
                        SearchBar(text: $searchText)
                    }.padding(2)
                    VStack {
                        Picker("Choose a Server", selection: $name) {
                            ForEach(ServerList.serverListNA, id: \.self) {
                                Text($0)
                            }
                            .pickerStyle(.menu)
                        }
                        .font(.sfMonoRegular(size: 16))
                        .foregroundColor(Color.ui.text)
                    }
                    .font(.sfMonoRegular(size: 16))
                    .foregroundColor(Color.ui.text)
                    .frame().background(Color.ui.picker)
                    .padding(2)
                    Spacer()
                }
                
                Spacer()
                HStack {
                    InfoView(info: "title")
                    InfoView(info: "name")
                }
                HStack {
                    InfoView(info: "level")
                    InfoView(info: "race")
                    InfoView(info: "spec")
                    InfoView(info: "class")
                    InfoView(info: "realm")
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
                        .padding(.leading, 5.0)
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
                        .padding(.trailing, 5.0)
                    }
                    HStack {
                        ItemView(imageName: "itemPlaceholder")
                        ItemView(imageName: "itemPlaceholder")
                    }
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
