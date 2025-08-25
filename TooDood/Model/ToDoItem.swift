import Foundation

struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
    var isCheck: Bool = false
}


class TodoViewModel: ObservableObject {
    @Published var todos: [TodoItem] = [
        
    ]
}
