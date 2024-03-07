// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

import UIKit

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum KittenUIAsset {
  public static let accentColor = KittenUIColors(name: "AccentColor")
  public static let grayScale100 = KittenUIColors(name: "grayScale100")
  public static let grayScale200 = KittenUIColors(name: "grayScale200")
  public static let grayScale300 = KittenUIColors(name: "grayScale300")
  public static let grayScale400 = KittenUIColors(name: "grayScale400")
  public static let grayScale50 = KittenUIColors(name: "grayScale50")
  public static let grayScale500 = KittenUIColors(name: "grayScale500")
  public static let grayScale600 = KittenUIColors(name: "grayScale600")
  public static let grayScale700 = KittenUIColors(name: "grayScale700")
  public static let grayScale800 = KittenUIColors(name: "grayScale800")
  public static let grayScale900 = KittenUIColors(name: "grayScale900")
  public static let main = KittenUIColors(name: "main")
  public static let secondary = KittenUIColors(name: "secondary")
  public static let commentIconYellow = KittenUIImages(name: "comment-icon-yellow")
  public static let heartIconRed = KittenUIImages(name: "heart-icon-red")
  public static let house = KittenUIImages(name: "House")
  public static let checkinIcon = KittenUIImages(name: "checkin-icon")
  public static let communityIcon = KittenUIImages(name: "community-icon")
  public static let homeIcon = KittenUIImages(name: "home-icon")
  public static let mypageIcon = KittenUIImages(name: "mypage-icon")
  public static let appButtonColor = KittenUIColors(name: "appButtonColor")
  public static let appleLoginButton = KittenUIImages(name: "apple-login-button")
  public static let arrowRightBlack = KittenUIImages(name: "arrow-right-black")
  public static let arrowRightGray = KittenUIImages(name: "arrow-right-gray")
  public static let boardComment = KittenUIImages(name: "board_comment")
  public static let boardHeart = KittenUIImages(name: "board_heart")
  public static let catSample = KittenUIImages(name: "cat-sample")
  public static let chatIcon = KittenUIImages(name: "chat-icon")
  public static let deleteIcon = KittenUIImages(name: "delete-icon")
  public static let detailIcon = KittenUIImages(name: "detail-icon")
  public static let dogncatBlack = KittenUIImages(name: "dogncat-black")
  public static let dogncatWhite = KittenUIImages(name: "dogncat-white")
  public static let editIcon = KittenUIImages(name: "edit-icon")
  public static let kakaoLoginButton = KittenUIImages(name: "kakao-login-button")
  public static let animalBlack = KittenUIImages(name: "animalBlack")
  public static let animalWhite = KittenUIImages(name: "animalWhite")
  public static let catBlack = KittenUIImages(name: "catBlack")
  public static let catWhite = KittenUIImages(name: "catWhite")
  public static let customPersonBlack = KittenUIImages(name: "customPersonBlack")
  public static let customPersonWhite = KittenUIImages(name: "customPersonWhite")
  public static let dogBlack = KittenUIImages(name: "dogBlack")
  public static let dogWhite = KittenUIImages(name: "dogWhite")
  public static let female = KittenUIImages(name: "female")
  public static let male = KittenUIImages(name: "male")
  public static let pawprintBlack = KittenUIImages(name: "pawprintBlack")
  public static let pawprintWhite = KittenUIImages(name: "pawprintWhite")
  public static let likeIcon = KittenUIImages(name: "like-icon")
  public static let naverLoginButton = KittenUIImages(name: "naver-login-button")
  public static let nestedCommentArrow = KittenUIImages(name: "nested_comment_arrow")
  public static let ownerBlack = KittenUIImages(name: "owner-black")
  public static let ownerWhite = KittenUIImages(name: "owner-white")
  public static let selection = KittenUIColors(name: "selection")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class KittenUIColors {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \\(name).")
    }
    return color
  }()

  #if canImport(SwiftUI)
  private var _swiftUIColor: Any? = nil
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
  public private(set) var swiftUIColor: SwiftUI.Color {
    get {
      if self._swiftUIColor == nil {
        self._swiftUIColor = SwiftUI.Color(asset: self)
      }

      return self._swiftUIColor as! SwiftUI.Color
    }
    set {
      self._swiftUIColor = newValue
    }
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension KittenUIColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  convenience init?(asset: KittenUIColors) {
    let bundle = KittenUIResources.bundle
    #if os(iOS) || os(tvOS) || os(visionOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
public extension SwiftUI.Color {
  init(asset: KittenUIColors) {
    let bundle = KittenUIResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct KittenUIImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = KittenUIResources.bundle
    #if os(iOS) || os(tvOS) || os(visionOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \\(name).")
    }
    return result
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
public extension SwiftUI.Image {
  init(asset: KittenUIImages) {
    let bundle = KittenUIResources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: KittenUIImages, label: Text) {
    let bundle = KittenUIResources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: KittenUIImages) {
    let bundle = KittenUIResources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// MARK: - Extension
extension UIColor {
  public static let accentColor = KittenUIColors(name: "AccentColor").color
  public static let grayScale100 = KittenUIColors(name: "grayScale100").color
  public static let grayScale200 = KittenUIColors(name: "grayScale200").color
  public static let grayScale300 = KittenUIColors(name: "grayScale300").color
  public static let grayScale400 = KittenUIColors(name: "grayScale400").color
  public static let grayScale50 = KittenUIColors(name: "grayScale50").color
  public static let grayScale500 = KittenUIColors(name: "grayScale500").color
  public static let grayScale600 = KittenUIColors(name: "grayScale600").color
  public static let grayScale700 = KittenUIColors(name: "grayScale700").color
  public static let grayScale800 = KittenUIColors(name: "grayScale800").color
  public static let grayScale900 = KittenUIColors(name: "grayScale900").color
  public static let main = KittenUIColors(name: "main").color
  public static let secondary = KittenUIColors(name: "secondary").color
  public static let appButtonColor = KittenUIColors(name: "appButtonColor").color
  public static let selection = KittenUIColors(name: "selection").color
}

extension UIImage {
  public static let commentIconYellow = KittenUIImages(name: "comment-icon-yellow").image
  public static let heartIconRed = KittenUIImages(name: "heart-icon-red").image
  public static let house = KittenUIImages(name: "House").image
  public static let checkinIcon = KittenUIImages(name: "checkin-icon").image
  public static let communityIcon = KittenUIImages(name: "community-icon").image
  public static let homeIcon = KittenUIImages(name: "home-icon").image
  public static let mypageIcon = KittenUIImages(name: "mypage-icon").image
  public static let appleLoginButton = KittenUIImages(name: "apple-login-button").image
  public static let arrowRightBlack = KittenUIImages(name: "arrow-right-black").image
  public static let arrowRightGray = KittenUIImages(name: "arrow-right-gray").image
  public static let boardComment = KittenUIImages(name: "board_comment").image
  public static let boardHeart = KittenUIImages(name: "board_heart").image
  public static let catSample = KittenUIImages(name: "cat-sample").image
  public static let chatIcon = KittenUIImages(name: "chat-icon").image
  public static let deleteIcon = KittenUIImages(name: "delete-icon").image
  public static let detailIcon = KittenUIImages(name: "detail-icon").image
  public static let dogncatBlack = KittenUIImages(name: "dogncat-black").image
  public static let dogncatWhite = KittenUIImages(name: "dogncat-white").image
  public static let editIcon = KittenUIImages(name: "edit-icon").image
  public static let kakaoLoginButton = KittenUIImages(name: "kakao-login-button").image
  public static let animalBlack = KittenUIImages(name: "animalBlack").image
  public static let animalWhite = KittenUIImages(name: "animalWhite").image
  public static let catBlack = KittenUIImages(name: "catBlack").image
  public static let catWhite = KittenUIImages(name: "catWhite").image
  public static let customPersonBlack = KittenUIImages(name: "customPersonBlack").image
  public static let customPersonWhite = KittenUIImages(name: "customPersonWhite").image
  public static let dogBlack = KittenUIImages(name: "dogBlack").image
  public static let dogWhite = KittenUIImages(name: "dogWhite").image
  public static let female = KittenUIImages(name: "female").image
  public static let male = KittenUIImages(name: "male").image
  public static let pawprintBlack = KittenUIImages(name: "pawprintBlack").image
  public static let pawprintWhite = KittenUIImages(name: "pawprintWhite").image
  public static let likeIcon = KittenUIImages(name: "like-icon").image
  public static let naverLoginButton = KittenUIImages(name: "naver-login-button").image
  public static let nestedCommentArrow = KittenUIImages(name: "nested_comment_arrow").image
  public static let ownerBlack = KittenUIImages(name: "owner-black").image
  public static let ownerWhite = KittenUIImages(name: "owner-white").image
}

// swiftlint:enable all
// swiftformat:enable all
