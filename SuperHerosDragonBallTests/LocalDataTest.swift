//
//  LocalDataTest.swift
//  SuperHerosDragonBallTests
//
//  Created by Natalia Camero on 4/3/24.
//

import XCTest
@testable import SuperHerosDragonBall

final class LocalDataTests: XCTestCase {
    static let tokenFake = "tokenFake"
    
    override func tearDownWithError() throws {
        LocalDataModel.deleteToken()
    }
    
    func testSaveToken() throws {
        LocalDataModel.save(token: LocalDataTests.tokenFake)
        let retrievedToken = LocalDataModel.getToken()
        XCTAssertEqual(retrievedToken, LocalDataTests.tokenFake, "Retrieved token should be equal to test one")
    }
    
    func testDeleteToken() throws {
        LocalDataModel.save(token: LocalDataTests.tokenFake)
        LocalDataModel.deleteToken()
        let retrievedToken = LocalDataModel.getToken()
        XCTAssertNil(retrievedToken, "There should be no token retrieved")
    }
}


