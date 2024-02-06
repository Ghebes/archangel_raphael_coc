//
//  Functions.swift
//  Archangel Raphael
//
//  Created by Michael Ghebranious on 1/29/24.
//

import Foundation
import SwiftUI


///Background colors chosen based on the App Storage object isLight
func backgroundColors(isLight : Bool) -> [Color] {
    if isLight{
        return [Color("lightblue"), .white]
    }else{
        return [Color("darkgray")]
    }
}


extension View{
    func textEditorBackground(_ content: Color) -> some View {
        if #available(iOS 16.0, *){
            return self.scrollContentBackground(.hidden).background(content)
        }else{
            UITextField.appearance().backgroundColor = .clear
            return self.background(content)
        }
    }
    
}

public func createEmailUrl(to: String, subject: String, body: String, type: String) -> URL? {
    let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    
    let gmailUrl = URL(string: "googlegmail://co?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
    let outlookUrl = URL(string: "ms-outlook://compose?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
    
    let defaultUrl = URL(string: "mailto:\(to)?subject=\(subjectEncoded)&body=\(bodyEncoded)")
    
    
    if let gmailUrl = gmailUrl, UIApplication.shared.canOpenURL(gmailUrl), type == "gmail" {
        return gmailUrl
    } else if let outlookUrl = outlookUrl, UIApplication.shared.canOpenURL(outlookUrl), type == "outlook" {
        return outlookUrl
    }
    
    return defaultUrl
}
