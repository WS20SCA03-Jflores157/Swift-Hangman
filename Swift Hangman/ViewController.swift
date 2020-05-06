//
//  ViewController.swift
//  Swift Hangman
//
//  Created by Jeffrey  on 5/4/20.
//  Copyright © 2020 BMCC. All rights reserved.
//

import UIKit

struct Word {
    var word: String
    var hint: String
    var count: Int
    
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var hangImage: UIImageView!
    
    @IBOutlet var wordLetters: [UILabel]!
    
    @IBOutlet var letterSpaces: [UIView]!
    
    
    @IBOutlet weak var wordHint: UILabel!
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    
    @IBOutlet var alphabetButtons: [UIButton]!
    
    let words: [Word] = [
        
        Word(word: "INHERITANCE",
             hint: "When a class is a subclass of another class, it gets all of its behavior(methods,properties and other characteristics) from its superclass.",
             count: 11),
        Word(word: "SUPERCLASS",
             hint: "The parent of another class.",
             count: 10),
        Word(word: "SUBCLASS",
             hint: "A child of another class.",
             count: 8),
        Word(word: "OVERRIDE",
             hint: "Refers to replacing the implementation of a method defined on a superclass.",
             count: 8),
        Word(word: "METHOD",
             hint: "A function defined inside a type. This function can use the data stored in the type’s properties to do work.",
             count: 6)
        
    ]
    
    
    var counter: Int = 0{
        didSet {
            updateUI()
        }
    }
    
    var wrongCount: Int = 0{
        didSet{
            switch wrongCount {
            case 1:
                hangImage.image = UIImage(named: "1wrong")
            case 2:
                hangImage.image = UIImage(named: "2wrong")
            case 3:
                hangImage.image = UIImage(named: "3wrong")
            case 4:
                hangImage.image = UIImage(named: "4wrong")
            case 5:
                hangImage.image = UIImage(named: "5wrong")
            case 6:
                hangImage.image = UIImage(named: "allwrong")
                winnerLabel.text = "You Lose!"
                
                for button in alphabetButtons {
                    button.isEnabled = false
                }
            default:
                print("Too many wrong guesses.")
            }
        }
    }
    
    var correctGuesses: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter = 0
        correctGuesses = 0
    }
    
    func adjustLetterSpaces(for letters:Int){
        for i in letters...10{
            letterSpaces[i].isHidden = true
            wordLetters[i].isHidden = true
        }
        
        for i in 0...letters{
            letterSpaces[i].isHidden = false
            wordLetters[i].isHidden = false
        }
    }
    
    func updateUI(){
        let word: Word = words[counter]
        let letterCount: Int = word.count
        hangImage.image = UIImage(named: "newgame")
        wordHint.text = word.hint
        winnerLabel.text = ""
        correctGuesses = 0
        
        for button in alphabetButtons {
            button.isEnabled = true
        }
        
        for label in wordLetters {
            label.text = ""
        }
        
        switch letterCount{
            
        case 6:
            adjustLetterSpaces(for: 5)
        case 8:
            adjustLetterSpaces(for: 7)
        case 10:
            adjustLetterSpaces(for: 9)
        case 11:
            adjustLetterSpaces(for: 10)
        default:
            print("This word has 11 letters.")
        }
        
    }
    
    
    
    @IBAction func changeWord(_ sender: UIStepper) {
        counter = Int(sender.value)
        print(sender.value)
    }
    
    
    @IBAction func guessLetter(_ sender: UIButton) {
        let word: Word = words[counter]
        var letterIndex: Int = 0
        let correctLimit: Int = word.count
        let letter: Character = Character((sender.titleLabel?.text)!)
        
        
        if word.word.contains(letter) {
            print("Word contains letter")
            
            
            
            
            
            
            let i: String.Index = word.word.startIndex
            
            
            switch correctLimit {
            case 11:
                let j: String.Index = word.word.index(after: i)
                let k: String.Index = word.word.index(after: j)
                let l: String.Index = word.word.index(after: k)
                let m: String.Index = word.word.index(after: l)
                let n: String.Index = word.word.index(after: m)
                let o: String.Index = word.word.index(after: n)
                let p: String.Index = word.word.index(after: o)
                let q: String.Index = word.word.index(after: p)
                let r: String.Index = word.word.index(after: q)
                let s: String.Index = word.word.index(after: r)
                let stringIndexArray: [String.Index] = [i,j,k,l,m,n,o,p,q,r,s]
                
                for stringIndex in stringIndexArray{
                    
                    
                    if letter == word.word[stringIndex] {
                        wordLetters[letterIndex].text = String(letter)
                        correctGuesses += 1
                        
                        if correctGuesses == correctLimit {
                            for button in alphabetButtons {
                                button.isEnabled = false
                            }
                            
                            winnerLabel.text = "You Win!"
                        }
                    }
                    letterIndex += 1
                }
                
            case 10:
                let j: String.Index = word.word.index(after: i)
                let k: String.Index = word.word.index(after: j)
                let l: String.Index = word.word.index(after: k)
                let m: String.Index = word.word.index(after: l)
                let n: String.Index = word.word.index(after: m)
                let o: String.Index = word.word.index(after: n)
                let p: String.Index = word.word.index(after: o)
                let q: String.Index = word.word.index(after: p)
                let r: String.Index = word.word.index(after: q)
                let stringIndexArray: [String.Index] = [i,j,k,l,m,n,o,p,q,r]
                
                for stringIndex in stringIndexArray{
                    
                    
                    if letter == word.word[stringIndex] {
                        wordLetters[letterIndex].text = String(letter)
                        correctGuesses += 1
                        
                        if correctGuesses == correctLimit {
                            for button in alphabetButtons {
                                button.isEnabled = false
                            }
                            
                            winnerLabel.text = "You Win!"
                        }
                    }
                    letterIndex += 1
                }
                
            case 8:
                let j: String.Index = word.word.index(after: i)
                let k: String.Index = word.word.index(after: j)
                let l: String.Index = word.word.index(after: k)
                let m: String.Index = word.word.index(after: l)
                let n: String.Index = word.word.index(after: m)
                let o: String.Index = word.word.index(after: n)
                let p: String.Index = word.word.index(after: o)
                
                let stringIndexArray: [String.Index] = [i,j,k,l,m,n,o,p]
                
                for stringIndex in stringIndexArray{
                    
                    
                    if letter == word.word[stringIndex] {
                        wordLetters[letterIndex].text = String(letter)
                        correctGuesses += 1
                        
                        if correctGuesses == correctLimit {
                            for button in alphabetButtons {
                                button.isEnabled = false
                            }
                            
                            winnerLabel.text = "You Win!"
                        }
                    }
                    letterIndex += 1
                }
                
            case 6:
                let j: String.Index = word.word.index(after: i)
                let k: String.Index = word.word.index(after: j)
                let l: String.Index = word.word.index(after: k)
                let m: String.Index = word.word.index(after: l)
                let n: String.Index = word.word.index(after: m)
                
                let stringIndexArray: [String.Index] = [i,j,k,l,m,n]
                
                for stringIndex in stringIndexArray{
                    
                    
                    if letter == word.word[stringIndex] {
                        wordLetters[letterIndex].text = String(letter)
                        correctGuesses += 1
                        
                        if correctGuesses == correctLimit {
                            for button in alphabetButtons {
                                button.isEnabled = false
                            }
                            
                            winnerLabel.text = "You Win!"
                        }
                    }
                    letterIndex += 1
                }
                
            default:
                print("You have guessed wrong.")
            }
            
            
            
            
            
            
        }
        else{
            wrongCount += 1
        }
        
    }
    
    
    
}

