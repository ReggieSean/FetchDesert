import XCTest
@testable import FetchDessertPkg

final class FetchDessertPkgTests: XCTestCase {
    func testDownloadDesserts()async{
        let session = URLSession.shared
        do{
            let (data, response) = try await session.data(from: APIManager.allMealAPI(catagory: "Dessert")!)
            guard let response = response as? HTTPURLResponse , response.statusCode >= 200 && response.statusCode < 400 else{
                throw APIError.requestError(url: "testDownload response")
            }
            XCTAssertTrue(response.statusCode == 200)
            print("data byte count: \(data.count)")
            //test the idMeal of "Apam balik" is 53049
            let testedID = 53049
            let decoder = JSONDecoder()
            //let response = try decoder.decode(Decodable.Type, from:data
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
    
    func testDownloadSingleDesert2(){
        let expectation = self.expectation(description: "Fetching dessert response")

        fetchDessertResponse { res  in
            switch res{
                case .success(let meals):
                    print(meals)
                case .failure(let err):
                    print(err.localizedDescription)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil) // Timeout in 10 seconds
    }
    func fetchDessertResponse(completion : @escaping(Result<[DetailMealModel], Error>) -> Void){
        URLSession.shared.dataTask(with: APIManager.mealPrep(mealID: 52768)!) { resData , response , error in
            if let error = error{
                completion(.failure(error))
                return
            }
            print("")
            guard let dat = resData else {
                completion(.failure(APIError.requestError(url: "response data is nil")))
                return
            }
            print("")
            
            guard let meals = try? JSONDecoder().decode(DetailMealResponse.self, from: dat)else {
                completion(.failure(APIError.decodeError(decodableType: String(describing:DetailMealModel.self))))
                return
            }
            print(meals.meals)
            completion(.success(meals.meals))
            
            
        }.resume()
    }
    
    func testDownloadSingleDessert() async{
        let session = URLSession.shared
        do{
            let (data, response) = try await session.data(from: APIManager.mealPrep(mealID: 52768)!)
            guard let response = response as? HTTPURLResponse , response.statusCode != 200 else{
                throw APIError.requestError(url:"testDownload response")
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
        let session = URLSession.shared
        do{
            let (data, response) = try await session.data(from: APIManager.mealPrep(mealID: testedID)!)
            guard let response = response as? HTTPURLResponse , response.statusCode >= 200 && response.statusCode < 400 else{
                throw APIError.requestError(url: "testDownload response")
            }
            XCTAssertTrue(response.statusCode == 200)
            print("data byte count: \(data.count)")
            let decoder = JSONDecoder()
            let mealResponse = try decoder.decode(DetailMealResponse.self, from: data)
            print(mealResponse)
            XCTAssertTrue(mealResponse.meals[0].id == testedID)
            //XCTAssertTrue(((mealResponse.meals[0].thumb)))
            //print(mealResponse.meals[0].mizanplas)
//            let imageURL = mealResponse.meals[0].imageSrc
//            let (imageData, imageResponse) = try await session.data(from:  imageURL!)
//            guard let response = imageResponse as? HTTPURLResponse , response.statusCode >= 200 && response.statusCode < 400 else{
//                throw APIError.responseCastError("testDownloadImage  response")
//            }
//            XCTAssertTrue(response.statusCode == 200)
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
        let session = URLSession.shared
        do{
            let (data, response) = try await session.data(from: APIManager.mealPrep(mealID: testedID)!)
            guard let response = response as? HTTPURLResponse , response.statusCode >= 200 && response.statusCode < 400 else{
                throw APIError.requestError(url:"testDownload response")
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
