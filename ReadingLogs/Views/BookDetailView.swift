//
//  BookDetailView.swift
//  ReadingLogs
//
//  Created by Martin Wainaina on 28/01/2024.
//

import SwiftUI

struct BookDetailView: View {
    
    let book: Book
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var isEditing = false
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var publishedYear: Int? = nil
    
    // initialize values
    init(book: Book){
        self.book = book
        self._title = State.init(initialValue: book.title)
        self._author = State.init(initialValue: book.author)
        self._publishedYear = State.init(initialValue: book.publishedYear)
    }
    
    var body: some View {
        Form{
            if isEditing {
                Group {
                    TextField("Book title", text: $title)
                    TextField("Book author", text: $author)
                    TextField("Book published year", value: $publishedYear, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
                .textFieldStyle(.roundedBorder)
            }
            else{
                Text(book.title)
                Text(book.author)
                Text(book.publishedYear.description)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button( isEditing ? "Done" :
                "Edit"){
                    isEditing.toggle()
                }
            }
        }
        .navigationTitle("Book Details")
    }
}

//#Preview {
//    BookDetailView()
//}
