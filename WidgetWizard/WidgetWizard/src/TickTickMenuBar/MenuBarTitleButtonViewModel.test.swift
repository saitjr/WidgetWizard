//
//  MenuBarTitleButtonViewModel.test.swift
//  WidgetWizardTests
//
//  Created by tangjiarong on 2025/3/5.
//

import Foundation
import Testing


@Suite("isDateBetween")
struct TestForIsDateBetween {
    struct Input<T: Dateable> {
        let theDate: T
        let fromDate: T
        let toDate: T
    }
    
    struct TestCase {
        let input: Input<String>
        let output: Bool
    }
    
    static let stringCases = [
        TestCase(
            input: Input(theDate: "2025.02.05", fromDate: "2025.02.05", toDate: "2025.02.05"),
            output: false
        ),
        TestCase(
            input: Input(theDate: "2025.02.06", fromDate: "2025.02.06", toDate: "2025.02.06"),
            output: false
        )
    ]
    
    @Test(arguments: stringCases) func testForString(t: TestCase) {
        let got = isDateBetween(t.input.theDate, from: t.input.fromDate, to: t.input.toDate)
        #expect(got == t.output, "")
    }
    
    struct TestCaseOfDate {
        let input: Input<Date>
        let output: Bool
    }
    
    static let dateCases = [
        TestCaseOfDate(
            input: Input(
                theDate: Date(timeIntervalSinceNow: TimeInterval()),
                fromDate: Date(timeIntervalSinceNow: TimeInterval()),
                toDate: Date(timeIntervalSinceNow: TimeInterval())),
            output: false
        )
    ]
    
    @Test(arguments: dateCases) func testForDate(t: TestCaseOfDate) {
        let got = isDateBetween(t.input.theDate, from: t.input.fromDate, to: t.input.toDate)
        #expect(got == t.output, "")
    }
}
