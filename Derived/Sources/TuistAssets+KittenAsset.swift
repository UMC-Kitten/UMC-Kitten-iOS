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
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class KittenAssetColors {
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

public extension KittenAssetColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  convenience init?(asset: KittenAssetColors) {
    let bundle = KittenAssetResources.bundle
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
  init(asset: KittenAssetColors) {
    let bundle = KittenAssetResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct KittenAssetImages {
  public fileprivate(set) var name: String
  public init(name: String) {
    self.name = name
  }

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = KittenAssetResources.bundle
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
  init(asset: KittenAssetImages) {
    let bundle = KittenAssetResources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: KittenAssetImages, label: Text) {
    let bundle = KittenAssetResources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: KittenAssetImages) {
    let bundle = KittenAssetResources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// MARK: - Extension
public extension UIColor {
  static let accentColor = KittenAssetColors(name: "AccentColor").color
  static let grayScale100 = KittenAssetColors(name: "grayScale100").color
  static let grayScale200 = KittenAssetColors(name: "grayScale200").color
  static let grayScale300 = KittenAssetColors(name: "grayScale300").color
  static let grayScale400 = KittenAssetColors(name: "grayScale400").color
  static let grayScale50 = KittenAssetColors(name: "grayScale50").color
  static let grayScale500 = KittenAssetColors(name: "grayScale500").color
  static let grayScale600 = KittenAssetColors(name: "grayScale600").color
  static let grayScale700 = KittenAssetColors(name: "grayScale700").color
  static let grayScale800 = KittenAssetColors(name: "grayScale800").color
  static let grayScale900 = KittenAssetColors(name: "grayScale900").color
  static let main = KittenAssetColors(name: "main").color
  static let secondary = KittenAssetColors(name: "secondary").color
  static let appButtonColor = KittenAssetColors(name: "appButtonColor").color
  static let selection = KittenAssetColors(name: "selection").color
}

public extension UIImage {
  static let commentIconYellow = KittenAssetImages(name: "comment-icon-yellow").image
  static let heartIconRed = KittenAssetImages(name: "heart-icon-red").image
  static let house = KittenAssetImages(name: "House").image
  static let checkinIcon = KittenAssetImages(name: "checkin-icon").image
  static let communityIcon = KittenAssetImages(name: "community-icon").image
  static let homeIcon = KittenAssetImages(name: "home-icon").image
  static let mypageIcon = KittenAssetImages(name: "mypage-icon").image
  static let appleLoginButton = KittenAssetImages(name: "apple-login-button").image
  static let arrowRightBlack = KittenAssetImages(name: "arrow-right-black").image
  static let arrowRightGray = KittenAssetImages(name: "arrow-right-gray").image
  static let boardComment = KittenAssetImages(name: "board_comment").image
  static let boardHeart = KittenAssetImages(name: "board_heart").image
  static let catSample = KittenAssetImages(name: "cat-sample").image
  static let chatIcon = KittenAssetImages(name: "chat-icon").image
  static let deleteIcon = KittenAssetImages(name: "delete-icon").image
  static let detailIcon = KittenAssetImages(name: "detail-icon").image
  static let dogncatBlack = KittenAssetImages(name: "dogncat-black").image
  static let dogncatWhite = KittenAssetImages(name: "dogncat-white").image
  static let editIcon = KittenAssetImages(name: "edit-icon").image
  static let kakaoLoginButton = KittenAssetImages(name: "kakao-login-button").image
  static let animalBlack = KittenAssetImages(name: "animalBlack").image
  static let animalWhite = KittenAssetImages(name: "animalWhite").image
  static let catBlack = KittenAssetImages(name: "catBlack").image
  static let catWhite = KittenAssetImages(name: "catWhite").image
  static let customPersonBlack = KittenAssetImages(name: "customPersonBlack").image
  static let customPersonWhite = KittenAssetImages(name: "customPersonWhite").image
  static let dogBlack = KittenAssetImages(name: "dogBlack").image
  static let dogWhite = KittenAssetImages(name: "dogWhite").image
  static let female = KittenAssetImages(name: "female").image
  static let male = KittenAssetImages(name: "male").image
  static let pawprintBlack = KittenAssetImages(name: "pawprintBlack").image
  static let pawprintWhite = KittenAssetImages(name: "pawprintWhite").image
  static let likeIcon = KittenAssetImages(name: "like-icon").image
  static let naverLoginButton = KittenAssetImages(name: "naver-login-button").image
  static let nestedCommentArrow = KittenAssetImages(name: "nested_comment_arrow").image
  static let ownerBlack = KittenAssetImages(name: "owner-black").image
  static let ownerWhite = KittenAssetImages(name: "owner-white").image
}

// swiftlint:enable all
// swiftformat:enable all
