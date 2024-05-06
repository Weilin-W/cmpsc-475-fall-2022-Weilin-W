//
//  NewGameManager.swift
//  LionSpellApp
//
//  Created by Wei Lin Weng on 8/30/22.
//

import Foundation

class NewGameManager : ObservableObject{
    
    //Model
    let oneGameRound : OneGameRound = AllGames()
    @Published var preferences =  PreferenceView()
    
    //Array for letter buttons appendLetters() and newGame()
    var letterArr : [String] = []
    //Scroll list text display
    var scrollList : [String] = []
    //Current Text display
    @Published var currentLetterArr : [String] = []
    //Tracks the score
    var currentScore : Int = 0
    
    //Only enable if it is a word
    @Published var isSubmitable : Bool = false
    
    //Only enable if words can be deleted
    var isDeletable : Bool = false
    
    //Generates the letters for the buttons from Words.swift
    func retrieveFromWordBank(){
        /*Asset file from canvas*/
        let words = Words.words
        //Number of buttons needed
        let totalButtons : Int = 5
        
        while(letterArr.count != totalButtons){
            //Get randomString
            let randomString = words.randomElement()!
            
            //converts from "abc" to ["a","b","c"]
            var convertToArr = randomString.map{ String($0) }
            
            //Checks for duplicates in the array: Only one instance in NSCountedSet
            let checkDuplicateArr = NSCountedSet.init(array: convertToArr as [Any])
            //Go thru the array, check for duplicates
            let totalDuplicates = checkDuplicateArr.map { checkDuplicateArr.count(for: $0) }.filter {$0 > 1}.count
            
            //Append all the strings in the array to the letterArr for the text buttons
            var index : Int = 0
            if(convertToArr.count == totalButtons && totalDuplicates == 0){
                while(index < convertToArr.count){
                    letterArr.append(convertToArr[index])
                    index += 1
                }
            }else{
                convertToArr.removeAll()
                index = 0
            }
        }
        
        letterArr.shuffle()
        
    }
    
    func newGame(){
        /**Resets every functional buttons and generates new set of letter buttons**/
        scrollList.removeAll()
        currentLetterArr.removeAll()
        currentScore = 0
        letterArr.removeAll()
        isSubmitable = false
        isDeletable = false
        retrieveFromWordBank()
    }
    
    func deleteWord(){
        //Delete the most recent letter
        //Doesn't delete empty string
        if(!currentLetterArr.isEmpty && currentLetterArr.count > 0){
            currentLetterArr.removeLast()
            if(currentLetterArr.count == 0){
                isDeletable = false
            }
        }
        /*Asset file from canvas*/
        let words = Words.words
        
        //Appends the letter to the ScrollList
        let convertToStr = currentLetterArr.joined()
        
        if(words.contains(convertToStr) && !scrollList.contains(convertToStr)){
            isSubmitable = true
        }else if(!words.contains(convertToStr)){
            isSubmitable = false
        }
    }
    
    func submitWord(){
        //Check if it is valid word
        var isValidForAdditionalPoints : Bool = false
        
        /*Asset file from canvas*/
        let words = Words.words
        
        //Appends the letter to the ScrollList
        let convertToStr = currentLetterArr.joined()
        
        if(words.contains(convertToStr) && !scrollList.contains(convertToStr)){
            isSubmitable = true
            let currentLetter = Set(currentLetterArr)
            let buttonLetter = Set(letterArr)
            //Check if the valid word has all the buttons included in the word
            if(buttonLetter.isSubset(of: currentLetter)){
                isValidForAdditionalPoints = true
            }
        }else{
            isSubmitable = false
        }
        //Check if it is valid word before append to the scrollList
        if(isSubmitable){
            scrollList.append(convertToStr)
            if(currentLetterArr.count == 4){
                //Length equals 4 will get 1 point
                currentScore += 1
            }else if (currentLetterArr.count > 4){
                //Length greater than 4 will get points equal to the length
                currentScore += currentLetterArr.count
                //contains all the letter buttons in the word will get additional 5 points
                if(isValidForAdditionalPoints){
                    currentScore += 5
                }
            }
            //Resets after the word submitted to the scroll list
            currentLetterArr.removeAll()
            isDeletable = false
            isSubmitable = false
        }
    }

    func appendLetter(letter : String){
        /**Append to the array to display on the current word view**/
        currentLetterArr.append(letter)
        
        /*Asset file from canvas*/
        let words = Words.words
        
        //Appends the letter to the ScrollList
        let convertToStr = currentLetterArr.joined()
        
        if(words.contains(convertToStr) && !scrollList.contains(convertToStr)){
            isSubmitable = true
        }else if(!words.contains(convertToStr)){
            isSubmitable = false
        }
        isDeletable = true
    }
}
