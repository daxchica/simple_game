//
//  ContentView.swift
//  simple_game
//
//  Created by Dax Chica on 5/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var myImages = ["apple", "cherry", "star"]
    
    @State private var image1 = "apple"
    @State private var image2 = "cherry"
    @State private var image3 = "star"
    @State private var credit = 1000
    
    var body: some View {
        
        
        VStack{
            
            Spacer()
            
            Text("SwiftUI Slots")
                .padding()
                .font(.title)
            
            Spacer()
            
            Text("Credit: " + String(credit))
                .font(.system(size: 20))
            
            Spacer()
            
            HStack{
                Spacer()
                
                Image(image1)
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Spacer()
                
                Image(image2)
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Spacer()
                
                Image(image3)
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Spacer()
                
            }
            
            Spacer()
            
            Button{
                
                func myRandom() -> Int {
                    return Int.random(in: 0...2)
                }
                let num1 = myRandom()
                let num2 = myRandom()
                let num3 = myRandom()

                image1 = myImages[num1]
                image2 = myImages[num2]
                image3 = myImages[num3]
                
                if num1 == num2 && num2 == num3 {
                    credit += 45
                    
                } else if num1 == num2 || num2 == num3 || num3 == num1 {
                    credit += 15
                } else if num1 != num2 && num2 != num3 {
                    credit -= 45
                }
                
                
                
            }
        label: {
            Text("Spin")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 10))
        }
        .frame(width: 120, height: 50, alignment: .center)
        .background(.red)
        .clipShape(RoundedRectangle(cornerRadius: 50))
            
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
