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
    
    ///Variable that holds the information for the email textfield
    @State var emailField: String = ""
    
    ///Variable that holds the information for the required message textfield
    @State var messageField: String = "(Required) What suggestions, constructive criticism, or positive feedback do you have regarding the application? Do you have any questions about the function of the application?"
    
    ///Variable that determines whether enough required information is entered
    @State var requirementsFailed: Bool = false
    
    var startingMessage = "(Required) What suggestions, constructive criticism, or positive feedback do you have regarding the application? Do you have any questions about the function of the application?"
    @State var eachTapped : [Int] = [0,0,0,0,0]
    
    
    //To get rid of the background from TextEditor
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
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
                .font(.custom("Literata-Medium", size: 14))
                
                
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
                                    
                                    for element in eachTapped.indices{
                                        if(element < index){
                                            eachTapped[element] = 0
                                        }
                                    }
                                }
                            
                        }
                        
                    }
                    .shadow(radius: 1)
                    Spacer()
                }
                .padding(.top, proxy.size.height * 22 / 839)
                
                HStack{
                    Spacer()
                    HStack{
                        TextField("(Optional) Enter your email...", text: $emailField)
                            .padding(.leading, 10)
                            .autocorrectionDisabled()
                    }
                    .frame(width: proxy.size.width * 372/430, height: proxy.size.height * 60/839, alignment: .leading)
                    .background(.whiteblue)
                    .cornerRadius(20)
                    .shadow(radius: 4)
                    .foregroundStyle(.lightTextGray)
                    .font(.custom("Literata-Medium", size: 16))
                    
                    Spacer()
                }
                .padding(.top, proxy.size.height * 30 / 839)
                
                HStack{
                    Spacer()
                    TextEditor(text: $messageField)
                        .frame(width: proxy.size.width * 372/430, height: proxy.size.height * 326/839, alignment: .topLeading)
                        .textEditorBackground(Color("whiteblue"))
                        .cornerRadius(20)
                        .shadow(radius: 4)
                        .textInputAutocapitalization(.sentences)
                        .foregroundStyle(.lightTextGray)
                        .font(.custom("Literata-Medium", size: 12))
                        .onTapGesture{
                            if(messageField == startingMessage){
                                messageField = ""
                            }
                        }
                    
                    
                    
                    Spacer()
                }
                .padding(.top, proxy.size.height * 22 / 839)
                
                HStack{
                    Spacer()
                    Button{
                        //number of stars has the rating of the user
                        if(messageField != "" && messageField != startingMessage){
                            guard let url = createEmailUrl(to: "codingghebs@gmail.com", subject: "Feedback", body: messageField, type: "gmail") else {
                                print("error")
                                return
                            }
                            UIApplication.shared.open(url)
                        }else{
                            requirementsFailed = true
                        }
                        
                    }label:{
                        Text("Send Feedback")
                            .frame(width: proxy.size.width * 172 / 430, height: proxy.size.height * 20 / 430)
                            .background(.whiteblue)
                            .foregroundStyle(.churchOrange)
                            .cornerRadius(20)
                            .shadow(radius: 4)
                            .font(.custom("Literata-Bold", size: 16))
                        
                    }
                    Spacer()
                }
                .padding(.top, proxy.size.height * 20/839)
            }
            
        }
        .background(
            LinearGradient(colors: backgroundColors(isLight: isLight),
                           startPoint: .bottom,
                           endPoint: .top)
        )
        .onTapGesture{
            if(messageField == ""){
                messageField = startingMessage
            }
        }
        
        /*.alert("Missing Information", isPresented: $requirementsFailed,
               actions: {
            Button(role: .cancel){
                requirementsFailed = false
            }label: {
                Text("Ok")
            }
        }
               , message : {
            Text("You have not filled out the required message information.")
        }
        )
         */
    }
}

#Preview {
    Feedback()
}
