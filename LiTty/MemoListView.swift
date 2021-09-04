//
//  MemoListView.swift
//  LiTty
//
//  Created by 土田妃華 on 2021/09/04.
//
//

import SwiftUI
import Amplify
import Foundation



struct MemoListView: View {
    var body: some View {
        Text("Hello, World!")
            .onAppear(){
                self.preformOnAppear()
            }
    }
    func preformOnAppear(){
        let date: Date = Date()
        let unixtime: Int = Int(date.timeIntervalSince1970)
        let item = User(name:"Himeka Tsuchida")
        //let item = Memo(id: "1110",title: "MEMOTEST" , created_at:unixtime)


        Amplify.DataStore.save(item){
            result in
            switch (result){
            case .success(let savedItem):
                print("Saved item: \(savedItem.id)")
            case .failure(let error):
                print("Could not save item to DataStore \(error)")
            }
        }
    }
}


struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView()
    }
}
