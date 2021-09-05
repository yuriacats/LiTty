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


func addMemoFiles() {
}

func resetMemoFiles(){

}
func catchMemoFiles() -> [Memo] {
    var resultMemos : [Memo] = []
    Amplify.DataStore.query(Memo.self){
        result in
        switch (result){
        case .success(let memos):
            for memo in memos {
                resultMemos.append(memo)
            }
        case .failure( let error):
            print("Could not query DataStore: error")
        }
    }
    return resultMemos
}

struct MemoListView: View {
    var memos : [Memo] = catchMemoFiles()
    var body: some View {
        NavigationView{
           List(memos){  Content in
               NavigationLink(destination: MemoEditorView(memo_id:Content.id)){
                   VStack(alignment: .leading){
                       Text( Content.title).font(.headline)
                   }
               }
           }
        }.navigationBarTitle("LT memos")
    }

}


struct MemoListView_Previews: PreviewProvider {
        static var previews: some View {
            MemoListView()
        }
    }
