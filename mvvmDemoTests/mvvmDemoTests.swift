//
//  mvvmDemoTests.swift
//  mvvmDemoTests
//
//  Created by hao yin on 2018/9/1.
//  Copyright © 2018年 hao yin. All rights reserved.
//

import XCTest
@testable import mvvmDemo
class mvvmDemoTests: XCTestCase{
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let m = VCViewModel()
        m.request(i: 1)
        let e = XCTestExpectation(description: "time out");
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(5)) {
            XCTAssertTrue(m.i == "1 h")
            XCTAssertTrue(m.str == "1 s")
            e.fulfill()
        }
        self.wait(for: [e], timeout: 100)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
