//
//  Magic_8_Ball_ProgrammaticallyTests.swift
//  Magic 8 Ball ProgrammaticallyTests
//
//  Created by Haamed Sultani on 9/27/18.
//  Copyright © 2018 Sultani. All rights reserved.
//

import XCTest
@testable import Magic_8_Ball_Programmatically

class Magic_8_Ball_ProgrammaticallyTests: XCTestCase {

    func testTopContainerText() {
        let topContainer : TopContainerView = TopContainerView()
        
        let topText = topContainer.appTitleTextView.text
        
        XCTAssertTrue(topText == "Ask Me Anything!")
    }

}
