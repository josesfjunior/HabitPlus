//
//  SplashView.swift
//  HabitPlus
//
//  Created by José Júnior on 15/06/23.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        Group{
            switch viewModel.uistate {
            case .loading:
                loadingView()
            case .goToSignInScreen:
                viewModel.signInView()
            case .gotoHomeScreen:
                Text("Home Screen")
            case .error(let msg):
               loadErrorView(err: msg)
            }
        }.onAppear(perform: {
            viewModel.onAppear()
        })
    }
}

extension SplashView{
    func loadingView() -> some View{
        VStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(15)
                .background(Color.white)
                .ignoresSafeArea()
        }
    }
    
    func loadErrorView(err: String) -> some View {
     Text("")
            .alert(isPresented: .constant(true)){
                Alert(title: Text("Houve um error ao inicia a aplicação"), message: Text(err), dismissButton: .default(Text("Ok")){
                    //Vai fazer algo
                })
            }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(viewModel: SplashViewModel() )
    }
}

