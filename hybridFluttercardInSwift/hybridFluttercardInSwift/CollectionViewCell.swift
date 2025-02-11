//
//  CollectionViewCell.swift
//  VWORecordingCrash
//
//  Created by Darko Ivanovic on 1/29/25.
//

import Foundation
import UIKit
import GoogleMobileAds

class CollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var nativeAdPlaceholder: UIView!
	
    var nativeAdView: NativeAdView!
    public var ad: NativeAd?
	
	private func configureUI() {
		if let ad = ad {
			nativeAdPlaceholder.subviews.forEach { $0.removeFromSuperview() }
			guard
				let nibObjects = Bundle.main.loadNibNamed("NativeAdView", owner: nil, options: nil),
                let adView = nibObjects.first as? NativeAdView
			else { return }
			
			setAdView(adView)
			bind(nativeAd: ad)
		}
	}
	
	private var configuredUI = false
	override func layoutSubviews() {
		super.layoutSubviews()
		if !configuredUI {
			configureUI()
			configuredUI = true
		}
	}
	
    public func bind(nativeAd: NativeAd) {
		// Populate the native ad view with the native ad assets.
		// The headline and mediaContent are guaranteed to be present in every native ad.
		(nativeAdView.headlineView as? UILabel)?.text = nativeAd.headline
		nativeAdView.mediaView?.mediaContent = nativeAd.mediaContent

		// These assets are not guaranteed to be present. Check that they are before
		// showing or hiding them.
		(nativeAdView.bodyView as? UILabel)?.text = nativeAd.body
		nativeAdView.bodyView?.isHidden = nativeAd.body == nil

		(nativeAdView.callToActionView as? UIButton)?.setTitle(nativeAd.callToAction, for: .normal)
		nativeAdView.callToActionView?.isHidden = nativeAd.callToAction == nil

		(nativeAdView.iconView as? UIImageView)?.image = nativeAd.icon?.image
		nativeAdView.iconView?.isHidden = nativeAd.icon == nil

		(nativeAdView.storeView as? UILabel)?.text = nativeAd.store
		nativeAdView.storeView?.isHidden = nativeAd.store == nil

		(nativeAdView.advertiserView as? UILabel)?.text = nativeAd.advertiser
		nativeAdView.advertiserView?.isHidden = nativeAd.advertiser == nil
		
		// In order for the SDK to process touch events properly, user interaction should be disabled.
		nativeAdView.callToActionView?.isUserInteractionEnabled = false
		
		// Associate the native ad view with the native ad object. This is
		// required to make the ad clickable.
		// Note: this should always be done after populating the ad views.
		nativeAdView.nativeAd = nativeAd
	}

    public func setAd(_ ad: NativeAd) {
		self.ad = ad
	}
	
    public func setAdView(_ view: NativeAdView) {
		nativeAdView = view
		nativeAdPlaceholder.addSubview(view)
		nativeAdView.translatesAutoresizingMaskIntoConstraints = false
		
		let viewDictionary = ["_nativeAdView": nativeAdView!]
		self.nativeAdPlaceholder.addConstraints(
			NSLayoutConstraint.constraints(
				withVisualFormat: "H:|[_nativeAdView]|",
				options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewDictionary)
		)
		self.nativeAdPlaceholder.addConstraints(
			NSLayoutConstraint.constraints(
				withVisualFormat: "V:|[_nativeAdView]|",
				options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewDictionary)
		)
	}
}
