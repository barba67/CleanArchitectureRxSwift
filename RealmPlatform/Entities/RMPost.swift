import QueryKit
import Domain
import RealmSwift
import Realm

final class RMPost: Object {
    dynamic var uid: Int = 0
    dynamic var userId: Int = 0
    dynamic var title: String = ""
    dynamic var body: String = ""

    override class func primaryKey() -> String? {
        return "uid"
    }
}

extension RMPost {
    static var title: Attribute<String> { return Attribute("title")}
    static var body: Attribute<String> { return Attribute("body")}
    static var userId: Attribute<Int> { return Attribute("userId")}
    static var uid: Attribute<Int> { return Attribute("uid")}
}

extension RMPost: DomainConvertibleType {
    func asDomain() -> Post {
        return Post(body: body,
                    title: title,
                    uid: uid,
                    userId: userId)
    }
}

extension Post: RealmRepresentable {
    func asRealm() -> RMPost {
        return RMPost.build { object in
            object.uid = uid
            object.userId = userId
            object.title = title
            object.body = body
        }
    }
}
