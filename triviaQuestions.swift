//
//  triviaQuestions.swift
//  Created by William Vivas on 3/29/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//
// second project




struct Trivia {
    var question : String
    var optionA : String
    var optionB : String
    var optionC : String
    var optionD : String
    var correctAnswer: String
}


let questionOne = Trivia(question: "This was the only US President to serve more than two consecutive terms.", optionA: "George washington", optionB: "franklin D Roosevelt", optionC: " Woodrow Wilson", optionD: "Andrew Jackson", correctAnswer: "franklin D Roosevelt")


let questionTwo = Trivia(question: "Which of the following countries has the most residents?", optionA: "Nigera", optionB: "Russia", optionC: "Iran", optionD: "Vietnam", correctAnswer: "Nigeria")

let questionthree = Trivia(question: "In what year was the United Nations founded?", optionA: "1918", optionB: "1919", optionC: "1945", optionD: "1954", correctAnswer: "1945")


let questionfour = Trivia(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", optionA: "paris", optionB: "Washington D.C.", optionC: "NYC", optionD: "Boston", correctAnswer: "NYC")


let questionFive = Trivia(question: "Which nation produces the most oil?", optionA: "Iran", optionB: "Iraq", optionC: "Brazil", optionD: "Canada", correctAnswer: "Canada")


let questionSix = Trivia(question: "Which country has most recently won consecutive World Cups in Soccer?", optionA: "Italy", optionB: "Brazil", optionC: "Argentina", optionD: "Spain", correctAnswer: "Brazil")


let quetionSeven = Trivia(question: "Which of the following rivers is longest?", optionA: "Yangtze", optionB: "Mississippi", optionC: "Congo", optionD: "Mekong", correctAnswer: "Misssissippi")


let questionEight = Trivia(question: "Which city is the oldest?", optionA: "Mexico City", optionB: "Cape Town", optionC: "San Jaun", optionD: "Sydney", correctAnswer: "Mexico City")


let questionNine = Trivia(question: "Which country was the first to allow women to vote in national elections?", optionA: "Poland", optionB: "United States", optionC: "Sweden", optionD: "Senegal", correctAnswer: "Poland")


let questionTen = Trivia(question: "Which of these countries won the most medals in the 2012 Summer Games?", optionA: "France", optionB: "Germany", optionC: "Japan", optionD: "Great Britain", correctAnswer: "Great Britain")

let listOftriviaQuestions = [questionOne,questionTwo,questionthree,questionfour,questionFive,questionSix,quetionSeven,questionEight,questionNine,questionTen]
