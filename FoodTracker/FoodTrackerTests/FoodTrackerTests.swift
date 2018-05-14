//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by SQIMI_VM on 10/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //    MARK: mealInitTest
//    funcs must have "test" first
    
    func testMealInitSuccess(){
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        let highRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(highRatingMeal)
    }
    
    func testMealInitFail(){
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        let noNameMeal = Meal.init(name: "", photo: nil, rating: 2)
        XCTAssertNil(noNameMeal)
        
        let muchRatingMeal = Meal.init(name: "Good", photo: nil, rating: 10)
        XCTAssertNil(muchRatingMeal)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
