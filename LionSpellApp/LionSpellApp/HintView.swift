//
//  HintView.swift
//  LionSpellApp
//
//  Created by Wei Lin Weng on 9/12/22.
//

import SwiftUI

struct HintView: View {
    @State private var possibleWordsNum = 2
    @State var possiblePangrams = ["English","French"]
    var possibleWords = ["acid","ace"]
    private var totalPoints = 53
    private var totalPangrams = 1
    @Environment (\.dismiss) private var dismiss
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Summary")) {
                    Picker("Total possible words: \(possibleWordsNum)", selection: $possibleWordsNum){
                        List(possibleWords, id:\.self){ words in
                            Text(words)
                        }
                    }
                    Text("Total possible points: \(totalPoints)")
                    Picker("Number of Pangrams: \(totalPangrams)", selection: $possibleWordsNum){
                        ForEach(possiblePangrams, id:\.self){ pangrams in
                            Text(pangrams)
                        }
                    }
                    
                }
                //Checks for the words of length size of 4
                //ForEach loop to create all the combinations for length of 4 and above
                Section(header: Text("Words of Length 4")){
                    Picker("r:\(possibleWordsNum)", selection: $possibleWordsNum){
                        List(possibleWords, id:\.self){ words in
                            Text(words)
                        }
                    }
                }
                    
                Button("Return"){
                    dismiss()
                }
            }
        }
    }
}

struct HintView_Previews: PreviewProvider {
    static var previews: some View {
        HintView()
    }
}
