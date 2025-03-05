//
//  TickTickRequester.swift
//  WidgetWizard
//
//  Created by tangjiarong on 2025/3/4.
//

import Foundation

struct TickTickTask: Codable {
    let id: String /// "67b85d82455591b62de72f71"
    let projectId: String /// "64b52a118d721169c51ce757"
    let sortOrder: Int /// -9151314442947379272
    let title: String /// "热修 | 兼容暂停放量的场景"
    let content: String /// ""
    let desc: String /// ""
    let startDate: String /// "2025-03-03T12:45:00.000+0000"
    let dueDate: String /// "2025-03-03T13:15:00.000+0000"
    let timeZone: String /// "Asia/Shanghai"
    let isFloating: Bool /// false
    let isAllDay: Bool /// false
    let reminders: [Reminder]
    let exDate: [String] /// []
    let completedTime: String /// "2025-03-03T13:14:03.000+0000"
    let completedUserId: Int /// 1016734929
    let priority: Int /// 0
    let status: Int /// 2
    let items: [String] /// []
    let progress: Int /// 0
    let modifiedTime: String /// "2025-03-03T13:14:03.000+0000"
    let etag: String /// "opr7akq1"
    let deleted: Int /// 0
    let createdTime: String /// "2025-02-21T11:03:30.000+0000"
    let creator: Int /// 1016734929
    let attachments: [String] /// []
    let commentCount: Int /// 0
    let focusSummaries: [String] /// []
    let columnId: String /// "64b52a4d83741169c51cfa45"
    let kind: String /// "TEXT"
    let imgMode: Int /// 0
}

struct Reminder: Codable {
    let id: String /// "67b85d82454151b62de72f72"
    let trigger: String /// "TRIGGER:PT0S"
}

struct TickTickAPI {}

extension TickTickAPI {
    
    func fetchTaskList() async throws -> [TickTickTask] {
        let filePath = "/Users/tangjiarong/Documents/WidgetWizard/WidgetWizard/WidgetWizard/src/Package/API/TickTick/mock.json"
        guard let fileURL = URL(string: filePath) else {
            throw URLError(.badURL)
        }
        
        let jsonData = try Data(contentsOf: fileURL)
        let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
        
        guard let syncTaskBean = json?["syncTaskBean"] as? [String: Any],
              let updateArray = syncTaskBean["update"] as? [[String: Any]] else {
            throw NSError(domain: "TickTickAPI", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid JSON structure"])
        }
        
        let decoder = JSONDecoder()
        return try updateArray.map { taskDict in
            let taskData = try JSONSerialization.data(withJSONObject: taskDict, options: [])
            return try decoder.decode(TickTickTask.self, from: taskData)
        }
    }
}
