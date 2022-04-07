//
//  SwiftUIAPIView.swift
//  StoreDAYS
//
//  Created by admin on 4/1/22.
//

import SwiftUI
struct Course: Hashable, Codable{
    let ID:String
    let Name:String
    let Description:String
    let Cost:String
    let Catagory_ID:String
    let Img:String
    let Availability:String
}
class ViewModel: ObservableObject{
    @Published var courses:[ItemContainer]=[]
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
                let courses = try JSONDecoder().decode([ItemModels].self, from: data)
                var coursed:[ItemContainer]=[ItemContainer]()
                for Item in courses{
                    coursed.append(ItemContainer(Item: Item))
                }
                DispatchQueue.main.async {
                    self?.courses=coursed
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
                ForEach(viewModel.courses){
                    course in
                    HStack{
                
                        AsyncImage(url: URL(string: course.Item.Img)) { image in
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
                        NavigationLink("", destination:DetailView(data: course, kittenName: course.Name, isPurchased: false))



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
