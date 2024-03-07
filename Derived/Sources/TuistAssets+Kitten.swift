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
public enum KittenAsset {
  public static let accentColor = KittenColors(name: "AccentColor")
  public static let grayScale100 = KittenColors(name: "grayScale100")
  public static let grayScale200 = KittenColors(name: "grayScale200")
  public static let grayScale300 = KittenColors(name: "grayScale300")
  public static let grayScale400 = KittenColors(name: "grayScale400")
  public static let grayScale50 = KittenColors(name: "grayScale50")
  public static let grayScale500 = KittenColors(name: "grayScale500")
  public static let grayScale600 = KittenColors(name: "grayScale600")
  public static let grayScale700 = KittenColors(name: "grayScale700")
  public static let grayScale800 = KittenColors(name: "grayScale800")
  public static let grayScale900 = KittenColors(name: "grayScale900")
  public static let main = KittenColors(name: "main")
  public static let secondary = KittenColors(name: "secondary")
  public static let commentIconYellow = KittenImages(name: "comment-icon-yellow")
  public static let heartIconRed = KittenImages(name: "heart-icon-red")
  public static let house = KittenImages(name: "House")
  public static let checkinIcon = KittenImages(name: "checkin-icon")
  public static let communityIcon = KittenImages(name: "community-icon")
  public static let homeIcon = KittenImages(name: "home-icon")
  public static let mypageIcon = KittenImages(name: "mypage-icon")
  public static let appButtonColor = KittenColors(name: "appButtonColor")
  public static let appleLoginButton = KittenImages(name: "apple-login-button")
  public static let arrowRightBlack = KittenImages(name: "arrow-right-black")
  public static let arrowRightGray = KittenImages(name: "arrow-right-gray")
  public static let boardComment = KittenImages(name: "board_comment")
  public static let boardHeart = KittenImages(name: "board_heart")
  public static let catSample = KittenImages(name: "cat-sample")
  public static let chatIcon = KittenImages(name: "chat-icon")
  public static let deleteIcon = KittenImages(name: "delete-icon")
  public static let detailIcon = KittenImages(name: "detail-icon")
  public static let dogncatBlack = KittenImages(name: "dogncat-black")
  public static let dogncatWhite = KittenImages(name: "dogncat-white")
  public static let editIcon = KittenImages(name: "edit-icon")
  public static let kakaoLoginButton = KittenImages(name: "kakao-login-button")
  public static let animalBlack = KittenImages(name: "animalBlack")
  public static let animalWhite = KittenImages(name: "animalWhite")
  public static let catBlack = KittenImages(name: "catBlack")
  public static let catWhite = KittenImages(name: "catWhite")
  public static let customPersonBlack = KittenImages(name: "customPersonBlack")
  public static let customPersonWhite = KittenImages(name: "customPersonWhite")
  public static let dogBlack = KittenImages(name: "dogBlack")
  public static let dogWhite = KittenImages(name: "dogWhite")
  public static let female = KittenImages(name: "female")
  public static let male = KittenImages(name: "male")
  public static let pawprintBlack = KittenImages(name: "pawprintBlack")
  public static let pawprintWhite = KittenImages(name: "pawprintWhite")
  public static let likeIcon = KittenImages(name: "like-icon")
  public static let naverLoginButton = KittenImages(name: "naver-login-button")
  public static let nestedCommentArrow = KittenImages(name: "nested_comment_arrow")
  public static let ownerBlack = KittenImages(name: "owner-black")
  public static let ownerWhite = KittenImages(name: "owner-white")
  public static let selection = KittenColors(name: "selection")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class KittenColors {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  public private(set) lazy var color: Color = {
      print(name)
    guard let color = Color(asset: self) else {
//      fatalError("Unable to load color asset named \\(name).")
        return .black
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

public extension KittenColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  convenience init?(asset: KittenColors) {
    let bundle = KittenResources.bundle
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
  init(asset: KittenColors) {
    let bundle = KittenResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct KittenImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = KittenResources.bundle
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
  init(asset: KittenImages) {
    let bundle = KittenResources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: KittenImages, label: Text) {
    let bundle = KittenResources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: KittenImages) {
    let bundle = KittenResources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// MARK: - Extension
extension UIColor {
  public static let accentColor = KittenColors(name: "AccentColor").color
  public static let grayScale100 = KittenColors(name: "grayScale100").color
  public static let grayScale200 = KittenColors(name: "grayScale200").color
  public static let grayScale300 = KittenColors(name: "grayScale300").color
  public static let grayScale400 = KittenColors(name: "grayScale400").color
  public static let grayScale50 = KittenColors(name: "grayScale50").color
  public static let grayScale500 = KittenColors(name: "grayScale500").color
  public static let grayScale600 = KittenColors(name: "grayScale600").color
  public static let grayScale700 = KittenColors(name: "grayScale700").color
  public static let grayScale800 = KittenColors(name: "grayScale800").color
  public static let grayScale900 = KittenColors(name: "grayScale900").color
  public static let main = KittenColors(name: "main").color
  public static let secondary = KittenColors(name: "secondary").color
  public static let appButtonColor = KittenColors(name: "appButtonColor").color
  public static let selection = KittenColors(name: "selection").color
}

extension UIImage {
  public static let commentIconYellow = KittenImages(name: "comment-icon-yellow").image
  public static let heartIconRed = KittenImages(name: "heart-icon-red").image
  public static let house = KittenImages(name: "House").image
  public static let checkinIcon = KittenImages(name: "checkin-icon").image
  public static let communityIcon = KittenImages(name: "community-icon").image
  public static let homeIcon = KittenImages(name: "home-icon").image
  public static let mypageIcon = KittenImages(name: "mypage-icon").image
  public static let appleLoginButton = KittenImages(name: "apple-login-button").image
  public static let arrowRightBlack = KittenImages(name: "arrow-right-black").image
  public static let arrowRightGray = KittenImages(name: "arrow-right-gray").image
  public static let boardComment = KittenImages(name: "board_comment").image
  public static let boardHeart = KittenImages(name: "board_heart").image
  public static let catSample = KittenImages(name: "cat-sample").image
  public static let chatIcon = KittenImages(name: "chat-icon").image
  public static let deleteIcon = KittenImages(name: "delete-icon").image
  public static let detailIcon = KittenImages(name: "detail-icon").image
  public static let dogncatBlack = KittenImages(name: "dogncat-black").image
  public static let dogncatWhite = KittenImages(name: "dogncat-white").image
  public static let editIcon = KittenImages(name: "edit-icon").image
  public static let kakaoLoginButton = KittenImages(name: "kakao-login-button").image
  public static let animalBlack = KittenImages(name: "animalBlack").image
  public static let animalWhite = KittenImages(name: "animalWhite").image
  public static let catBlack = KittenImages(name: "catBlack").image
  public static let catWhite = KittenImages(name: "catWhite").image
  public static let customPersonBlack = KittenImages(name: "customPersonBlack").image
  public static let customPersonWhite = KittenImages(name: "customPersonWhite").image
  public static let dogBlack = KittenImages(name: "dogBlack").image
  public static let dogWhite = KittenImages(name: "dogWhite").image
  public static let female = KittenImages(name: "female").image
  public static let male = KittenImages(name: "male").image
  public static let pawprintBlack = KittenImages(name: "pawprintBlack").image
  public static let pawprintWhite = KittenImages(name: "pawprintWhite").image
  public static let likeIcon = KittenImages(name: "like-icon").image
  public static let naverLoginButton = KittenImages(name: "naver-login-button").image
  public static let nestedCommentArrow = KittenImages(name: "nested_comment_arrow").image
  public static let ownerBlack = KittenImages(name: "owner-black").image
  public static let ownerWhite = KittenImages(name: "owner-white").image
}

// swiftlint:enable all
// swiftformat:enable all
