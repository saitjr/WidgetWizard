//
//  MenuBarTitleButtonViewModel.swift
//  WidgetWizard
//
//  Created by tangjiarong on 2025/3/4.
//

import Foundation

struct MenuBarTitleButtonModel {
    var title: String?
    var imageName: String?
    
    init(title: String?, imageName: String?) {
        self.title = title
        self.imageName = imageName
        
        if self.title == nil && self.imageName == nil {
            self.title = "暂无事项"
            
        }
    }
}

struct MenuBarTitleButtonViewModel {
    var todoList: Array<String>
    var imageName: String?
}

extension MenuBarTitleButtonViewModel {
    
    
    func fetchTasks() async {
        do {
            let tickTickAPI = TickTickAPI()
            let tasks = try await tickTickAPI.fetchTaskList()
            
//            // 过滤今天的任务
//            let todayTasks = tasks.filter {
//                MenuBarTitleButtonViewModel.isToday($0.startDate) || MenuBarTitleButtonViewModel.isToday($0.endDate)
//            }
//            
//            todoList = todayTasks.map { task in
//                task.title
//            }
//            
//            imageName = todoList.isEmpty ? "checkmark.circle" : "exclamationmark.circle"
            
        } catch {
            print("Error fetching tasks: \(error)")
            // 这里可以添加错误处理逻辑
        }
    }
    
    
}

func isDateBetween<T: Dateable>(_ theDate: T, from fromDate: T, to toDate: T) -> Bool {
    // 被判断的日期为空，则直接返回 false
    guard let theDateAsDate = theDate.asDate() else {
        return false
    }
    
    let fromDateAsDate = fromDate.asDate()
    let toDateAsDate = toDate.asDate()
    
    if fromDateAsDate == nil && toDateAsDate == nil {
        return false
    }
    
    // 如果起始日期不为空，结束日期为空，则 theDate 只需要 > 起始日期即可
    if fromDateAsDate != nil && toDateAsDate == nil {
        return theDateAsDate >= fromDateAsDate!
    }
    
    // 如果起始日期为空，结束日期不为空，则 theDate 只需要 < 结束日期即可
    if fromDateAsDate == nil && toDateAsDate != nil {
        return theDateAsDate <= toDateAsDate!
    }
    
    return theDateAsDate <= toDateAsDate! && theDateAsDate >= fromDateAsDate!
}

protocol Dateable {
    func asDate() -> Date?
}

extension String: Dateable {
    func asDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        return dateFormatter.date(from: self)
    }
}

extension Date: Dateable {
    func asDate() -> Date? {
        return self
    }
}
