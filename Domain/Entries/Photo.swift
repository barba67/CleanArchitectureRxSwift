//
//  Photo.swift
//  CleanArchitectureRxSwift
//
//  Created by Andrey Yastrebov on 10.03.17.
//  Copyright © 2017 sergdort. All rights reserved.
//

import Foundation

public struct Photo {
    public let albumId: Int
    public let thumbnailUrl: String
    public let title: String
    public let uid: Int
    public let url: String

    public init(albumId: Int,
                thumbnailUrl: String,
                title: String,
                uid: Int,
                url: String) {
        self.albumId = albumId
        self.thumbnailUrl = thumbnailUrl
        self.title = title
        self.uid = uid
        self.url = url
    }
}

extension Photo: Equatable {
    public static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.uid == rhs.uid &&
            lhs.title == rhs.title &&
            lhs.albumId == rhs.albumId &&
            lhs.url == rhs.url &&
            lhs.thumbnailUrl == rhs.thumbnailUrl
    }
}
