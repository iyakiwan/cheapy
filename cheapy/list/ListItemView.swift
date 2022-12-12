//
//  ListItemView.swift
//  cheapy
//
//  Created by Mufti Alie Satriawan on 12/12/22.
//

import SwiftUI

struct ListItemView: View {
    let listItems: [Item]
    
    init(listItems: [Item]) {
        self.listItems = listItems
    }
    
    var body: some View {
        VStack{
            HStack {
                Text("List Items")
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
                Button {
                } label: {
                    Label("", systemImage: "trash")
                        .labelStyle(IconOnlyLabelStyle())
                        .font(.system(size: 20).bold())
                        .foregroundColor(.black)
                        .padding(5)
                }
                .opacity(listItems.count > 0 ? 1.0 : 0.0)
                Button {
                } label: {
                    Label("", systemImage: "plus")
                        .labelStyle(IconOnlyLabelStyle())
                        .font(.system(size: 20).bold())
                        .foregroundColor(.black)
                        .padding(5)
                }
            }
            .padding()
            if listItems.count > 0 {
                ScrollView() {
                    ForEach(listItems) { item in
                        ItemView(item: item)
                            .background(.yellow)
                    }
                    
                }
                Spacer()
                
                Divider().tint(.black)
                VStack {
                    Text("The Cheapest Item is:")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 5)
                    Text("\(calculateWeightCheapest(listItems: self.listItems).brand) \n(\(formatNet(input: calculateWeightCheapest(listItems: self.listItems).net)) \(calculateWeightCheapest(listItems: self.listItems).unit.rawValue))")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("$ \(calculateWeightCheapest(listItems: self.listItems).money)")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                }
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
        
        ListItemView(listItems: dummyWeightItems)
    }
}
