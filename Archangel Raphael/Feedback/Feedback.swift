//
//  Feedback.swift
//  Archangel Raphael
//
//  Created by Michael Ghebranious on 2/1/24.
//

import SwiftUI

struct Feedback: View {
    @AppStorage("isLight") var isLight : Bool = true
    
    ///Variable that determines the number of stars tapped for the feedback rating
    @State var numberOfStars: Double = 0.0
    
    @State var eachTapped : [Int] = [0,0,0,0,0]
    var body: some View {
        GeometryReader{ proxy in
            VStack(spacing: 0){
                HStack{
                    Spacer()
                    
                    Text("Feedback")
                        .foregroundStyle(isLight ? .churchOrange : .coral)
                        .font(.custom("Literata-Bold", size: 32))
                    
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    
                    Text("All suggestions and general feedback about the application will be reviewed. If asking a question, enter your email into the optional field below to ensure contact with us.")
                    
                    Spacer()
                }
                .padding(.top, proxy.size.height * 20 / 839)
                .multilineTextAlignment(.center)
                .foregroundStyle(isLight ? .textGray : .coral)
                .font(.custom("Literata-Medium", size: 16))
                
                HStack{
                    Spacer()
                    
                    HStack(spacing : 12){
                        ForEach(0..<5){ index in
                            Image(systemName: String(numberOfStars).contains(".5") && numberOfStars - 0.5 == Double(index + 1) ? "star.leadinghalf.filled" : "star.fill")
                                .resizable()
                                .frame(width: 46, height: 46)
                                .foregroundStyle(numberOfStars >= Double(index + 1) ? .starYellow : .white)
                                .onTapGesture {
                                    eachTapped[index] += 1
                                    if(eachTapped[index] % 2 == 0){
                                        numberOfStars = Double(index) + 1.5
                                    }else{
                                        numberOfStars = Double(index + 1)
                                    }
                                    
                                }
                            
                        }
                        
                    }
                    .shadow(radius: 1)
                    Spacer()
                    
                }
                .padding(.top, proxy.size.height * 32 / 839)
            }
            
        }
        .background(
            LinearGradient(colors: backgroundColors(isLight: isLight),
                           startPoint: .bottom,
                           endPoint: .top)
        )
    }
}

#Preview {
    Feedback()
}
