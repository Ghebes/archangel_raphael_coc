//
//  HomeButton.swift
//  Archangel Raphael
//
//  Created by Michael Ghebranious on 1/24/24.
//

import SwiftUI

struct HomeButton: View {
    @AppStorage("isLight") var isLight: Bool = true
    @State var name: String = "Broadcast"
    @State var size: CGFloat = 170
    @State var imageDimensions: [CGFloat] = [35, 30]
    ///Function to return the correct image for each bottom based on the passed in name
    func iconName() -> String{
        switch (name){
            case "Broadcast":
                return "play.tv"
            case "Calendar":
                return "calendar"
            case "Bible Study":
                return "book"
            case "Donations":
                return "dollarsign.square"
            default:
                return "book.closed"
        }
    }
    

    var body: some View {
        VStack(spacing: size * 5 / 170){
            Image(systemName: iconName())
                .resizable()
                .foregroundStyle(isLight ? .churchOrange : .white)
                .frame(width: imageDimensions[0], height: imageDimensions[1])
                
            
            Text(name)
                .foregroundStyle(isLight ? .black : .coral)
                .font(.custom("Literata-Bold", size: 21))
                
        }
        .frame(width: size, height: size)
        .background(isLight ? .whiteBlue : .mediumGray)
        .cornerRadius(20)
        .shadow(radius: 20)

        
    }
}

#Preview {
    HomeButton()
}
