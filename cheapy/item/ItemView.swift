//
//  ItemView.swift
//  cheapy
//
//  Created by Mufti Alie Satriawan on 12/12/22.
//

import SwiftUI

struct ItemView: View {
    let item: Item
    @ObservedObject var viewModel: MainViewModel
    private var isWeightItem: Bool
    @State private var showAlertDelete = false
    
    init(item: Item, viewModel: MainViewModel, isWeight: Bool) {
        self.item = item
        self.viewModel = viewModel
        self.isWeightItem = isWeight
    }
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text(item.brand)
                    .font(.body)
                    .fontWeight(.bold)
                Text("\(formatNet(input: item.net)) \(item.unit.rawValue)")
                    .font(.body)
                Text("\(formatPrice(input: Float(item.money)))")
                    .font(.headline)
                    .padding(.top, 5)
            }
            Spacer()
            Button {
                print("delete \(isWeightItem)")
                showAlertDelete = true
            } label: {
                Label("", systemImage: "trash")
                    .labelStyle(IconOnlyLabelStyle())
                    .font(.system(size: 20).bold())
                    .foregroundColor(.black)
                    .padding(5)
            }
            .alert(isPresented: $showAlertDelete) {
                Alert(
                    title: Text("Delete Item"),
                    message: Text("Are you want to delete this item?"),
                    primaryButton: .default(
                        Text("No")
                    ),
                    secondaryButton: .destructive(
                        Text("Yes"),
                        action: { viewModel.deleteDataById(isWeight: self.isWeightItem, selectedId: item.id)
                        }
                    )
                )
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
        ItemView(item: dummyWeightItems[0],
        viewModel: MainViewModel(),
                 isWeight: true)
            .background(Color("ColorCard"))
    }
}
