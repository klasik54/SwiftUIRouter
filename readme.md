# SwiftUI Router

A simple router for SwiftUI apps.

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/klasik54/SwiftUIRouter.git", .upToNextMajor(from: "0.1.0"))
]
```

## Usage - Router

Create a `Router` SwiftUI view and add it to your app's view hierarchy. The `Router` view takes a `Router` object and a closure that returns a view based on the current path.
Define an enum that conforms to `String` and represents the different paths in your app. In the closure, switch on the path and return the appropriate view.

```swift
import SwiftUI
import SwiftUIRouter

enum HomePath: String {

    case home
    case profile
    case favorites

}

struct HomeRouter: View {

    @ObservedObject var router: Router<HomePath> = Router(root: .home)

    var body: some View {
        RouterView(router: router) { path in
            switch path {
            case .home:
                HomeView()

            case .profile:
                ProfileView()

            case .favorites:
                FavoritesView()
            }
        }
    }

}

struct HomeView: View, WithNavigationBarProperties {

    @EnvironmentObject var router: Router<HomePath>

    var navigationTitle: String? { "Home" }

    init() {
        Logger.routingLogger.info("Home View init")
    }

    var body: some View {
        VStack {
            Text("Home")

            Button("Show alert") {
                router.showAlert(AlertModel(
                    title: "Alert title",
                    message: "Alert message",
                    actions: {
                        if Bool.random() {
                            UIAlertAction(
                                title: "True action",
                                style: .default,
                                handler: { _ in
                                    print("Hello")
                                }
                            )
                        } else {
                            UIAlertAction(
                                title: "False action",
                                style: .default
                            )
                        }
                        UIAlertAction(title: "Cancel", style: .cancel)
                    }
                ))
            }

            Button("Show action sheet") {
                router.showAlert(AlertModel(
                    title: "Action sheet title",
                    message: "Action sheet message",
                    prefferdStyle: .actionSheet,
                    actions: {
                        for i in 1...3 {
                            UIAlertAction(
                                title: "Action \(i)",
                                style: .default,
                                handler: { _ in
                                    print("Hello \(i)")
                                }
                            )
                        }
                        UIAlertAction(title: "Cancel", style: .cancel)
                    }
                ))
            }

            Button("Go to profile") {
                router.push(.profile)
            }
        }
    }

}

// In your ContentView.swift

struct ContentView: View {

    @ObservedObject var tabBarProvider = TabBarProvider<Tabs>(selectedTab: .home)

    var body: some View {
        HomeRouter()
    }

}
```

## Usage - TabBar

Define an enum that conforms to `TabType` and represents the different tabs in your app. The enum should have a `view` property that returns a view for the tab, a `tabBarItem` property that returns a `UITabBarItem` for the tab, and an `index` property that returns the index of the tab. In your `ContentView`, create a `TabBarProvider` object and pass it to the `TabBarView` view along with the tabs enum.

```swift
import SwiftUI
import SwiftUITabBar

enum Tabs: Int, TabType, CaseIterable {

    case home
    case favorites

    var index: Int {
        rawValue
    }

    var view: AnyView {
        switch self {
        case .home:
            return AnyView(HomeRouter())

        case .favorites:
            return AnyView(FavoritesRouter())
        }
    }

    var tabBarItem: UITabBarItem {
        switch self {
        case .home:
            return UITabBarItem(
                title: "Home",
                image: UIImage(systemName: "house"),
                tag: 0
            )

        case .favorites:
            return UITabBarItem(
                title: "Favorites",
                image: UIImage(systemName: "star"),
                tag: 1
            )
        }
    }

}


struct ContentView: View {

    @ObservedObject var tabBarProvider = TabBarProvider<Tabs>(selectedTab: .home)

    var body: some View {
        TabBarView(tabs: Tabs.allCases, tabBarProvider: tabBarProvider)
    }

}
```
