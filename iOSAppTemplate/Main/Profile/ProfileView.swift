//
//  ProfileView.swift
//  iOSAppTemplate
//
//  Created by MAC43 on 18/06/22.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    @EnvironmentObject var appState: AppState
    
    @State private var email: String = "martin1908@gmail.com"
    @State private var name: String = "Martin Romani"
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15) {
                Image("yato")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(maxWidth: 100)
                Text(name)
                    .font(.system(size: 26, weight: .black))
                Text(email)
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
                
                HStack {
                    Button {
                        print("Update Profile")
                    } label: {
                        Text("Update Profile")
                            .padding()
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                    }
                    .frame(maxWidth: .infinity)
                    .background(.pink)
                    .cornerRadius(8)
                    Spacer()
                    Button {
                        print("Update Profile")
                    } label: {
                        Text("Follow")
                            .padding()
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                    }
                    .frame(maxWidth: .infinity)
                    .background(.gray)
                    .cornerRadius(8)
                }
                
                Spacer()
                
                VStack {
                    Divider()
                    Button {
                        try? Auth.auth().signOut()
                        appState.currentScreen = .signIn
                    } label: {
                        Text("Sign Out")
                            .foregroundColor(.pink)
                    }
                }.padding(.bottom)
                
            }.padding()
            .navigationTitle("Profile")
        }
        .onAppear {
            let user = Auth.auth().currentUser
            name = user?.displayName ?? "not name"
            email = user?.email ?? "no email"
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
