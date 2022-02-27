//
//  MessageField.swift
//  DemoChatApp
//
//  Created by Петр Постников on 21.02.2022.
//

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var messangesManager: MessagesManager
    @State private var message = ""
    var body: some View {
        HStack{
            CustomtextField(placeholder: Text("Enter your message here"), text: $message)
            Button{
                messangesManager.sendMessage(text: message)
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.gray)
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color.gray)
            .cornerRadius(50)
            .padding()
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
            .environmentObject(MessagesManager())
    }
}

struct CustomtextField:View{
    var placeholder:Text
    @Binding var text:String
    var editingChanged:(Bool) ->() = {_ in}
    var commit:() ->() = {}
    var body: some View{
        ZStack(alignment: .leading){
            if text.isEmpty{
                placeholder.opacity(0.5)
            }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
