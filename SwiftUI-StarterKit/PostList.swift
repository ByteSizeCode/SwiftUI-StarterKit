//
//  PostList.swift
//  Reddit-macOS
//
//  File origionally created by Carson Katri on 7/31/19.
//
//  Code modified by Isaac Raval on 4/28/20.
//  Copyright © 2020 Isaac Raval. All rights reserved.
//

import SwiftUI

struct PostList: View {
    let category: String
    let sortBy: SortBy
    
    //Add cells here
    let listing = [
        Post(title: "Hello World | This is a title", name: "notused", id: "0", selftext: "This is some body content.\nAnd a new line here.", selftext_html: nil, thumbnail: "notused", subtitle: "Subtitle here", author: "Author here.", category: "notused", score: 1000, num_comments: 50, stickied: false, created_utc: Date().timeIntervalSince1970 - 100, preview: nil, tags: ["tag"], is_original_content: false, spoiler: false, replies: nil),
        Post(title: "Hello World2 | This is another title", name: "notused", id: "1", selftext: "This is some body content.\nAnd a new line here.", selftext_html: nil, thumbnail: "notused", subtitle: "Subtitle here", author: "Author here.", category: "notused", score: 1000, num_comments: 50, stickied: false, created_utc: Date().timeIntervalSince1970 - 100, preview: nil, tags: ["tag","other tag"], is_original_content: false, spoiler: false, replies: nil)
    ]
    
    var body: some View {
        List {
            Section(header: Text("\(category) | \(sortBy.rawValue)")) {
                /// Load posts from web and decode as `Listing`
                    ForEach(listing) { post in
                        NavigationLink(destination: PostDetailView(post: post)) {
                            PostView(post: post)
                            .tag(post.id)
                            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                            /// Double-click to open a new window for the `PostDetailView`
                            .onTapGesture(count: 2) {
                                let controller = DetailWindowController(rootView: PostDetailView(post: post))
                                controller.window?.title = post.title
                                controller.showWindow(nil)
                            }
                        }
                    }
                    /// Spinner when loading
//                    SpinnerView()
                
            }
        }
        .listStyle(SidebarListStyle())
    }
}
