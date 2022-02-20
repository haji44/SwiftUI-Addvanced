//
//  ContentView.swift
//  CoreDatawithSwiftUI
//
//  Created by kitano hajime on 2022/02/20.
//

import SwiftUI

struct ToDoListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var todoItem: FetchedResults<TodoItem>
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(todoItem) {item in
                        Text(item.name ?? "unknown")
                        //                        NavigationLink(destination: ItemDetailView(item: item)) {
                        //                            ItemCell(item: item)
                    }
                    
                    //                    .onDelete(perform: self.deleteItem)
                }//: LIST
                .listStyle(.plain)
                
                ItemButton()
                    .onTapGesture {
                        
                        // create new instance
                        let newItem = TodoItem(context: moc)
                        newItem.name = "Write a new article"
                        newItem.detail = "Reserch about new"
                        
                        try? moc.save()
                    }
            }//: VSTACK
            .navigationTitle("Item List")
            .navigationViewStyle(.automatic)
        } //: NAVIGATION
        
    } //: BODY
    
    //delete item to retrieve the indexset
    fileprivate func deleteItem(at offset: IndexSet) {
//        self.todoItem.remove(atOffsets: offset)
    }
}
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ToDoListView()
        }
    }
