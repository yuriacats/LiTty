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
    let item = Memo(id: "test",title: title, created_at:unixtime)
    Amplify.DataStore.save(item) { result in
        switch(result) {
        case .success(let savedItem):
            print("Saved item: \(savedItem.created_at)")
        case .failure(let error):
            print("Could not save item to DataStore: \(error)")
        }
    }
    //IDを返す関数にする。
    //使用するのはMemoListの方。これを動かしてからIDをMemoEditorViewに渡す

}

func updateMemo(title:String,memo:String,id:String){

}

func getMemo(id:String = "test1998" ) -> Memo {
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
    @State var showingPopUp = false
    @State var memo_id :String = "string"
    @State var ms_memo :String = ""
    @State var memo:Memo =  Memo(
            id : "test1998",
            title : "LiTty Memo Ver1",
            memo : "## テスト用メモになります",
            created_at : 1512975404 )
    @State  var showingSeat = false
    var body: some View {
        var master_memo : String = ( memo.memo != nil ) ? memo.memo! : ""
        NavigationView{
            VStack(alignment: .leading){
                Markdown(Document(ms_memo))
            }
            .frame(minWidth:0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity, alignment: .topLeading)
            .padding()
            .onTapGesture(count:2){ self.showingSeat.toggle() }
            .navigationBarTitle(memo.title)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    NavigationLink(destination: LTtimerView()){
                        Image(systemName: "paperplane")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {self.showingSeat.toggle() }) {
                    //Button(action: {addMemo(title:"テスト投稿です")}){
                        Image(systemName: "pencil.and.outline")
                    }
                }
            }
            .sheet(isPresented: $showingSeat ){
                EditView(text: $ms_memo )
            }

        }
    }

}

struct EditView: View{
    @Binding var text:String
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        NavigationView{
            VStack{
                TextEditor(text: $text)
                .padding(.bottom)
            }
            .frame(minWidth:0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity, alignment: .topLeading)
            .padding()
            .navigationBarTitle("メモを書く")
            .navigationBarItems(trailing: Button("保存"){
                presentationMode.wrappedValue.dismiss()
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
