import Foundation
import ScannerServerCore
import Testing

@Suite("Work directory layout")
struct WorkDirectoryLayoutTests {
    @Test("Missing or unknown values default to flat")
    func defaultsToFlat() {
        #expect(WorkDirectoryLayout.from(environment: [:]) == .flat)
        #expect(WorkDirectoryLayout.from(environment: ["SCAN_WORK_DIRECTORY_LAYOUT": ""]) == .flat)
        #expect(WorkDirectoryLayout.from(environment: ["SCAN_WORK_DIRECTORY_LAYOUT": "Grouped!"]) == .flat)
        #expect(WorkDirectoryLayout.from(environment: ["SCAN_WORK_DIRECTORY_LAYOUT": "FLAT"]) == .flat)
    }

    @Test("grouped is selected case-insensitively")
    func groupedSelection() {
        #expect(WorkDirectoryLayout.from(environment: ["SCAN_WORK_DIRECTORY_LAYOUT": "grouped"]) == .grouped)
        #expect(WorkDirectoryLayout.from(environment: ["SCAN_WORK_DIRECTORY_LAYOUT": "Grouped"]) == .grouped)
    }
}