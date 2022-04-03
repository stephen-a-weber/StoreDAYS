//
//  SwiftUIAPIView.swift
//  StoreDAYS
//
//  Created by admin on 4/1/22.
//

import SwiftUI
struct Course: Hashable, Codable{
    let Name:String
    let Img:String
    let Cost:String
    let Catagory_ID:String
}
class ViewModel: ObservableObject{
    @Published var courses:[Course]=[]
    func fetch(){
        guard let url = URL(string: "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/getItems.php") else{
            print("error")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else{
                print("error")
                return
            }
            //convert to jso
            do{
                let courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self?.courses=courses
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}

struct SwiftUIAPIView: View {
    @StateObject var viewModel=ViewModel()
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.courses, id: \.self){
                    course in
                    HStack{
                
                        AsyncImage(url: URL(string: course.Img)) { image in
                                                    image.resizable()
                                                } placeholder: {
                                                    Color.red
                                                }
                                                .frame(width: 128, height: 128)
                                                .clipShape(RoundedRectangle(cornerRadius: 25))

                        Text(course.Name)
                            .bold()
                        Text(String(course.Cost))
                        Text(String(course.Catagory_ID))
                        


                    }
                    .padding(3)
                }
            }
            .navigationTitle("Pets")
            .onAppear{
                viewModel.fetch()
            }
        }
        
    }
}

struct SwiftUIAPIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIAPIView()
    }
}
