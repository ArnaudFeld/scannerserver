import Foundation

/// Private scan-workspace layout.
///
/// `flat` keeps one `.scan-work.<UUID>` directory per scan directly in the output
/// directory (compatibility default). `grouped` nests every scan's workspace under
/// a persistent `.scan-work/` directory, with `.ocr-work/` and `.pdf-import-work/`
/// as sibling containers, so ingest tools can ignore the whole subtree with a
/// single rule.
public enum WorkDirectoryLayout: String, Sendable, Equatable {
    case flat
    case grouped

    /// Layout selected by `SCAN_WORK_DIRECTORY_LAYOUT`.
    /// Unknown or empty values fall back to `flat` to keep the compatibility default.
    public static func from(environment: [String: String]) -> WorkDirectoryLayout {
        switch environment["SCAN_WORK_DIRECTORY_LAYOUT"]?
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .lowercased() {
        case "grouped": return .grouped
        default: return .flat
        }
    }
}