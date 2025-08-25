import SwiftUI

struct ToDoList: View {
    @ObservedObject var viewModel: TodoViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($viewModel.todos) { $todo in
                    HStack {
                        
                        Text(todo.title)
                            .font(.headline)
                        
                        Spacer()
                        
                        Image(systemName: todo.isCheck ? "checkmark.circle.fill" : "circle" )
                            .foregroundStyle(todo.isCheck ? .orange : .gray)
                            .onTapGesture{
                                todo.isCheck.toggle()
                            }
                        
                        
                    }
                    .padding(.vertical, 6)
                }
                .onDelete { indexSet in
                    viewModel.todos.remove(atOffsets: indexSet)
                }
            }
            
        }
    }
}

#Preview {
    ToDoList(viewModel: TodoViewModel())
}

