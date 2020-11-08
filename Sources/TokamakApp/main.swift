import TokamakShim
import JavaScriptKit
import Foundation

struct TokamakApp: App {
    var body: some Scene {
        WindowGroup("Tokamak App") {
            ContentView()
        }
    }
}

struct Task: Identifiable {
    var id: String
    var title: String
    var completed: Bool
}

struct ContentView: View {
    @State
    var tasks: [Task] = [
        Task(id: "0", title: "掃除", completed: false),
    ]

    @State
    var title = ""

    var body: some View {
        VStack {
            List(tasks, id: \.id) { task in
                Text(task.title)
            }
            HStack {
                TextField("title", text: $title)
                Button(action: {
                    let task = Task(id: UUID().uuidString, title: title, completed: false)
                    tasks.append(task)
                    JSObject.global.alert?("追加したよ")
                    title = ""
                }) {
                    Text("追加")
                }
            }
        }
    }
}



// @main attribute is not supported in SwiftPM apps.
// See https://bugs.swift.org/browse/SR-12683 for more details.
TokamakApp.main()
