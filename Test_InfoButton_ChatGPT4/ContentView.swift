//
//  ContentView.swift
//  Test_InfoButton_ChatGPT4
//
//  Created by Tom Flahive on 3/21/23.
//

import SwiftUI

struct ListItem: Identifiable {
    let id = UUID()
    let title: String
}

struct CustomRowView: View {
    let item: ListItem
    var onInfoButtonTap: (() -> Void)?
    var onRowTap: (() -> Void)?

    var body: some View {
        HStack {
            Text(item.title)
                .font(.headline)
            
            Spacer()
            
            Button(action: {
                onInfoButtonTap?()
            }) {
                Image(systemName: "info.circle")
                    .foregroundColor(.blue)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onRowTap?()
        }
    }
}



struct ContentView: View {
    let items: [ListItem] = [
        ListItem(title: "Item 1"),
        ListItem(title: "Item 2"),
        ListItem(title: "Item 3")
    ]

    var body: some View {
        NavigationView {
            List(items) { item in
                CustomRowView(item: item, onInfoButtonTap: {                    
                    print("Info button tapped for \(item.title)")
                }, onRowTap: {
                    print("Row tapped for \(item.title)")
                })
            }
            .navigationBarTitle("List with Info Buttons")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

