//
//  ColorDescriptionView.swift
//  SkiCalendar
//
//  Created by Gage Halverson on 3/7/23.
//
import SwiftUI

struct ColorDescriptionView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ColorDescription.id, ascending: true)],
        animation: .default
    )
    private var items: FetchedResults<ColorDescription>

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    SquareColorPickerView(
                        color: Binding(
                            get: {
                                item as ColorDescription
                            }, set: {
                                print("set to \($0)")
                            }
                        ))
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle(
                Text("Testing")
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            _ = ColorDescription(color: .red, context: viewContext)
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate.
                // You should not use this function in a shipping application, although it may
                // be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate.
                // You should not use this function in a shipping application, although it may
                // be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ColorDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        ColorDescriptionView()
            .environment(
                \.managedObjectContext,
                PersistenceController.preview.container.viewContext
            )
    }
}
