//
//  itemList.swift
//  WeatherAppSwiftUI
//
//  Created by Parvesh Chauhan on 06/01/25.
//

import Foundation

import SwiftUI

struct GroceryItem: Identifiable {
    let id = UUID()
    var name: String
    var isPurchased: Bool = false
}

class GroceryViewModel: ObservableObject {
    @Published var items: [GroceryItem] = [
        GroceryItem(name: "Apples"),
                GroceryItem(name: "Bananas"),
                GroceryItem(name: "Carrots"),
                GroceryItem(name: "Potatoes"),
                GroceryItem(name: "Tomatoes"),
                GroceryItem(name: "Onions"),
                GroceryItem(name: "Garlic"),
                GroceryItem(name: "Milk"),
                GroceryItem(name: "Bread"),
                GroceryItem(name: "Eggs"),
                GroceryItem(name: "Cheese"),
                GroceryItem(name: "Butter"),
                GroceryItem(name: "Chicken"),
                GroceryItem(name: "Fish"),
                GroceryItem(name: "Rice"),
                GroceryItem(name: "Pasta"),
                GroceryItem(name: "Flour"),
                GroceryItem(name: "Sugar"),
                GroceryItem(name: "Salt"),
                GroceryItem(name: "Pepper"),
                GroceryItem(name: "Coffee"),
                GroceryItem(name: "Tea"),
                GroceryItem(name: "Yogurt"),
                GroceryItem(name: "Cereal"),
                GroceryItem(name: "Orange Juice")
        
    ]
    
    func addItem(name: String) {
        guard !name.isEmpty else { return }
        items.append(GroceryItem(name: name))
    }
    
    func togglePurchased(item: GroceryItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isPurchased.toggle()
        }
    }
}

struct GroceryListView: View {
    @StateObject private var viewModel = GroceryViewModel()
    @State private var newItemName: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Add New Item Section
                HStack {
                    TextField("Add new item", text: $newItemName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    Button(action: {
                        viewModel.addItem(name: newItemName)
                        newItemName = ""
                    }) {
                        Text("Add")
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding(.bottom)
                
                // Grocery Items List
                List {
                    ForEach(viewModel.items) { item in
                        HStack {
                            Text(item.name)
                                .strikethrough(item.isPurchased)
                                .foregroundColor(item.isPurchased ? .gray : .black)
                            Spacer()
                            Button(action: {
                                viewModel.togglePurchased(item: item)
                            }) {
                                Image(systemName: item.isPurchased ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isPurchased ? .green : .gray)
                            }
                        }
                    }
                }
            }
            .vwoTagScreenName(screenName: "Grocery list")
            .navigationTitle("Grocery List")
        }
    }
}

struct GroceryListView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryListView()
    }
}
