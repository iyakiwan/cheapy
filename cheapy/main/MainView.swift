//
//  MainView.swift
//  cheapy
//
//  Created by Mufti Alie Satriawan on 11/12/22.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = MainViewModel()
    @State private var selectedFilterProduct = "By Weight"
    var filterProducts = ["By Weight", "By Volume"]
    var body: some View {
        VStack {
            Text("Find your cheapest on the same product")
                .font(.largeTitle)
                .fontWeight(.bold)
            Picker("What is your filter item product?", selection: $selectedFilterProduct) {
                ForEach(filterProducts, id: \.self) { filterProduct in
                    Text(filterProduct)
                }
            }
            .pickerStyle(.segmented)
            ListItemView(listItems: selectedFilterProduct == "By Weight" ? vm.listWeightItems : vm.listVolumeItems)
            
            Spacer()
        }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
