import Foundation

struct TodoItem: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var isCheck: Bool = false
}

class TodoViewModel: ObservableObject {
    @Published var todos: [TodoItem] = [] {
        didSet {
            saveTodos()
        }
    }
    
    private let key = "todos_list"
    
    init() {
        loadTodos()
    }
    
    private func saveTodos() {
        if let data = try? JSONEncoder().encode(todos) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    private func loadTodos() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([TodoItem].self, from: data) {
            todos = decoded
        }
    }
}
