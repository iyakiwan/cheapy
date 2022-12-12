//
//  ItemView.swift
//  cheapy
//
//  Created by Mufti Alie Satriawan on 12/12/22.
//

import SwiftUI

struct ItemView: View {
    let item: Item
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text(item.brand)
                    .font(.body)
                    .fontWeight(.bold)
                Text("\(formatNet(input: item.net)) \(item.unit.rawValue)")
                    .font(.body)
                Text("$ \(item.money)")
                    .font(.headline)
                    .padding(.top, 5)
            }
            Spacer()
            Button {
            } label: {
                Label("", systemImage: "trash")
                    .labelStyle(IconOnlyLabelStyle())
                    .font(.system(size: 20).bold())
                    .foregroundColor(.black)
                    .padding(5)
            }
            Button {
            } label: {
                Label("", systemImage: "pencil")
                    .labelStyle(IconOnlyLabelStyle())
                    .font(.system(size: 20).bold())
                    .foregroundColor(.black)
            }
        }
        .padding()
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: dummyWeightItems[0])
            .background(Color("ColorCard"))
    }
}
