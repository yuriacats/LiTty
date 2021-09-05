//
//  MemoEditorView.swift
//  LiTty
//
//  Created by 土田妃華 on 2021/09/04.
//
//

import SwiftUI
import Amplify
import Foundation
import AWSDataStorePlugin
import MarkdownUI

func addMemo(title:String) {
    let unixtime: Int = Int(Date().timeIntervalSince1970)
    let item = Memo(title: title, created_at:unixtime)
    //IDを返す関数にする。
    //使用するのはMemoListの方。これを動かしてからIDをMemoEditorViewに渡す

}

func updateMemo(title:String,memo:String,id:String){

}

func getMemo(id:String) -> Memo {
    var resultMemo : Memo
    Amplify.DataStore.query(Memo.self){
        result in
        switch (result){
        case .success(let memos):
            for memo in memos {
                if memo.id == id {
                    resultMemo = memo
                    break
                }
            }
        case .failure( let error):
            print("Could not query DataStore: error")
        }
    }
    return resultMemo
}

struct MemoEditorView: View {
    @State var showingPopUp = false
    @State var memo_id :String
    @State var memo:Memo = getMemo(id: memo_id)
    @State private var showingSeat = false
    @state var master_memo = (memo.memo != nil) ? memo.memo : ""
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Markdown(  )
            }
            .frame(minWidth:0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity, alignment: .topLeading)
            .padding()
            .onTapGesture(count:2){ self.showingSeat.toggle() }
            .navigationBarTitle(memo.title)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {self.showingSeat.toggle() }) {
                        Image(systemName: "pencil.and.outline")
                    }
                }
            }
            .sheet(isPresented: $showingSeat ){
                EditView(text:"hogehoge" )
            }

        }
    }

}

struct EditView: View{
    @State var text = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        NavigationView{
            VStack{
                TextEditor(text: $text)
                .padding(.bottom)
            }
            .frame(minWidth:0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity, alignment: .topLeading)
            .padding()
            .navigationBarItems(trailing: Button("保存"){
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct ChangeMemoNameView: View{
   @Binding var isPresent: Bool
   @State var title = ""
   var body: some View{
      VStack(spacing: 12){
         Text("タイトルを変更")
         .font(Font.system(size: 18).bold())
          .padding()
          TextField("title", text: $title)
          .padding()
      }
      .frame(width: 280, alignment: .center)
      .padding()
      .background(Color.white)
      .cornerRadius(12)

   }
}

struct MemoEditorView_Previews: PreviewProvider {
    static var previews: some View {
        MemoEditorView(memo_id: "hoge0" )
    }
}
