//
//  ContentViewModelTests.swift
//  Art-Inspector
//
//  Created by Swapna Dirisala on 7/30/25.
//

import XCTest
@testable import Art_Inspector

final class ContentViewModelTests: XCTestCase {
    
    func testHandleDropAddsURLs() {
        let viewModel = ContentViewModel()
        let bundle = Bundle(for: ContentViewModelTests.self)
        guard let testURL = bundle.url(forResource: "file", withExtension: "png") else {
            XCTFail("Test resource not found")
            return
        }
        viewModel.handleDrop([testURL])
        XCTAssertEqual(viewModel.droppedURLs.count, 1)
    }
}
