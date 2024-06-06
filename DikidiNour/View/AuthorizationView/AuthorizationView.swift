//
//  AutorizathionView.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//

import SwiftUI

struct AuthorizationView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Для того, чтобы полностью использовать все возможности мобильного приложения DIKIDI Online, а именно: онлайн-запись, общение в чате, просмотр своих записей, а также возможность оставлять отзывы - необходимо авторизоваться!")
                .multilineTextAlignment(.center)
                .padding()
            Button(action: {
                // Действие для авторизации
            }) {
                Text("Авторизоваться")
                    .bold()
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            Spacer()
            HStack {
                Image(systemName: "house")
                Spacer()
                Image(systemName: "book")
                Spacer()
                Image(systemName: "tag")
                Spacer()
                Image(systemName: "list.bullet")
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 20)
        }
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
    }
}
