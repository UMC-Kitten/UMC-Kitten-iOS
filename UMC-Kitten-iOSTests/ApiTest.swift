//
//  ApiTest.swift
//  UMC-Kitten-iOSTests
//
//  Created by DOYEON LEE on 2/13/24.
//

@testable import UMC_Kitten_iOS
import XCTest

final class ApiTest: XCTestCase {
    
    let repository = MypageRemoteRepository()

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {

    }

    func testExample() throws {
        let expectation = XCTestExpectation(description: "api test")
        
        if let image = UIImage(named: "cat-sample"), let imageData = image.jpegData(compressionQuality: 1.0) {
            print("시작")
            print(imageData)
            repository.changeProfileImage(image: imageData){ result, error in
                print("통신 완료!")
                
//                if let data = result?.data {
//                    do {
//                        // 데이터를 딕셔너리로 디코딩
//                        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
//                            print("Failed to convert data to dictionary")
//                            return
//                        }
//                        print(dictionary)
//                    } catch {
//                        print("Failed to decode data:", error)
//                    }
//                }
                
                print(result)
                print(error)
                XCTAssertNotNil(result)
                XCTAssertNil(error)
                
                expectation.fulfill()
        }


        }

        wait(for: [expectation], timeout: 10) // 최대 대기 시간 설정
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
