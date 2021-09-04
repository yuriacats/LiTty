// swiftlint:disable all
import Amplify
import Foundation

extension Memo {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case title
    case user
    case memo
    case created_at
    case tasks
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let memo = Memo.keys
    
    model.pluralName = "Memos"
    
    model.fields(
      .id(),
      .field(memo.title, is: .required, ofType: .string),
      .belongsTo(memo.user, is: .optional, ofType: User.self, targetName: "memoUserId"),
      .field(memo.memo, is: .optional, ofType: .string),
      .field(memo.created_at, is: .required, ofType: .int),
      .hasMany(memo.tasks, is: .optional, ofType: Task.self, associatedWith: Task.keys.memo),
      .field(memo.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(memo.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}