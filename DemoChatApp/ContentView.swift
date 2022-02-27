//
//  ContentView.swift
//  DemoChatApp
//
//  Created by Петр Постников on 21.02.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messangerManager = MessagesManager()
    var body: some View {
        VStack {
            VStack{
                TitleRow()
                ScrollView{
                    ForEach(messangerManager.messages, id: \.id){ message in
                        MessageBubble(message: message)
                        
                    }
                }.padding(.top, 10)
                    .background(.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
            }
            .background(Color.gray)
            
            
            MessageField()
                .environmentObject(messangerManager)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
