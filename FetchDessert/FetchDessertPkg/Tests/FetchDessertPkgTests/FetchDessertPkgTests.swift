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
            //test the idMeal of "Apam balik" is 53049
            let testedID = 53049
            let decoder = JSONDecoder()
            let mealResponse = try decoder.decode(MealResponse.self, from: data)
            let meal = mealResponse.meals.first{ meal in
                return meal.strMeal == "Apam balik"
            }
            XCTAssertTrue(meal?.id == testedID)
            if let thumb = meal?.strMealThumb{
                print(thumb)
            }
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
    
    func testDownloadSingleDessertImage() async{
        let testedID = 52768
        //let testedImageURL = "https:\/\/www.themealdb.com\/images\/media\/meals\/1549542877.jpg"
        let apimanger = APIManager.shared
        let session = URLSession.shared
        do{
            let (data, response) = try await session.data(from: apimanger.mealPrep(mealID: testedID)!)
            guard let response = response as? HTTPURLResponse , response.statusCode >= 200 && response.statusCode < 400 else{
                throw APIError.responseCastError("testDownload response")
            }
            XCTAssertTrue(response.statusCode == 200)
            print("data byte count: \(data.count)")
            let decoder = JSONDecoder()
            let mealResponse = try decoder.decode(DetailMealResponse.self, from: data)
            XCTAssertTrue(mealResponse.meals[0].id == testedID)
            XCTAssertTrue(((mealResponse.meals[0].mealThumb) != nil))
            
            print(mealResponse.meals[0].mizanplas)
            let imageURL = mealResponse.meals[0].mealThumb
            let (imageData, imageResponse) = try await session.data(from:  imageURL!)
            guard let response = imageResponse as? HTTPURLResponse , response.statusCode >= 200 && response.statusCode < 400 else{
                throw APIError.responseCastError("testDownloadImage  response")
            }
            XCTAssertTrue(response.statusCode == 200)
            //XCTAssertTrue(mealResponse.meals[0].strImageSource == testedImageURL)
            return
        } catch let Error{
            print(Error)
        }
        XCTAssertTrue(false)
    }
    
    func testCastWithNilValues() async{
        let testedID = 52990 // item with weird cast error
        //let testedImageURL = "https:\/\/www.themealdb.com\/images\/media\/meals\/1549542877.jpg"
        let apimanger = APIManager.shared
        let session = URLSession.shared
        do{
            let (data, response) = try await session.data(from: apimanger.mealPrep(mealID: testedID)!)
            guard let response = response as? HTTPURLResponse , response.statusCode >= 200 && response.statusCode < 400 else{
                throw APIError.responseCastError("testDownload response")
            }
            XCTAssertTrue(response.statusCode == 200)
            print("data byte count: \(data.count)")
            let decoder = JSONDecoder()
            let mealResponse = try decoder.decode(DetailMealResponse.self, from: data)
            XCTAssertTrue(mealResponse.meals[0].id == testedID)
            print("meal Response",mealResponse)
           
            //XCTAssertTrue(mealResponse.meals[0].strImageSource == testedImageURL)
            return
        } catch let Error{
            print(Error)
        }
        XCTAssertTrue(false)
    }
    
    
    
}
