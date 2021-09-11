//
//  LiTtyApp.swift
//  LiTty
//
//  Created by 土田妃華 on 2021/09/02.
//
//

import SwiftUI
import Amplify
//import AWSAPIPlugin
import AWSDataStorePlugin

func configureAmplify(){
    let models = AmplifyModels()
    //let apiPlugin = AWSAPIPlugin(modelRegistration: models)
    let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())
    Amplify.Logging.logLevel = .info
    do {
        //try Amplify.add(plugin: AWSAPIPlugin())
        try Amplify.add(plugin: dataStorePlugin)
        try Amplify.configure()
        print("Initialized Amplify")
    } catch {
        print("Could not initialize Amplify: \(error)")
    }

}

@main
struct LiTtyApp: App {
    var body: some Scene {
        WindowGroup {
         MemoEditorView()
         .environmentObject(CountTimer())
        }
    }
    public init(){
        configureAmplify()
    }
}

