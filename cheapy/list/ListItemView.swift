//
//  ListItemView.swift
//  cheapy
//
//  Created by Mufti Alie Satriawan on 12/12/22.
//

import SwiftUI

struct ListItemView: View {
    @ObservedObject var viewModel: MainViewModel
    private var isWeight: Bool
    @State private var showAlertClear = false
    let listItems: [Item]
    
    init(listItems: [Item], viewModel: MainViewModel, isWeight: Bool) {
        self.listItems = listItems
        self.viewModel = viewModel
        self.isWeight = isWeight
    }
    
    var body: some View {
        VStack{
            HStack {
                Text("List Items")
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
                Button {
                    showAlertClear = true
                } label: {
                    Label("", systemImage: "trash")
                        .labelStyle(IconOnlyLabelStyle())
                        .font(.system(size: 20).bold())
                        .foregroundColor(.black)
                        .padding(5)
                }
                .opacity(listItems.count > 0 ? 1.0 : 0.0)
                .alert(isPresented: $showAlertClear) {
                    Alert(
                        title: Text("Clear Item"),
                        message: Text("Are you want to delete all data?"),
                        primaryButton: .default(
                            Text("No")
                        ),
                        secondaryButton: .destructive(
                            Text("Yes"),
                            action: { viewModel.clearData(isWeight: self.isWeight)
                            }
                        )
                    )
                }
                Button {
                } label: {
                    Label("", systemImage: "plus")
                        .labelStyle(IconOnlyLabelStyle())
                        .font(.system(size: 20).bold())
                        .foregroundColor(.black)
                        .padding(.trailing, 15)
                }
            }
            .padding()
            if listItems.count > 0 {
                ScrollView() {
                    ForEach(listItems) { item in
                        ItemView(item: item,
                                 viewModel: self.viewModel,
                                 isWeight: self.isWeight)
                        .background(Color("ColorCard"))
                        .padding(.horizontal)
                    }
                    
                }
                Spacer()
                
                VStack {
                    Divider().tint(.black)
                    Text("The Cheapest Item is:")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 5)
                    Text("\(calculateWeightCheapest(listItems: self.listItems).brand)")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("(\(formatNet(input: calculateWeightCheapest(listItems: self.listItems).net)) \(calculateWeightCheapest(listItems: self.listItems).unit.rawValue))")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                    Text("$ \(calculateWeightCheapest(listItems: self.listItems).money)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.top, 5)
                }
                .background(.yellow)
            } else {
                GeometryReader { geometry in
                    ScrollView{
                        VStack{
                            Text("Add Item with same product to get The Cheapest")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding()
                        }
                        .frame(width: geometry.size.width)
                        .frame(minHeight: geometry.size.height)
                    }
                }
            }
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(
            listItems: dummyWeightItems,
            viewModel: MainViewModel(),
            isWeight: true
        )
    }
}
