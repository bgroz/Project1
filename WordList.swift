//
//  WordList.swift
//  CrossWordGame
//
//  Created by Bartuğ Maden on 06/04/2017.
//  Copyright © 2017 Bartuğ Maden. All rights reserved.
//

import Foundation
import FirebaseCore
import FirebaseDatabase
import Firebase



func listingWords()
{
    beginnerLevel()
    intermediateLevel()
    advancedLevel()
    
    
    // "Level" sayısını for döngüsü içinde yazıp 10 a kadar döndürebiliriz 
    
    

    
    
}
func beginnerLevel()
{
    
    
    let ref = FIRDatabase.database().reference(fromURL: "https://crossword-a57a7.firebaseio.com/")
    

    let arr: NSMutableArray = ["Auto","Mexican Coin","Area","Nearly","Worth","Take it easy","Depart","Lumber"]
    let arr2: NSMutableArray = ["Outgoing","Divisible by two","Journey","African Country","Alien's ship","Female"]
    let arr3: NSMutableArray = ["Outgoing","Divisible by two","Journey","African Country","Alien's ship","Female"]
    let arr4: NSMutableArray = ["Outgoing","Divisible by two","Journey","African Country","Alien's ship","Female"]
    let arr5: NSMutableArray = ["Outgoing","Divisible by two","Journey","African Country","Alien's ship","Female"]
    let arr6: NSMutableArray = ["Outgoing","Divisible by two","Journey","African Country","Alien's ship","Female"]
    let arr7: NSMutableArray = ["Outgoing","Divisible by two","Journey","African Country","Alien's ship","Female"]
    let arr8: NSMutableArray = ["Outgoing","Divisible by two","Journey","African Country","Alien's ship","Female"]
    let arr9: NSMutableArray = ["Outgoing","Divisible by two","Journey","African Country","Alien's ship","Female"]

    
    
    
    
    ref.child("Beginner").child("Level1").setValue([arr])
    ref.root.child("Beginner").child("Level2").setValue([arr2])
    ref.root.child("Beginner").child("Level3").setValue([arr3])
    ref.root.child("Beginner").child("Level4").setValue([arr4])
    ref.root.child("Beginner").child("Level5").setValue([arr5])
    ref.root.child("Beginner").child("Level6").setValue([arr6])
    ref.root.child("Beginner").child("Level7").setValue([arr7])
    ref.root.child("Beginner").child("Level8").setValue([arr8])
    ref.root.child("Beginner").child("Level9").setValue([arr9])
    
    
}
func intermediateLevel(){
    let ref = FIRDatabase.database().reference(fromURL: "https://crossword-a57a7.firebaseio.com/")

    
    let arr: NSMutableArray = ["Sugar Source","Is able","Time past","French friend","Newspaper and TV","Image","Old Rome language","Smack"]
    let arr2:NSMutableArray = ["Play a part","Supervisor","Had a meal","Big monkey","Love god","Language of Syria","Poker counter","Exam type"]
    
    
    
    ref.child("Intermediate").child("Level1").setValue([arr])
    ref.child("Intermediate").child("Level2").setValue([arr2])
    ref.child("Intermediate").child("Level3").setValue([arr])
    ref.child("Intermediate").child("Level4").setValue([arr])
    ref.child("Intermediate").child("Level5").setValue([arr])
    ref.child("Intermediate").child("Level6").setValue([arr])
    ref.child("Intermediate").child("Level7").setValue([arr])
    ref.child("Intermediate").child("Level8").setValue([arr])
    ref.child("Intermediate").child("Level9").setValue([arr])
    
    
}

func advancedLevel()
{
    let ref = FIRDatabase.database().reference(fromURL: "https://crossword-a57a7.firebaseio.com/")
    
    
    let arr: NSMutableArray = ["Sugar Source","Is able","Time past","French friend","Newspaper and TV","Image","Old Rome language","Smack"]
    let arr2:NSMutableArray = ["Play a part","Supervisor","Had a meal","Big monkey","Love god","Language of Syria","Poker counter","Exam type"]
    
    ref.child("Advanced").child("Level1").setValue([arr])
    ref.child("Advanced").child("Level2").setValue([arr])
    ref.child("Advanced").child("Level3").setValue([arr])
    ref.child("Advanced").child("Level4").setValue([arr])
    ref.child("Advanced").child("Level5").setValue([arr])
    ref.child("Advanced").child("Level6").setValue([arr])
    ref.child("Advanced").child("Level7").setValue([arr])
    ref.child("Advanced").child("Level8").setValue([arr])
    ref.child("Advanced").child("Level9").setValue([arr])

    
}




