//
//  ImageToServerSwiftUIView.swift
//  StoreDAYS
//
//  Created by admin on 4/3/22.
//

import SwiftUI

struct ImageToServerSwiftUIView: View {
    //show image picker
    @State var showImagePicker: Bool = false
    //show select image
    @State var selectedImage: Image? = Image("")
    var body: some View {
        VStack{
            Button(action: { self.showImagePicker.toggle()}, label: {Text("Select image")})
            
            //show image selected
            self.selectedImage?.resizable().scaledToFit()
            //show button to upload
            Button(action: {
                //conver image to base 64
                let uiImage: UIImage = self.selectedImage.asUIImage()
                let imageData: Foundation.Data = uiImage.jpegData(compressionQuality: 0.1) ?? Foundation.Data()
                let imageStr: String = imageData.base64EncodedString()
                
                //send request to server
                guard let url : Foundation.URL = Foundation.URL(string: "URL") else{
                    print("invalid URL")
                    return
                }
                //create parameters
                let paramStr: String = "image=\(imageStr)"
                let paramData: Foundation.Data = paramStr.data(using: .utf8) ?? Foundation.Data()
              
                var urlRequest: Foundation.URLRequest = Foundation.URLRequest(url: url)
                urlRequest.httpMethod = "POST"
                urlRequest.httpBody = paramData
                //require for large data
                urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                //send request
                URLSession.shared.dataTask(with: urlRequest, completionHandler: {
                    (data, response, error) in
                    guard let data = data else{
                        print("invalid data")
                        return
                    }
                    let responseStr: String = String(data:data, encoding: .utf8) ?? ""
                    print(responseStr)
                }
                )
                    .resume()
            }, label: {Text("Upload image")})
        }
        .sheet(isPresented: $showImagePicker, content: {
            ImagePicker(image: self.$selectedImage)
        })
        }
}

struct ImageToServerSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ImageToServerSwiftUIView()
    }
}
