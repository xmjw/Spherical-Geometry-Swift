import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Spherical_Geometry_SwiftTests.allTests),
    ]
}
#endif
