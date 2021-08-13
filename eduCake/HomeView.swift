//
//  HomeView.swift
//  eduCake
//
//  Created by Van Hoang on 4/6/21.
//

import SwiftUI
import AVKit

struct HomeView: View {
    let topicViewModel = TopicViewModel()
    var body: some View {
        
        List {
            courseView
        }.navigationTitle("Browse Topics")
    }
    
    var courseView: some View {
        ScrollView(.horizontal) {
            VStack (alignment: .leading) {
                Text("Topics")
                HStack {
                    ForEach(topicViewModel.topics) { topic in
                        NavigationLink(destination: TopicDetailView(topicViewModel: topicViewModel, index: topic.id)) {
                            TopicIconView(topic: topic)
                        }
                    }
                
                }

                    
            }.frame(height: 200)
        }
        
        
    }
}



struct TopicDetailView: View {
    var topicViewModel : TopicViewModel
    var index: Int
    var body: some View {
        ScrollView {
            ForEach(topicViewModel.topics[index].posts) { post in
                NavigationLink(destination: PostDetailView(post: post, topicIndex: index)) {
                    HStack {
                        VStack (alignment: .leading) {
                            PostOutsideView(post: post)
                        }
                    }.padding()
                    
                    //.background(Color.red)
                    Spacer()
                    
                }
            }
        }
    }
}


struct PostOutsideView: View {
    var post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Question \(post.id+1) ")
                .lineLimit(2)
                .font(.system(size: 40, weight: .bold))
            Spacer()
            Text(post.question)
                .font(.system(size: 21, weight:.semibold))
            Spacer()
            
                
//            Text(post.answers[post.getBestAnswerID()].textAnswer).font(.system(size: 20))
//                .foregroundColor(Color.black)
        }
        .frame(width: 330, height: 100, alignment: .leading)
        .padding(30)
        .foregroundColor(.black)
        .background(Color(.white))
        .cornerRadius(30)
//        Text("Question \(post.id+1): ")
//            .font(.system(size: 25, weight:.bold))
//            .foregroundColor(Color.black)
//        Text(post.question)
//            .font(.system(size: 21, weight:.semibold))
//            .foregroundColor(Color.black)
//
//        Text(post.answers[post.getBestAnswerID()].textAnswer).font(.system(size: 18))
//            .foregroundColor(Color.black)
//            .padding()
    }
}


struct PostDetailView: View {
    var post: Post
    var topicIndex: Int
    @State var pressedButtonIndex : Int?
    @State var videoIndex : Int?
    let buttonImageName = ["arrow.up.square", "arrow.down.square"]
    let pressedButtonImageName = ["arrow.up.square.fill", "arrow.down.square.fill"]
    
    var videoView: some View {
        VStack {
            
            VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: videoIndex == nil ? post.answers[post.getBestAnswerID()].videoURL : post.answers[videoIndex!].videoURL, withExtension: "mp4")!))
            HStack {
                Spacer()
                Button(action: {
                    videoIndex = Int.random(in: 0..<post.answers.count)
                }, label: {
                    Image(systemName: "questionmark.circle.fill")
                        .font(.system(size:54, weight: .bold))
                        .foregroundColor(Color.red)
                })
                ForEach(0..<2) { buttonIndex in
                    Button(action: {
                        pressedButtonIndex = buttonIndex
                    }, label: {
                        VStack {
                            Image(systemName: pressedButtonIndex == buttonIndex ? pressedButtonImageName[buttonIndex] : buttonImageName[buttonIndex])
                                .font(.system(size:54, weight: .bold))
                                .foregroundColor(Color.blue)
                            //Text()
                        }
                    })
                
                }
            }
        }
        .padding()
    }
    
    
    var body: some View {
        return HStack {
            VStack(alignment: .leading) {
                Text(post.question)
                    .font(Font.largeTitle)
                    .padding()
                VStack {
                    videoView
                }.frame(maxHeight: 400)
                //Text(post.answers[])
                Spacer()
            }
            
            Spacer()
        }
    }
    
        // check if answerIndex is in the array, if not, add to the array
        // the body var will then use the last element in the array as the index for the answer
        // add a new function to the viewmodel that get a second best video by sending in the array of
        // watched index.
    
}



struct TopicIconView: View {
    let topic: Topic
    var body: some View {
        VStack(alignment: .leading) {
            Image(topic.imageName)
                .renderingMode(.original)
                .resizable()
                .frame(width: 90, height: 90)
                .clipped()
                .cornerRadius(20)
            Text(topic.courseName)
                .font(.system(size: 12))
                .lineLimit(2)
                .padding(.leading, 10)
        }.frame(width: 90,height: 150,alignment: .topLeading)
            
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            //HomeView()
            TopicDetailView(topicViewModel: TopicViewModel(), index: 0)
                .preferredColorScheme(.dark)
            PostDetailView(post:TopicViewModel().topics[0].posts[0], topicIndex: 0)
        }
    }
}
