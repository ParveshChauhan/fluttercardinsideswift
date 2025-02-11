//
//  AdViewController.swift
//  hybridFluttercardInSwift
//
//  Created by Parvesh Chauhan on 11/02/25.
//

//
//  ViewController.swift
//  VWORecordingCrash
//
//  Created by Darko Ivanovic on 1/29/25.
//

import UIKit
import GoogleMobileAds

class AdViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var ads: [NativeAd] = []
    private var adLoader: AdLoader?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        loadAds(count: 20)
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = newBackButton
    }
    
    @objc func back(sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AdCell")
        
        view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ads.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdCell", for: indexPath) as! CollectionViewCell
        
        let ad = ads[indexPath.item]
        cell.setAd(ad)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.collectionView.bounds.width, height: 500)
    }
    
    private func loadAds(count: Int) {
        let multipleAdOptions = MultipleAdsAdLoaderOptions()
        multipleAdOptions.numberOfAds = count
        
        adLoader = AdLoader(
            adUnitID: "ca-app-pub-3940256099942544/3986624511",
            rootViewController: nil,
            adTypes: [.native],
            options: [multipleAdOptions]
        )
        
        adLoader?.delegate = self
        adLoader?.load(Request())
    }
    
}

extension AdViewController: AdLoaderDelegate, NativeAdLoaderDelegate {
    
    func adLoader(_ adLoader: AdLoader, didReceive nativeAd: NativeAd) {
        ads.append(nativeAd)
    }
    
    func adLoaderDidFinishLoading(_ adLoader: AdLoader) {
        print("Finished loading batch of ads. Current ad count: \(ads.count)")
        self.collectionView.reloadData()
        self.collectionView.isHidden = false
    }
    
    func adLoader(_ adLoader: AdLoader, didFailToReceiveAdWithError error: Error) {
        print("Failed to load ads: \(error.localizedDescription)")
    }
}
