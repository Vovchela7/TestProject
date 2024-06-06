//
//  ProfileView.swift
//  DikidiNour
//
//  Created by Vovchela10 on 05.06.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading) {
                        Text("ВОЙТИ")
                            .font(.headline)
                        Text("Вы сможете записываться и редактировать записи, видеть свои бонусы, баланс и скидки")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
                
                Button(action: {
                    print("Бесплатная версия")
                }) {
                    Text("ВОЙТИ")
                        .bold()
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .padding(.top, 20)
            
            List {
                Section {
                    Button(action: {
                        print("Бесплатная версия")
                    }) {
                        HStack {
                            Text("Поделиться приложением")
                            Spacer()
                            Image(systemName: "square.and.arrow.up")
                        }
                    }
                    
                    NavigationLink(destination: Text("Язык приложения")) {
                        HStack {
                            Text("Язык приложения")
                            Spacer()
                            Text("Русский")
                                .foregroundColor(.gray)
                        }
                    }
                    
                    NavigationLink(destination: Text("Служба поддержки")) {
                        Text("Служба поддержки")
                    }
                }
                
                Section {
                    NavigationLink(destination: Text("Версия приложения 4.3.0")) {
                        Text("Версия приложения 4.3.0")
                    }
                }
                
                Section {
                    VStack(alignment: .leading) {
                        Text("Размещайте услуги бесплатно в каталоге DIKIDI")
                            .font(.headline)
                        Text("DIKIDI Business - автоматизация бизнеса для компаний и частных специалистов")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical)
                }
            }
        }
        .navigationBarTitle("Еще", displayMode: .inline)
    }
}
