//
//  InputView.swift
//  cheapy
//
//  Created by Mufti Alie Satriawan on 12/12/22.
//

import SwiftUI

struct InputView: View {
    var isUpdate: Bool
    var isWeight: Bool
    @ObservedObject var viewModel: MainViewModel
    
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var net: String = ""
    @State private var price: String = ""
    
    @State private var selectionWeight: UnitItem = UnitItem.g
    @State private var selectionVolume: UnitItem = UnitItem.ml
    let unitWeight = [UnitItem.g, UnitItem.kg]
    let unitVolume = [UnitItem.ml, UnitItem.l]
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                Text("Brand")
                    .font(.headline)
                TextField("ex: Head & Shoulders", text: $name)
                    .frame(maxWidth: .infinity)
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                
                HStack (alignment:.top) {
                    VStack (alignment: .leading){
                        Text(isWeight ? "Weight" : "Volume")
                            .font(.headline)
                        TextField("ex: 100", text: $net)
                            .frame(maxWidth: .infinity)
                            .disableAutocorrection(true)
                            .textFieldStyle(.roundedBorder)
                            .textContentType(.oneTimeCode)
                            .keyboardType(.numberPad)
                    }
                    VStack{
                        Text("Unit")
                            .font(.headline)
                        Picker("", selection: isWeight ? $selectionWeight : $selectionVolume) {
                            ForEach(isWeight ? unitWeight : unitVolume, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                }
                .padding(.top, 10)
                Text("Price")
                    .font(.headline)
                    .padding(.top, 10)
                TextField("ex: 10000", text: $price)
                    .frame(maxWidth: .infinity)
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.oneTimeCode)
                    .keyboardType(.numberPad)
                Spacer()
            }
            .navigationTitle(isUpdate ? "Update Item":"Add Item")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(isUpdate ? "Update":"Add") {
                        if isUpdate {
                            print("Update")
                        } else {
                            let realNet = (Float(net) ?? 0.0) * formatUnit(input: isWeight ? selectionWeight : selectionVolume)
                            let inputData: Item = .init(id: UUID(), brand: name, net: Float(net) ?? 0.0, realNet: realNet, unit: isWeight ? selectionWeight : selectionVolume, money: Int(price) ?? 0)
                            print(inputData)
                            viewModel.addData(isWeight: isWeight, item: inputData)
                            
                        }
                        dismiss()
                    }
                }
            }
            .padding()
        }
    }
    
    func formatUnit(input : UnitItem) -> Float {
        return (input == UnitItem.l || input == UnitItem.kg) ? 1000.0 : 1.0
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(isUpdate: false,
                  isWeight: true,
                  viewModel: MainViewModel())
    }
}
