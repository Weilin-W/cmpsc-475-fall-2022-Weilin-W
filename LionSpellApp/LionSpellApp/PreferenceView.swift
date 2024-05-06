//
//  PreferenceView.swift
//  LionSpellApp
//
//  Created by Wei Lin Weng on 9/12/22.
//

import SwiftUI

struct PreferenceView: View {
    @State private var selectedDifficulty = "5"
    @State private var difficultySelection = ["5", "6", "7"]
    @State var selectedLanguage = "English"
    @State var languageSelection = ["English","French"]
    @Environment (\.dismiss) private var dismiss
    var body: some View {
        Form {
            Section(header: Text("DIFFICULTY LEVEL")) {
                Picker("Select a level", selection: $selectedDifficulty){
                    ForEach(difficultySelection, id:\.self){
                        Text($0)
                    }
                }.pickerStyle(.segmented)
            }
            Section(header: Text("LANGUAGE")) {
                Picker("Select a language", selection: $selectedLanguage){
                    ForEach(languageSelection, id:\.self){
                        Text($0)
                    }
                }.pickerStyle(.segmented)
            }
            Button("Return"){
                dismiss()
            }
        }
    }
}

struct PreferenceView_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceView()
    }
}
