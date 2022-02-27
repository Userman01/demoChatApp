//
//  MessageBubble.swift
//  DemoChatApp
//
//  Created by Петр Постников on 21.02.2022.
//

import SwiftUI

struct MessageBubble: View {
    var message:Message
    @State private var showTime = false
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing){
            HStack{
                Text(message.text)
                    .padding()
                    .background(message.received ? Color.gray : Color.white)
                    .cornerRadius(30)
            }.frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
                .onTapGesture {
                    showTime.toggle()
                }
            if showTime{
                Text("\(message.timetamp.formatted(.dateTime.hour().minute()))")
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing, 25)
            }
        }.frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
            .padding(message.received ? .leading : .trailing)
            .padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "12345", text: "Hello sdfsfsfsfsfsfsfsfsfsfsfsfsfsfsdfsfsfsfsfsdfsfsfsdfsfsfsfsfsfsfsfsfsfsfsfsdfsfsfsfsdfsfsfsdfsdfsfsfsdfsdf", received: false, timetamp: Date()))
    }
}
