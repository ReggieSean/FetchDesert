import XCTest
@testable import FetchDessertPkg

final class FetchDessertPkgTests: XCTestCase {
    func testDownloadDesserts()async{
        let apimanger = APIManager.shared
        let session = URLSession.shared
        do{
            let (data, response) = try await session.data(from: apimanger.allMealAPI(catagory: "Dessert")!)
            guard let response = response as? HTTPURLResponse , response.statusCode >= 200 && response.statusCode < 400 else{
                throw APIError.responseCastError("testDownload response")
            }
            XCTAssertTrue(response.statusCode == 200)
            print("data byte count: \(data.count)")
            return
        } catch let Error{
            print(Error.localizedDescription)
        }
        XCTAssertTrue(false)
    }
    
    func testDownloadSingleDessert() async{
        let apimanger = APIManager.shared
        let session = URLSession.shared
        do{
            let (data, response) = try await session.data(from: apimanger.mealPrep(mealID: 52768)!)
            guard let response = response as? HTTPURLResponse , response.statusCode >= 200 && response.statusCode < 400 else{
                throw APIError.responseCastError("testDownload response")
            }
            XCTAssertTrue(response.statusCode == 200)
            print("data byte count: \(data.count)")
            return
        } catch let Error{
            print(Error.localizedDescription)
        }
        XCTAssertTrue(false)
    }
    
}
