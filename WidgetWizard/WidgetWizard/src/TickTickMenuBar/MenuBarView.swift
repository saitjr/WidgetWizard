//
//  MenuBarView.swift
//  WidgetWizard
//
//  Created by tangjiarong on 2025/1/21.
//

import SwiftUI



struct MenuBarView: View {
    @State private var items = [
        TodoItem(title: "完成项目文档", isCompleted: false),
        TodoItem(title: "修复已知问题", isCompleted: true),
        TodoItem(title: "添加新功能", isCompleted: false),
        TodoItem(title: "代码审查", isCompleted: false)
    ]
    
    var body: some View {
        List(items) { item in
            // HStack {
            //     Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
            //         .foregroundColor(item.isCompleted ? .green : .gray)
            //     Text(item.title)
            //         .strikethrough(item.isCompleted)
            //         .foregroundColor(item.isCompleted ? .gray : .primary)
            // }
            Text(item.title)
        }
        .listStyle(PlainListStyle())
        .frame(width: 200, height: 100)
        .background(Color.white)
        .offset(y: 0)
    }
}

#Preview {
    MenuBarView()
}
