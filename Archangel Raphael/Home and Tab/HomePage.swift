//
//  HomePage.swift
//  Archangel Raphael
//
//  Created by Michael Ghebranious on 1/23/24.
//

import SwiftUI

struct HomePage: View {
    @AppStorage("isLight") var isLight: Bool = false
    
    ///Background colors chosen based on the App Storage object isLight
    var backgroundColors: [Color] {
        if isLight{
            return [Color("lightblue"), Color("lightblue").opacity(0.05)]
        }else{
            return [Color("darkgray")]
        }
    }
    
    ///Variable that holds the current Bible verse for each day by calculating the difference in days
    var bibleVerse: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/mm/yyyy"
        
        let newYearString = "01/01/2024"
        guard let newYearDate = dateFormatter.date(from: newYearString) else {
            return "Error in Deploying a Bible Verse"
        }
        
        let hoursApart = Date().timeIntervalSince(newYearDate) / 3600 / 24
        
        let daysApart = Int(hoursApart.truncatingRemainder(dividingBy: 365))

        return bibleVerses[daysApart]
    }
    ///Function that helps split the bible verse into the reference and the actual verse
    func splitBibleVerse(bibleVerse: String) -> [String]{
        return bibleVerse.components(separatedBy: " - ")
    }
    
    var body: some View {
        GeometryReader {proxy in
            VStack(spacing: 0){
                HStack{
                    Spacer()
                    
                    Text("Archangel Raphael")
                        .foregroundStyle(isLight ? .churchOrange : .coral)
                        .font(.custom("Literata-Bold", size: 32))
                        
                    
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    
                    VStack{
                        HStack{
                            Text("Verse of the Day")
                                .font(.custom("Literata-Bold", size: 24))
                               
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
                        
                        Spacer()
                        
                        HStack{
                            Text(splitBibleVerse(bibleVerse: bibleVerse)[1])
                            Spacer()
                        }
                        .font(.custom("Literata-Medium", size: 12))
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 20)
                        
                        Spacer()
                        
                        HStack{
                            Text(splitBibleVerse(bibleVerse: bibleVerse)[0])
                            Spacer()
                        }
                        .font(.custom("Literata-Bold", size: 14))
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 0))
                    }
                    .frame(width: proxy.size.width * 351 / 430, height: proxy.size.height * 177 / 839)
                    .background(isLight ? .white: .lightgray)
                    .cornerRadius(20)
                    .padding(.top, proxy.size.height * 28 / 839)
                    .foregroundStyle(isLight ? .textGray : .coral)
                    
                    Spacer()
                }
                
                VStack(spacing: proxy.size.height * 38 / 839){
                    HStack{
                        Spacer()
                        HomeButton(name: "Broadcast", size: proxy.size.height * 170/839)
                        Spacer()
                        HomeButton(name: "Calendar", size: proxy.size.height * 170/839)
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        HomeButton(name: "Bible Study", size: proxy.size.height * 170/839)
                        Spacer()
                        HomeButton(name: "Donations", size: proxy.size.height * 170/839)
                        Spacer()
                    }
                }
                .padding(.top, proxy.size.height * 48 / 839)
            }

        }
        .frame(width: .infinity, height: .infinity)
        .background(
            LinearGradient(colors: backgroundColors,
                           startPoint: .bottom,
                           endPoint: .top)
        )
        
    
    }
}

#Preview {
    HomePage()
}
