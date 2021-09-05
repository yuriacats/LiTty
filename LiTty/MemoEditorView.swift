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

func getMemo(id:String = "test1998" ) -> Memo {
    //var id: String = "test1998"
    var resultMemo: Memo = Memo(
            id : "test1998",
            title : "テスト投稿です",
            memo : "## テスト用メモになります",
            created_at : 1512975404 )
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
    var body: some View {
    @State var showingPopUp = false
    //@State var memo_id :String = "string"
    @State var memo:Memo =  Memo(
            id : "test1998",
            title : "テスト投稿です",
            memo : "## テスト用メモになります",
            created_at : 1512975404 )
    @State  var showingSeat = false
    @State var master_memo : Document = (memo.memo != nil) ? Document( memo.memo ) : " "
        NavigationView{
            VStack(alignment: .leading){
                Markdown(master_memo)
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
        MemoEditorView()
    }
}
