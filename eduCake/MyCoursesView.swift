

import SwiftUI

struct MyCoursesView: View {
    var courseModel = CourseModel()
    @State var show = false
    @State var current : Story!
    
    @State var data = [

        Story(id: 0, name: "Einstein", url: "formula1", seen: false, proPic: "img1", loading: false),
        Story(id: 1, name: "Newton", url: "formula2", seen: false, proPic: "img2", loading: false),
        Story(id: 2, name: "Tran", url: "formula3", seen: false, proPic: "img3", loading: false),
        Story(id: 3, name: "Van", url: "p4", seen: false, proPic: "img4", loading: false),
        
    ]
    var body: some View {
//        NavigationView {
        ZStack {
            VStack {

                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 22){
                        
                        Button(action: {
                            
                        }) {
                            
                            VStack(spacing: 10){
                                
                                ZStack(alignment: .bottomTrailing){
                                    
                                    Image("profile")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 65, height: 65)
                                    .clipShape(Circle())
                                    
                                    
                                    Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .padding(8)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .offset(x: 6)
                                }
                                
                                Text("You")
                                    .foregroundColor(.black)
                            }
                        }
                        
                        ForEach(0..<self.data.count){i in
                            
                            VStack(spacing: 8){
                                
                                ZStack{
                                    
                                    Image(self.data[i].proPic)
                                    .resizable()
                                    .frame(width: 65, height: 65)
                                    .clipShape(Circle())
                                    
                                    if !self.data[i].seen{
                                        
                                        Circle()
                                            .trim(from: 0, to: 1)
                                            .stroke(AngularGradient(gradient: .init(colors: [.blue,.purple]), center: .center), style: StrokeStyle(lineWidth: 4, dash: [self.data[i].loading ? 7 : 0]))
                                        .frame(width: 74, height: 74)
                                        .rotationEffect(.init(degrees: self.data[i].loading ? 360 : 0))
                                    }

                                }
                                
                                Text(self.data[i].name)
                                    .foregroundColor(.white)
                                    .lineLimit(3)
                            }
                            .frame(width: 75)
                            .onTapGesture {
                                
                                withAnimation(Animation.default.speed(0.35).repeatForever(autoreverses: false)){
                                    
                                    self.data[i].loading.toggle()
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + (self.data[i].seen ? 0 : 1.2)) {
                                        
                                        self.current = self.data[i]
                                        
                                        withAnimation(.default){
                                            
                                           self.show.toggle()
                                        }
                                        
                                        self.data[i].loading = false
                                        self.data[i].seen = true
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
//                    .padding(.bottom)

                NavigationView {
                    ScrollView {
                        VStack{

                                ForEach(courseModel.courses) { course in
                                    NavigationLink( destination: Text("Destination")) {
                                        HStack {
                                            EnrolledCourse(course: course)
                                            //Spacer()
                                        }
                                    }
                                    
                                    
                                }
                            
    //                        }
                            
                            
                        }
                        
                    }
                }
//                .navigationBarTitle("love")
//                .navigationBarTitle(courseModel.courses)
               
            }
//                Spacer()
                if self.show{
                    
                    ZStack{
                        
                        Color.black.edgesIgnoringSafeArea(.all)
                        
                        ZStack(alignment: .topLeading) {
                            
                            GeometryReader{_ in
                                
                                VStack{
                                    
                                    Image(self.current.url)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                }
                            }
                            
                            VStack(spacing: 15){
                                
                                Loader(show: self.$show)
                                
                                HStack(spacing: 15){
                                    
                                    Image(self.current.proPic)
                                    .resizable()
                                    .frame(width: 55, height: 55)
                                    .clipShape(Circle())
                                    
                                    Text(self.current.name)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                }
                                .padding(.leading)
                            }
                            .padding(.top)
                        }
                    }
                    
                    .transition(.move(edge: .trailing))
                    .onTapGesture {
                        
                        self.show.toggle()
                    }
                }
            }
            

            
//
//        }
        .navigationBarTitle(self.show ? "" : "Courses" ,displayMode: .inline)
        .navigationBarHidden(self.show ? true : false)
        
        .navigationTitle("My Courses")
        
        
    }
    
}


struct EnrolledCourse: View {
    var course: Course
    var body: some View {
        VStack(alignment: .leading) {
            Text(course.courseName)
                .lineLimit(2)
                .font(.system(size: 30, weight: .bold))
            Spacer()
            Text("Progress: \(course.calculateProgressPercentage())%")
            Text(course.author)
        }
        .frame(width: 330, height: 200, alignment: .leading)
        .padding(30)
        .foregroundColor(.white)
        .background(Color(.darkGray))
        
    }
    
}

struct MyCoursesView_Previews: PreviewProvider {
    static var previews: some View {
        MyCoursesView()
    }
}

struct Loader : View {
    
    @State var width : CGFloat = 100
    @Binding var show : Bool
    var time = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var secs : CGFloat = 0
    
    var body : some View{
        
        ZStack(alignment: .leading){
            
            Rectangle()
                .fill(Color.white.opacity(0.6))
                .frame(height: 3)
            
            Rectangle()
                .fill(Color.white)
                .frame(width: self.width, height: 3)
        }
        .onReceive(self.time) { (_) in
            
            self.secs += 0.1
            
            if self.secs <= 6{//6 seconds.....
                
                let screenWidth = UIScreen.main.bounds.width
                
                self.width = screenWidth * (self.secs / 6)
            }
            else{
                
                self.show = false
            }

        }
    }
}

struct Story : Identifiable {
    
    var id : Int
    var name : String
    var url : String
    var seen : Bool
    var proPic : String
    var loading : Bool
}
