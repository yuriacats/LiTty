// swiftlint:disable all
import Amplify
import Foundation

public struct Memo: Model {
  public let id: String
  public var title: String
  public var user: User?
  public var memo: String?
  public var created_at: Int
  public var tasks: List<Task>?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      title: String,
      user: User? = nil,
      memo: String? = nil,
      created_at: Int,
      tasks: List<Task>? = []) {
    self.init(id: id,
      title: title,
      user: user,
      memo: memo,
      created_at: created_at,
      tasks: tasks,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      title: String,
      user: User? = nil,
      memo: String? = nil,
      created_at: Int,
      tasks: List<Task>? = [],
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.title = title
      self.user = user
      self.memo = memo
      self.created_at = created_at
      self.tasks = tasks
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}