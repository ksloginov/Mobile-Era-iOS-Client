//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 8 colors.
  struct color {
    /// Color `Freyja Color`.
    static let freyjaColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "Freyja Color")
    /// Color `Odin Color`.
    static let odinColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "Odin Color")
    /// Color `Primary Color`.
    static let primaryColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "Primary Color")
    /// Color `Primary Text Color`.
    static let primaryTextColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "Primary Text Color")
    /// Color `Secondary Text Color`.
    static let secondaryTextColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "Secondary Text Color")
    /// Color `Selection Color`.
    static let selectionColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "Selection Color")
    /// Color `Separator Color`.
    static let separatorColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "Separator Color")
    /// Color `Thor Color`.
    static let thorColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "Thor Color")
    
    /// `UIColor(named: "Freyja Color", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func freyjaColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.freyjaColor, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "Odin Color", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func odinColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.odinColor, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "Primary Color", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func primaryColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.primaryColor, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "Primary Text Color", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func primaryTextColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.primaryTextColor, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "Secondary Text Color", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func secondaryTextColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.secondaryTextColor, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "Selection Color", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func selectionColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.selectionColor, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "Separator Color", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func separatorColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.separatorColor, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "Thor Color", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func thorColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.thorColor, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 1 files.
  struct file {
    /// Resource file `GoogleService-Info.plist`.
    static let googleServiceInfoPlist = Rswift.FileResource(bundle: R.hostingBundle, name: "GoogleService-Info", pathExtension: "plist")
    
    /// `bundle.url(forResource: "GoogleService-Info", withExtension: "plist")`
    static func googleServiceInfoPlist(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.googleServiceInfoPlist
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 17 images.
  struct image {
    /// Image `Add to calendar`.
    static let addToCalendar = Rswift.ImageResource(bundle: R.hostingBundle, name: "Add to calendar")
    /// Image `Add to favorites`.
    static let addToFavorites = Rswift.ImageResource(bundle: R.hostingBundle, name: "Add to favorites")
    /// Image `Remove from favorites`.
    static let removeFromFavorites = Rswift.ImageResource(bundle: R.hostingBundle, name: "Remove from favorites")
    /// Image `checkbox-checked`.
    static let checkboxChecked = Rswift.ImageResource(bundle: R.hostingBundle, name: "checkbox-checked")
    /// Image `checkbox-unchecked`.
    static let checkboxUnchecked = Rswift.ImageResource(bundle: R.hostingBundle, name: "checkbox-unchecked")
    /// Image `filter`.
    static let filter = Rswift.ImageResource(bundle: R.hostingBundle, name: "filter")
    /// Image `github`.
    static let github = Rswift.ImageResource(bundle: R.hostingBundle, name: "github")
    /// Image `info`.
    static let info = Rswift.ImageResource(bundle: R.hostingBundle, name: "info")
    /// Image `logo-white`.
    static let logoWhite = Rswift.ImageResource(bundle: R.hostingBundle, name: "logo-white")
    /// Image `logo`.
    static let logo = Rswift.ImageResource(bundle: R.hostingBundle, name: "logo")
    /// Image `map`.
    static let map = Rswift.ImageResource(bundle: R.hostingBundle, name: "map")
    /// Image `schedule`.
    static let schedule = Rswift.ImageResource(bundle: R.hostingBundle, name: "schedule")
    /// Image `speaker`.
    static let speaker = Rswift.ImageResource(bundle: R.hostingBundle, name: "speaker")
    /// Image `star_filled`.
    static let star_filled = Rswift.ImageResource(bundle: R.hostingBundle, name: "star_filled")
    /// Image `star`.
    static let star = Rswift.ImageResource(bundle: R.hostingBundle, name: "star")
    /// Image `twitter`.
    static let twitter = Rswift.ImageResource(bundle: R.hostingBundle, name: "twitter")
    /// Image `website`.
    static let website = Rswift.ImageResource(bundle: R.hostingBundle, name: "website")
    
    /// `UIImage(named: "Add to calendar", bundle: ..., traitCollection: ...)`
    static func addToCalendar(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.addToCalendar, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "Add to favorites", bundle: ..., traitCollection: ...)`
    static func addToFavorites(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.addToFavorites, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "Remove from favorites", bundle: ..., traitCollection: ...)`
    static func removeFromFavorites(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.removeFromFavorites, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "checkbox-checked", bundle: ..., traitCollection: ...)`
    static func checkboxChecked(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.checkboxChecked, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "checkbox-unchecked", bundle: ..., traitCollection: ...)`
    static func checkboxUnchecked(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.checkboxUnchecked, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "filter", bundle: ..., traitCollection: ...)`
    static func filter(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.filter, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "github", bundle: ..., traitCollection: ...)`
    static func github(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.github, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "info", bundle: ..., traitCollection: ...)`
    static func info(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.info, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "logo", bundle: ..., traitCollection: ...)`
    static func logo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.logo, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "logo-white", bundle: ..., traitCollection: ...)`
    static func logoWhite(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.logoWhite, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "map", bundle: ..., traitCollection: ...)`
    static func map(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.map, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "schedule", bundle: ..., traitCollection: ...)`
    static func schedule(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.schedule, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "speaker", bundle: ..., traitCollection: ...)`
    static func speaker(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.speaker, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "star", bundle: ..., traitCollection: ...)`
    static func star(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.star, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "star_filled", bundle: ..., traitCollection: ...)`
    static func star_filled(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.star_filled, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "twitter", bundle: ..., traitCollection: ...)`
    static func twitter(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.twitter, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "website", bundle: ..., traitCollection: ...)`
    static func website(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.website, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 5 nibs.
  struct nib {
    /// Nib `SessionTableViewCell`.
    static let sessionTableViewCell = _R.nib._SessionTableViewCell()
    /// Nib `SessionTableViewHeader`.
    static let sessionTableViewHeader = _R.nib._SessionTableViewHeader()
    /// Nib `SessionTableViewLegendCell`.
    static let sessionTableViewLegendCell = _R.nib._SessionTableViewLegendCell()
    /// Nib `SessionsDetailsViewController`.
    static let sessionsDetailsViewController = _R.nib._SessionsDetailsViewController()
    /// Nib `SpeakerTableViewCell`.
    static let speakerTableViewCell = _R.nib._SpeakerTableViewCell()
    
    /// `UINib(name: "SessionTableViewCell", in: bundle)`
    static func sessionTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.sessionTableViewCell)
    }
    
    /// `UINib(name: "SessionTableViewHeader", in: bundle)`
    static func sessionTableViewHeader(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.sessionTableViewHeader)
    }
    
    /// `UINib(name: "SessionTableViewLegendCell", in: bundle)`
    static func sessionTableViewLegendCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.sessionTableViewLegendCell)
    }
    
    /// `UINib(name: "SessionsDetailsViewController", in: bundle)`
    static func sessionsDetailsViewController(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.sessionsDetailsViewController)
    }
    
    /// `UINib(name: "SpeakerTableViewCell", in: bundle)`
    static func speakerTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.speakerTableViewCell)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 0 reuse identifiers.
  struct reuseIdentifier {
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 1 view controllers.
  struct segue {
    /// This struct is generated for `ScheduleViewController`, and contains static references to 1 segues.
    struct scheduleViewController {
      /// Segue identifier `filterPopupSegue`.
      static let filterPopupSegue: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, ScheduleViewController, FilterPopupController> = Rswift.StoryboardSegueIdentifier(identifier: "filterPopupSegue")
      
      /// Optionally returns a typed version of segue `filterPopupSegue`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func filterPopupSegue(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, ScheduleViewController, FilterPopupController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.scheduleViewController.filterPopupSegue, segue: segue)
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 3 localization tables.
  struct string {
    /// This `R.string.infoPlist` struct is generated, and contains static references to 1 localization keys.
    struct infoPlist {
      /// nb translation: For å legge til et foredrag i kalenderen trenger vi deg til å gi tilgang til det
      /// 
      /// Locales: nb, en
      static let nsCalendarsUsageDescription = Rswift.StringResource(key: "NSCalendarsUsageDescription", tableName: "InfoPlist", bundle: R.hostingBundle, locales: ["nb", "en"], comment: nil)
      
      /// nb translation: For å legge til et foredrag i kalenderen trenger vi deg til å gi tilgang til det
      /// 
      /// Locales: nb, en
      static func nsCalendarsUsageDescription(_: Void = ()) -> String {
        return NSLocalizedString("NSCalendarsUsageDescription", tableName: "InfoPlist", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    /// This `R.string.localizable` struct is generated, and contains static references to 4 localization keys.
    struct localizable {
      /// en translation: Room
      /// 
      /// Locales: en, nb
      static let room = Rswift.StringResource(key: "room", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "nb"], comment: nil)
      /// en translation: Schedule
      /// 
      /// Locales: en, nb
      static let schedule = Rswift.StringResource(key: "schedule", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "nb"], comment: nil)
      /// en translation: Speakers
      /// 
      /// Locales: en, nb
      static let speakers = Rswift.StringResource(key: "speakers", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "nb"], comment: nil)
      /// en translation: Venue
      /// 
      /// Locales: en, nb
      static let venue = Rswift.StringResource(key: "venue", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "nb"], comment: nil)
      
      /// en translation: Room
      /// 
      /// Locales: en, nb
      static func room(_: Void = ()) -> String {
        return NSLocalizedString("room", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Schedule
      /// 
      /// Locales: en, nb
      static func schedule(_: Void = ()) -> String {
        return NSLocalizedString("schedule", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Speakers
      /// 
      /// Locales: en, nb
      static func speakers(_: Void = ()) -> String {
        return NSLocalizedString("speakers", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Venue
      /// 
      /// Locales: en, nb
      static func venue(_: Void = ()) -> String {
        return NSLocalizedString("venue", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    /// This `R.string.main` struct is generated, and contains static references to 23 localization keys.
    struct main {
      /// en translation: Clear Filters
      /// 
      /// Locales: en
      static let tdDqAXbNormalTitle = Rswift.StringResource(key: "6Td-dq-aXb.normalTitle", tableName: "Main", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Day 1
      /// 
      /// Locales: en
      static let mIdEaRl5SegmentTitles1 = Rswift.StringResource(key: "MId-ea-rl5.segmentTitles[1]", tableName: "Main", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Day 2
      /// 
      /// Locales: en
      static let mIdEaRl5SegmentTitles2 = Rswift.StringResource(key: "MId-ea-rl5.segmentTitles[2]", tableName: "Main", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Information
      /// 
      /// Locales: en
      static let qjrXQY3gTitle = Rswift.StringResource(key: "qjr-xQ-Y3g.title", tableName: "Main", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Information
      /// 
      /// Locales: en
      static let w90Px66mTitle = Rswift.StringResource(key: "w90-px-66m.title", tableName: "Main", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Information
      /// 
      /// Locales: en
      static let woGG8Y5FTitle = Rswift.StringResource(key: "WoG-G8-y5F.title", tableName: "Main", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Information
      /// 
      /// Locales: en
      static let zz7DoNGcTitle = Rswift.StringResource(key: "ZZ7-do-NGc.title", tableName: "Main", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: OK
      /// 
      /// Locales: en
      static let cbF6hULeNormalTitle = Rswift.StringResource(key: "CbF-6h-ULe.normalTitle", tableName: "Main", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Title
      /// 
      /// Locales: en
      static let g5DTKUA6Title = Rswift.StringResource(key: "G5D-tK-UA6.title", tableName: "Main", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Workshops
      /// 
      /// Locales: en
      static let mIdEaRl5SegmentTitles0 = Rswift.StringResource(key: "MId-ea-rl5.segmentTitles[0]", tableName: "Main", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// nb translation: Dagsplan
      /// 
      /// Locales: nb, en
      static let acWDTCKfTitle = Rswift.StringResource(key: "acW-dT-cKf.title", tableName: "Main", bundle: R.hostingBundle, locales: ["nb", "en"], comment: nil)
      /// nb translation: Filter
      /// 
      /// Locales: nb, en
      static let fEbEAMFLText = Rswift.StringResource(key: "fEb-eA-MFL.text", tableName: "Main", bundle: R.hostingBundle, locales: ["nb", "en"], comment: nil)
      /// nb translation: Foredragsholdere
      /// 
      /// Locales: nb, en
      static let cPaGyQ4nTitle = Rswift.StringResource(key: "cPa-gy-q4n.title", tableName: "Main", bundle: R.hostingBundle, locales: ["nb", "en"], comment: nil)
      /// nb translation: Item
      /// 
      /// Locales: nb, en
      static let fj7XZKvSTitle = Rswift.StringResource(key: "Fj7-XZ-KvS.title", tableName: "Main", bundle: R.hostingBundle, locales: ["nb", "en"], comment: nil)
      /// nb translation: Item
      /// 
      /// Locales: nb, en
      static let fu3UAVeGTitle = Rswift.StringResource(key: "Fu3-UA-VeG.title", tableName: "Main", bundle: R.hostingBundle, locales: ["nb", "en"], comment: nil)
      /// nb translation: Item
      /// 
      /// Locales: nb, en
      static let xAc3ZTETTitle = Rswift.StringResource(key: "XAc-3Z-TET.title", tableName: "Main", bundle: R.hostingBundle, locales: ["nb", "en"], comment: nil)
      /// nb translation: Loaded by FirstViewController
      /// 
      /// Locales: nb
      static let a5M7J77LText = Rswift.StringResource(key: "A5M-7J-77L.text", tableName: "Main", bundle: R.hostingBundle, locales: ["nb"], comment: nil)
      /// nb translation: Schedule View
      /// 
      /// Locales: nb
      static let kqz1wVlDText = Rswift.StringResource(key: "KQZ-1w-vlD.text", tableName: "Main", bundle: R.hostingBundle, locales: ["nb"], comment: nil)
      /// nb translation: Speakers View
      /// 
      /// Locales: nb
      static let zEqFUWV5Text = Rswift.StringResource(key: "zEq-FU-wV5.text", tableName: "Main", bundle: R.hostingBundle, locales: ["nb"], comment: nil)
      /// nb translation: Spillested
      /// 
      /// Locales: nb, en
      static let qhNXTVAYTitle = Rswift.StringResource(key: "QhN-xT-vAY.title", tableName: "Main", bundle: R.hostingBundle, locales: ["nb", "en"], comment: nil)
      /// nb translation: Velg emner:
      /// 
      /// Locales: nb, en
      static let lnSX9Ix0Text = Rswift.StringResource(key: "lnS-x9-ix0.text", tableName: "Main", bundle: R.hostingBundle, locales: ["nb", "en"], comment: nil)
      /// nb translation: Venue View
      /// 
      /// Locales: nb
      static let aanFjLO2Text = Rswift.StringResource(key: "aan-fj-lO2.text", tableName: "Main", bundle: R.hostingBundle, locales: ["nb"], comment: nil)
      /// nb translation: Vis bare favorittforelesninger?
      /// 
      /// Locales: nb, en
      static let poOZqGr7Text = Rswift.StringResource(key: "PoO-Zq-gr7.text", tableName: "Main", bundle: R.hostingBundle, locales: ["nb", "en"], comment: nil)
      
      /// en translation: Clear Filters
      /// 
      /// Locales: en
      static func tdDqAXbNormalTitle(_: Void = ()) -> String {
        return NSLocalizedString("6Td-dq-aXb.normalTitle", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Day 1
      /// 
      /// Locales: en
      static func mIdEaRl5SegmentTitles1(_: Void = ()) -> String {
        return NSLocalizedString("MId-ea-rl5.segmentTitles[1]", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Day 2
      /// 
      /// Locales: en
      static func mIdEaRl5SegmentTitles2(_: Void = ()) -> String {
        return NSLocalizedString("MId-ea-rl5.segmentTitles[2]", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Information
      /// 
      /// Locales: en
      static func qjrXQY3gTitle(_: Void = ()) -> String {
        return NSLocalizedString("qjr-xQ-Y3g.title", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Information
      /// 
      /// Locales: en
      static func w90Px66mTitle(_: Void = ()) -> String {
        return NSLocalizedString("w90-px-66m.title", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Information
      /// 
      /// Locales: en
      static func woGG8Y5FTitle(_: Void = ()) -> String {
        return NSLocalizedString("WoG-G8-y5F.title", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Information
      /// 
      /// Locales: en
      static func zz7DoNGcTitle(_: Void = ()) -> String {
        return NSLocalizedString("ZZ7-do-NGc.title", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: OK
      /// 
      /// Locales: en
      static func cbF6hULeNormalTitle(_: Void = ()) -> String {
        return NSLocalizedString("CbF-6h-ULe.normalTitle", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Title
      /// 
      /// Locales: en
      static func g5DTKUA6Title(_: Void = ()) -> String {
        return NSLocalizedString("G5D-tK-UA6.title", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Workshops
      /// 
      /// Locales: en
      static func mIdEaRl5SegmentTitles0(_: Void = ()) -> String {
        return NSLocalizedString("MId-ea-rl5.segmentTitles[0]", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// nb translation: Dagsplan
      /// 
      /// Locales: nb, en
      static func acWDTCKfTitle(_: Void = ()) -> String {
        return NSLocalizedString("acW-dT-cKf.title", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// nb translation: Filter
      /// 
      /// Locales: nb, en
      static func fEbEAMFLText(_: Void = ()) -> String {
        return NSLocalizedString("fEb-eA-MFL.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// nb translation: Foredragsholdere
      /// 
      /// Locales: nb, en
      static func cPaGyQ4nTitle(_: Void = ()) -> String {
        return NSLocalizedString("cPa-gy-q4n.title", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// nb translation: Item
      /// 
      /// Locales: nb, en
      static func fj7XZKvSTitle(_: Void = ()) -> String {
        return NSLocalizedString("Fj7-XZ-KvS.title", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// nb translation: Item
      /// 
      /// Locales: nb, en
      static func fu3UAVeGTitle(_: Void = ()) -> String {
        return NSLocalizedString("Fu3-UA-VeG.title", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// nb translation: Item
      /// 
      /// Locales: nb, en
      static func xAc3ZTETTitle(_: Void = ()) -> String {
        return NSLocalizedString("XAc-3Z-TET.title", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// nb translation: Loaded by FirstViewController
      /// 
      /// Locales: nb
      static func a5M7J77LText(_: Void = ()) -> String {
        return NSLocalizedString("A5M-7J-77L.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// nb translation: Schedule View
      /// 
      /// Locales: nb
      static func kqz1wVlDText(_: Void = ()) -> String {
        return NSLocalizedString("KQZ-1w-vlD.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// nb translation: Speakers View
      /// 
      /// Locales: nb
      static func zEqFUWV5Text(_: Void = ()) -> String {
        return NSLocalizedString("zEq-FU-wV5.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// nb translation: Spillested
      /// 
      /// Locales: nb, en
      static func qhNXTVAYTitle(_: Void = ()) -> String {
        return NSLocalizedString("QhN-xT-vAY.title", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// nb translation: Velg emner:
      /// 
      /// Locales: nb, en
      static func lnSX9Ix0Text(_: Void = ()) -> String {
        return NSLocalizedString("lnS-x9-ix0.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// nb translation: Venue View
      /// 
      /// Locales: nb
      static func aanFjLO2Text(_: Void = ()) -> String {
        return NSLocalizedString("aan-fj-lO2.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      /// nb translation: Vis bare favorittforelesninger?
      /// 
      /// Locales: nb, en
      static func poOZqGr7Text(_: Void = ()) -> String {
        return NSLocalizedString("PoO-Zq-gr7.text", tableName: "Main", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
    try nib.validate()
  }
  
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _SpeakerTableViewCell.validate()
      try _SessionTableViewCell.validate()
    }
    
    struct _SessionTableViewCell: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "SessionTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> SessionTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? SessionTableViewCell
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "star", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'star' is used in nib 'SessionTableViewCell', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    struct _SessionTableViewHeader: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "SessionTableViewHeader"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> SessionTableViewHeader? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? SessionTableViewHeader
      }
      
      fileprivate init() {}
    }
    
    struct _SessionTableViewLegendCell: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "SessionTableViewLegendCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> SessionTableViewLegendCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? SessionTableViewLegendCell
      }
      
      fileprivate init() {}
    }
    
    struct _SessionsDetailsViewController: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "SessionsDetailsViewController"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    struct _SpeakerTableViewCell: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "SpeakerTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> SpeakerTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? SpeakerTableViewCell
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "website", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'website' is used in nib 'SpeakerTableViewCell', but couldn't be loaded.") }
        if UIKit.UIImage(named: "twitter", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'twitter' is used in nib 'SpeakerTableViewCell', but couldn't be loaded.") }
        if UIKit.UIImage(named: "github", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'github' is used in nib 'SpeakerTableViewCell', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
      try launchScreen.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if UIKit.UIImage(named: "logo") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'logo' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
        if UIKit.UIImage(named: "logo-white") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'logo-white' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UITabBarController
      
      let bundle = R.hostingBundle
      let name = "Main"
      
      static func validate() throws {
        if UIKit.UIImage(named: "info") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'info' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "schedule") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'schedule' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "checkbox-checked") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'checkbox-checked' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "map") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'map' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "speaker") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'speaker' is used in storyboard 'Main', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
