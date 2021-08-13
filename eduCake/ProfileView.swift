

import SwiftUI

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


struct ProfileView: View {
    
    @StateObject var model = ModelData()

    @State var index = 0
    
    @State var expandCompleted = false
    
    @State var expandProgress = false
    
    
    var body: some View{
        
        VStack{
            
            HStack(spacing: 15){
                
//                Button(action: {
//
//
//                }) {
//
//                    Image(systemName: "chevron.left")
//                        .font(.system(size: 22))
//                        .foregroundColor(.black)
//                }
                
                Text("Profile")
                    .font(.title)
                
                Spacer(minLength: 0)
                
                Button(action: {
                    
                }) {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
            
            HStack{
                
                VStack(spacing: 0){
                    
                    Rectangle()
                    .fill(Color.black)
                    .frame(width: 80, height: 3)
                    .zIndex(1)
                    
                    
                    // going to apply shadows to look like neuromorphic feel...
                    
                    Image("profile")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding(.top, 6)
                    .padding(.bottom, 4)
                    .padding(.horizontal, 8)
                    .background(Color("Color1"))
                    .cornerRadius(10)
//                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
//                    .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
//
                    
                }
                
                VStack(alignment: .leading, spacing: 12){
                    
                    Text("Van Hoang")
                        .font(.title)
                        .foregroundColor(Color.white)
                    
                    Text("Student")
                        .foregroundColor(Color.white)
                        .padding(.top, 8)
                    
                    Text("hoangvan28905@gmail.com")
                        .foregroundColor(Color.white)
                }
                .padding(.leading, 20)
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            

            
            // Cards...
            
            HStack(spacing: 20){
                
                VStack(spacing: 12){
                    
                    VStack(alignment: .leading,spacing: 18,content: {
                    
                        HStack{
                            
                            Text("Completed").fontWeight(.heavy).foregroundColor(.white)
                            
                            Image(systemName: expandCompleted ? "chevron.up" : "chevron.down").resizable().frame(width: 20, height: 10).foregroundColor(.white)
                            
                        }.onTapGesture {
                            
                            self.expandCompleted.toggle()
                        }
                        
                        if expandCompleted{
                            
                            Button(action: {
                                
                                print("1")
                                self.expandCompleted.toggle()
                                
                            }) {
                                
                                Text("Physic 10")
                                
                            }.foregroundColor(.white)
                            
                            Button(action: {
                                
                                print("2")
                                self.expandCompleted.toggle()
                                
                            }) {
                                
                                Text("Computer Science")
                                
                            }.foregroundColor(.white)
                            
                            Button(action: {
                                
                                print("3")
                                self.expandCompleted.toggle()
                                
                            }) {
                                
                                Text("Algebra 10")
                                
                            }.foregroundColor(.white)
                              
                        }
                        
                        
                        
                    })
                    .padding()
                    .background(LinearGradient(gradient: .init(colors: [.blue]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(20)
                    .animation(.spring())
                }
                .padding(.vertical)
                // half screen - spacing - two side paddings = 60
                .frame(width: (UIScreen.main.bounds.width - 60) / 2)
                .background(Color("Color1"))
                .cornerRadius(15)
//                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
//                .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
//
                
                VStack(alignment: .leading,spacing: 18,content: {
                
                    HStack{
                        
                        Text("In Progress").fontWeight(.heavy).foregroundColor(.white)
                        
                        Image(systemName: expandProgress ? "chevron.up" : "chevron.down").resizable().frame(width: 20, height: 10).foregroundColor(.white)
                        
                    }.onTapGesture {
                        
                        self.expandProgress.toggle()
                    }
                    
                    if expandProgress {
                        
                        Button(action: {
                            
                            print("1")
                            self.expandProgress.toggle()
                            
                        }) {
                            
                            Text("Deep Learning")
                            
                        }.foregroundColor(.white)
                        
                        Button(action: {
                            
                            print("2")
                            self.expandProgress.toggle()
                            
                        }) {
                            
                            Text("Anti-Racism")
                            
                        }.foregroundColor(.white)
                        
                        Button(action: {
                            
                            print("3")
                            self.expandProgress.toggle()
                            
                        }) {
                            
                            Text("Swift for Everybody")
                            
                        }.foregroundColor(.white)
                        
                        Button(action: {
                            
                            print("4")
                            self.expandProgress.toggle()
                            
                        }) {
                            
                            Text("Graphic Design")
                            
                        }.foregroundColor(.white)
                          
                    }
                    
                    
                    
                })
                .padding()
                .background(LinearGradient(gradient: .init(colors: [.blue]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(20)
                .animation(.spring())
                // shadows...
                
            }
            .padding(.top,20)
            
//            HStack(spacing: 20){
//
//                VStack(spacing: 12){
//
//                    Image("pinterest")
//                    .resizable()
//                    .frame(width: 80, height: 80)
//
//                    Text("Pinterest")
//                        .font(.title)
//                        .padding(.top,10)
//
//                    Text("UI Designer")
//                        .foregroundColor(Color("Color"))
//
//                    Text("2 Year")
//                        .font(.caption)
//                        .foregroundColor(.gray)
//                }
//                .padding(.vertical)
//                // half screen - spacing - two side paddings = 60
//                .frame(width: (UIScreen.main.bounds.width - 60) / 2)
//                .background(Color("Color1"))
//                .cornerRadius(15)
//                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
//                .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
//                // shadows...
//
//                VStack(spacing: 12){
//
//                    Image("fb")
//                    .resizable()
//                    .frame(width: 80, height: 80)
//
//                    Text("Facebook")
//                        .font(.title)
//                        .padding(.top,10)
//
//                    Text("UX Designer")
//                        .foregroundColor(Color("Color"))
//
//                    Text("1 Year")
//                        .font(.caption)
//                        .foregroundColor(.gray)
//                }
//                .padding(.vertical)
//                // half screen - spacing - two side paddings = 60
//                .frame(width: (UIScreen.main.bounds.width - 60) / 2)
//                .background(Color("Color1"))
//                .cornerRadius(15)
//                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
//                .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
//                // shadows...
//
//            }
            .padding(.top,20)
            
            Spacer(minLength: 0)
            
                        Button(action: model.logOut , label: {
                            Text("LogOut")
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                        })
        }
        .background(Color("Color1").edgesIgnoringSafeArea(.all))
    }
        
        
        
//        VStack {
//            Spacer()
//
//            Button(action: model.logOut , label: {
//                Text("LogOut")
//                    .fontWeight(.bold)
//                    .foregroundColor(.blue)
//
//            })

        }
        
        
        



struct Information {
    
    var image : String
    var userName : String
    var setting : String
}
