import Foundation
let baseUrl = "http://localhost/PHP/ReviewModel.php"
    func handleResponse(completion: @escaping (Result<UserData, Error>) -> Void ){
                      guard let url = URL(string: baseUrl+endPoint) else{
            completion(.failure(NetworkingError.badUrl))
            return
        }
        var request = URLRequest(url: url)
        do{
            let loginData = try JSONEncoder().encode(LoginObj)
            request.httpBody = loginData
        }catch{
            completion(.failure(NetworkingError.badEncoding))
            
        }
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        handleResponse(for: request, completion: completion)
        
    

        let session = URLSession.shared
        let task = session.dataTask(with: request){(data, response, error) in
            DispatchQueue.main.async {
                guard let unwrappedResponse = response as? HTTPURLResponse else {
                    completion(.failure(NetworkingError.badResponse))
                    return
                }
                print(unwrappedResponse.statusCode)
                switch unwrappedResponse.statusCode{
                case 200 ..< 300:
                    print("success")
                default:
                    print("failure")
                }
                if let unwrappedError = error {
                    completion(.failure(unwrappedError))
                    return
                }
                if let unwrappedData = data {
                    do{
                        let json = try JSONSerialization.jsonObject(with: unwrappedData, options:[])
                        print(json)
                        if let user = try? JSONDecoder().decode(UserData.self, from: unwrappedData){
                            completion(.success(user))
                        }else{
                            let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: unwrappedData)
                            completion(.failure(errorResponse))
                        }
                    }catch{
                        completion(.failure(error))
                    }
                }
            }
            
        }
        task.resume()