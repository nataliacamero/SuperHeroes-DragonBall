////
////  SuperHerosDragonBallTests.swift
////  SuperHerosDragonBallTests
////
////  Created by Natalia Camero on 3/3/24.
////
//
//import XCTest
//@testable import SuperHerosDragonBall
//
//final class NetworkModelTests: XCTestCase {
//    private var sut: NetworkModel!
//    private var client: APIClientProtocol!
//    private var expectedToken = "some JWT token"
//    
//    override func setUp() {
//        super.setUp()
//        let configuration = URLSessionConfiguration.ephemeral
//        configuration.protocolClasses = [MockURLProtocol.self]
//        let session = URLSession(configuration: configuration)
//        LocalDataModel.save(token: expectedToken)
//        client = APIClient(session: session)
//        sut = NetworkModel(client: client)
//    }
//    
//    override func tearDown() {
//        super.tearDown()
//        LocalDataModel.deleteToken()
//        client = nil
//        sut = nil
//    }
//    
//    func testLogin() throws {
//        let data = try XCTUnwrap(expectedToken.data(using: .utf8))
//        let (user, password) = ("nataliacameroc@gmail.com", "Nc123456")
//        MockURLProtocol.error = nil
//        MockURLProtocol.requestHandler = { request in
//            let loginString = String(format: "%@:%@", user, password)
//            let loginData = loginString.data(using: String.Encoding.utf8)!
//            let base64LoginString = loginData.base64EncodedString()
//            XCTAssertEqual(request.httpMethod, "POST")
//            XCTAssertEqual(request.value(forHTTPHeaderField: "Authorization"), "Basic \(base64LoginString)")
//            let response = try XCTUnwrap(
//                HTTPURLResponse(
//                    url: .init(string: "https://dragonball.keepcoding.education/")!,
//                    statusCode: 200,
//                    httpVersion: nil,
//                    headerFields: ["Content-Type": "application/json"]
//                )
//            )
//            return (response, data)
//        }
//        let expectation = expectation(description: "Login success")
//        var receivedToken: String?
//        sut.login(user: user, password: password) { result in
//            guard case let .success(token) = result else {
//                XCTFail("Expected success but received \(result)")
//                return
//            }
//            expectation.fulfill()
//            receivedToken = token
//        }
//        
//        wait(for: [expectation], timeout: 1)
//        XCTAssertNotNil(receivedToken, "should have received a token")
//        XCTAssertNotEqual(receivedToken, expectedToken)
//    }
//    
//    func testLoginError() throws {
//        MockURLProtocol.error = .malformedUrl
//        
//        let expectation = expectation(description: "Login error")
//        sut.login(user: "", password: "") { result in
//            guard case .failure(.malformedUrl) = result else {
//                XCTFail("Expected malformed URL but received \(result)")
//                return
//            }
//            expectation.fulfill()
//        }
//        
//        wait(for: [expectation], timeout: 2)
//    }
//    
//    func testGetHeroes() throws {
//        let expectedResponse = """
//        [{"favorite":false,"name":"Maestro Roshi","photo":"https://cdn.alfabetajuega.com/alfabetajuega/2020/06/Roshi.jpg?width=300","id":"14BB8E98-6586-4EA7-B4D7-35D6A63F5AA3","description":"Es un maestro de artes marciales que tiene una escuela, donde entrenará a Goku y Krilin para los Torneos de Artes Marciales. Aún en los primeros episodios había un toque de tradición y disciplina, muy bien representada por el maestro. Pero Muten Roshi es un anciano extremadamente pervertido con las chicas jóvenes, una actitud que se utilizaba en escenas divertidas en los años 80. En su faceta de experto en artes marciales, fue quien le enseñó a Goku técnicas como el Kame Hame Ha"}]
//        """
//        let data = try XCTUnwrap(expectedResponse.data(using: .utf8))
//        MockURLProtocol.error = nil
//        MockURLProtocol.requestHandler = { request in
//            XCTAssertEqual(request.httpMethod, "POST")
//            XCTAssertEqual(request.value(forHTTPHeaderField: "Authorization"), "Bearer \(self.expectedToken)")
//            let response = try XCTUnwrap(
//                HTTPURLResponse(
//                    url: .init(string: "https://dragonball.keepcoding.education")!,
//                    statusCode: 200,
//                    httpVersion: nil,
//                    headerFields: ["Content-Type": "application/json"]
//                )
//            )
//            return (response, data)
//        }
//        let expectation = expectation(description: "Get heroes success")
//        var receivedHeroes = [Hero]()
//        sut.getHeroes { result in
//            guard case let .success(heroes) = result else {
//                XCTFail("Expected success but received \(result)")
//                return
//            }
//            receivedHeroes = heroes
//            expectation.fulfill()
//        }
//        
//        wait(for: [expectation], timeout: 1)
//        XCTAssertFalse(receivedHeroes.isEmpty)
//        XCTAssertEqual(receivedHeroes.first?.name, "Maestro Roshi")
//    }
//    
//}
//
//final class MockURLProtocol: URLProtocol {
//    static var error: NetworkError?
//    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?
//    
//    override class func canInit(with request: URLRequest) -> Bool {
//        return true
//    }
//    
//    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
//        return request
//    }
//    
//    override func startLoading() {
//        if let error = MockURLProtocol.error {
//            client?.urlProtocol(self, didFailWithError: error)
//            return
//        }
//        
//        guard let handler = MockURLProtocol.requestHandler else {
//            assertionFailure("Received unexpected request with no handler set")
//            return
//        }
//        
//        do {
//            let (response, data) = try handler(request)
//            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
//            client?.urlProtocol(self, didLoad: data)
//            client?.urlProtocolDidFinishLoading(self)
//        } catch {
//            client?.urlProtocol(self, didFailWithError: error)
//        }
//    }
//    
//    override func stopLoading() {
//        
//    }
//}
//
