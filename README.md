# SwiftUI Playground macOS

This is basically Carson Katri's [reddit-swiftui project](https://github.com/carson-katri/reddit-swiftui) but heavily simplified. The network code was stripped out, decoupled from Reddit, web parsing dependency removed, and repurposed to deal with local data. The multiplatform counterparts were removed as this was made to experiment with functionality of SwiftUI for macOS.

## macOS Specific Features
1. Double click - You can double click on a post to open a new window for the detail view.
2. `NSToolbar` - This is implemented entirely in the `AppDelegate`, and uses standard Cocoa code which interfaces with the SwiftUI views.
3. Selectable cells display information in a view on the right when clicked

<img src="Screenshots/Screenshot1.png" width="800" alt="drawing"/>
<img src="Screenshots/Screenshot2.png"width="400" alt="drawing"/>
