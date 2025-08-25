import SwiftUI

struct ListScreen: View {
    @StateObject  var viewModel = TodoViewModel()
    @State  var newTodoText: String = ""
    @State  var showToast = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer().frame(height: 20)
                
                HStack {
                    Text("ToDood List")
                        .font(.title)
                        .fontWeight(.bold)
                    Image("todoList")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                
                // TextField + Button
                ZStack(alignment: .trailing) {
                    TextField("Add ToDo", text: $newTodoText)
                        .padding()
                        .frame(height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(30)
                    
                    Button(action: addTodo) {
                        ZStack {
                            Circle()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.orange)
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                                .imageScale(.large)
                                .bold()
                        }
                    }
                    .padding(.leading)
                }
                .padding(.horizontal, 20)
                
                // List view
                ToDoList(viewModel: viewModel)
                
                Spacer()
            }
            
            if showToast {
                VStack {
                    Spacer()
                    Text("Todo Added")
                        .padding()
                        .background(Color.gray.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.bottom, 40)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                .animation(.easeInOut, value: showToast)
            }
        }
    }
    
    // Add todo action
    func addTodo() {
        guard !newTodoText.isEmpty else { return }
        viewModel.todos.append(TodoItem(title: newTodoText))
        newTodoText = ""
        
        withAnimation {
            showToast = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                showToast = false
            }
        }
    }
}

#Preview {
    ListScreen()
}
