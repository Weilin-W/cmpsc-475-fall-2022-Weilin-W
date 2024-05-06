//
//  DeleteSubmitButtonView.swift
//  LionSpellApp
//
//  Created by Wei Lin Weng on 8/25/22.
//

import SwiftUI

struct DeleteSubmitButtonView: View {
    var deleteAction : () -> Void
    var submitAction : () -> Void
    var isDeletable : Bool = false
    var isSubmitable : Bool = false
    var body: some View {
        HStack{
            Button(action: deleteAction){
                if(isDeletable){
                    Label("Delete", image: "deleteBtn")
                        .frame(maxWidth : 100, maxHeight: 35)
                        .background(Capsule().fill(Color.green))
                        .buttonStyle(.bordered)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }else{
                    Label("Delete", image: "deleteBtn")
                        .frame(maxWidth : 100, maxHeight: 35)
                        .background(Capsule().fill(Color.red))
                        .buttonStyle(.bordered)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
            Spacer()
            Button(action: submitAction){
                if(isSubmitable){
                    Label("Submit", image: "submitBtn")
                        .frame(maxWidth : 100, maxHeight: 35)
                        .background(Capsule().fill(Color.green))
                        .buttonStyle(.bordered)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }else{
                    Label("Submit", image: "submitBtn")
                        .frame(maxWidth : 100, maxHeight: 35)
                        .background(Capsule().fill(Color.red))
                        .buttonStyle(.bordered)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
        }.padding(20)
    }
}

struct DeleteSubmitButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteSubmitButtonView(deleteAction: {}, submitAction: {}, isDeletable: false, isSubmitable: false)
    }
}
