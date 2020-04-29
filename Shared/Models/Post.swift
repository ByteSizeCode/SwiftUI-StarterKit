//
//  Post.swift
//  Reddit
//
//  Created by Carson Katri on 7/21/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import Foundation

/// A post from the Reddit API
struct Post: Decodable, Identifiable {
    let title: String
    let name: String
    let id: String
    /// The body of the post
    let selftext: String
    let selftext_html: String?
    let thumbnail: String
    let subtitle: String
    let author: String
    let category: String
    let score: Int
    let num_comments: Int
    let stickied: Bool
    let created_utc: Double
    let preview: Preview?
    
    let tags: [String]
    let is_original_content: Bool
    let spoiler: Bool
    
    var flairs: [String] {
        var res: [String] = []
        if !tags.isEmpty {
            res = tags
        }
        if is_original_content {
            res.append("Origional")
        }
        if spoiler {
            res.append("Spoiler")
        }
        return res
    }
    
    let replies: [Self]?
    
    struct Preview: Decodable {
        let images: [PreviewImage]
        let enabled: Bool
        
        struct PreviewImage: Decodable {
            let source: ImageSource
            let resolutions: [ImageSource]
            let id: String
            
            struct ImageSource: Decodable {
                let url: String
                let width: Int
                let height: Int
            }
        }
    }
}

#if DEBUG
extension Post {
    /// Used to create a Post for example Debug purposes
    static var example: Self {
        return Post(title: "Hello World | This is secondary text", name: "hello-world", id: "hw", selftext: "This is some body content. Blah blah\nblah blah blah", selftext_html: nil, thumbnail: "blahblah", subtitle: "", author: "me", category: "swift", score: 1000, num_comments: 50, stickied: true, created_utc: Date().timeIntervalSince1970 - 100, preview: nil, tags: ["Hello World"], is_original_content: true, spoiler: false, replies: nil)
    }
}
#endif
