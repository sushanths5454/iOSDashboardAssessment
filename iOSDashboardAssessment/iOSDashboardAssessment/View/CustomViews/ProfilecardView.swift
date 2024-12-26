//
//  ProfilecardView.swift
//  iOSDashboardAssessment
//
//  Created by Sushanth on 25/12/24.
//

import SwiftUI

struct ProfilecardView: View {
    var userName: String
    var date: String
    var body: some View {
        HStack() {
            //MARK: Username and Date View
            VStack(alignment: .leading, spacing: 5){
                Text(userName)
                    .modifier(UsernameTextStyle())
                
                Text(date)
                    .modifier(CurrentDateTextStyle())
                
            }
            .frame(height: 80)
            .frame( maxWidth: .infinity, alignment: .leading)
            
            //MARK: Profile icon view
            VStack(alignment: .center) {
                Image("profileIcon")
                    .resizable()
                    .cornerRadius(5)
                    .frame(width: 50,height: 50)
                
            }
            .frame(width: 80)
        }
        .background(Color.white)
        .frame(height: 80)
        .cornerRadius(3)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
             .stroke(.gray.opacity(0.3), lineWidth: 1)
        )
    }
    
}

#Preview {
    ProfilecardView(userName: "Sushanth", date: "1234")
        .previewLayout(.sizeThatFits)
        .padding()
}

struct UsernameTextStyle: ViewModifier {
    
    func body(content: Content) -> some View {
          content
            .fontWeight(.black)
            .multilineTextAlignment(.leading)
            .padding(.leading, 20)
            .lineLimit(1)
            .font(.system(size: 21, weight: .bold))
      }
}

struct CurrentDateTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.leading, 20)
            .lineLimit(1)
            .foregroundColor(.gray)
            .font(.system(size: 14, weight: .bold))
        
    }
}
