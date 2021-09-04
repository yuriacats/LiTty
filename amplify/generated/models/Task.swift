// swiftlint:disable all
import Amplify
import Foundation

public struct Task: Model {
  public let id: String
  public var memo: Memo?
  public var title: String
  public var created_at: Int
  public var deadline: Int?
  public var corrosion_rate: Int?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      memo: Memo? = nil,
      title: String,
      created_at: Int,
      deadline: Int? = nil,
      corrosion_rate: Int? = nil) {
    self.init(id: id,
      memo: memo,
      title: title,
      created_at: created_at,
      deadline: deadline,
      corrosion_rate: corrosion_rate,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      memo: Memo? = nil,
      title: String,
      created_at: Int,
      deadline: Int? = nil,
      corrosion_rate: Int? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.memo = memo
      self.title = title
      self.created_at = created_at
      self.deadline = deadline
      self.corrosion_rate = corrosion_rate
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}