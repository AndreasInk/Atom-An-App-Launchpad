//
//  SymbolList.swift
//  sfsymbols
//
//  Created by An Trinh on 9/9/19.
//  Copyright © 2019 An Trinh. All rights reserved.
//

import SwiftUI
import UIKit
import CoreHaptics

struct SymbolList: View {
    @ObservedObject var model: SymbolModel
    
    @State private var searchText = ""
    @State private var sortOrder: SortOrder = .defaultOrder
    @State private var showingDetails = false
    
    @State private var showingAudit = false
    
    private let layout = [
        GridItem(.adaptive(minimum: 100), alignment: .top)
    ]
    
    var pluralizer: String { filteredSymbols(searchText).count == 1 ? "" : "s" }
    @Binding var componet: Componets
    @Binding var imgs: Bool
    @State var image = UIImage(systemName: "xmark")
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    searchBar
                    HStack {
                        Text("\(filteredSymbols(searchText).count) symbol\(pluralizer)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                    }
                    LazyVGrid(columns: layout, spacing: 16) {
                        ForEach(filteredSymbols(searchText), id: \.self) { symbol in
                            Button(action: { select(symbol) }) {
                                SymbolCell(symbol: symbol, isFocused: false)
                                    .contextMenu {
                                        Button(action: {
                                            select(symbol)
                                        }) {
                                            Text("Enlarge")
                                            Image(systemName: "arrow.up.left.and.arrow.down.right")
                                        }
                                    }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .navigationBarTitle("SF Symbols", displayMode: .automatic)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Button(action: {
                            showingDetails = true
                        }) {
                            Text("Custom Image")
                                .font(Font.custom("Montserrat-SemiBold", size: 14.0))
                        }

                        Picker(selection: $sortOrder, label: Text("Sort")) {
                            ForEach(SortOrder.allCases, id: \.self) { order in
                                Text(order.rawValue).tag(order)
                                    .font(Font.custom("Montserrat-SemiBold", size: 14.0))
                            }
                        }
                    }
                    label: {
                        Image(systemName: "ellipsis.circle.fill")
                            .navButtonStyle()
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $showingDetails) {
            ImagePicker(image: $image)
                .onDisappear() {
                    showingDetails = false
                    imgs = false
                    componet.image = image?.pngData() ?? Data()
                }
        }
        .background(EmptyView()
                        .sheet(isPresented: $showingAudit) {
                            AuditResult(model: model, showingAudit: $showingAudit)
                        })
    }
    
    var searchBar: some View {
        HStack {
            TextField("Search", text: $searchText)
                .disableAutocorrection(true)
                .foregroundColor(Color.primary)
                .frame(height: 50)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                    UIApplication.shared.windows.first?.endEditing(true)
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(Font.body.bold())
                        .imageScale(.large)
                        .foregroundColor(Color.primary)
                }
                .pressableButton()
            }
        }
        .padding(.horizontal)
    }
    
    private func filteredSymbols(_ searchText: String) -> [Symbol] {
        return model.symbols(for: sortOrder, filter: searchText)
    }
    
    private func select(_ symbol: Symbol) {
        UIApplication.shared.windows.first?.endEditing(true)
        model.select(symbol)
        hapticBump()
        //showingDetails = true
        imgs.toggle()
        componet.text = symbol.name
    }
    
    private func hapticBump() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
}


