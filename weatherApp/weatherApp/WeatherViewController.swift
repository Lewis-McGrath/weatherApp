//
//  ViewController.swift
//  weatherApp
//
//  Created by Lewis McGrath on 13/11/2017.
//  Copyright © 2017 Lewis McGrath. All rights reserved.
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // TODO: Some notes about the data structure
    // Key : Date Reference after DateFormatter shizzle
    // Value : [Model Objects]
    
    
    //Declare my variables
    private var collectionView: UICollectionView!
    let networkClient = NetworkClient()
    let dateFormatter = DateFormatterHelper.weatherDateFormatter()

    var models: [WeatherList]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getDataFromNetworkClient()
        
       // dateString = dateFormatter.string(from: date)
        
        print( "FUCK")//dateString)
        
    }
    
    // MARK: Setup and Constraints
    
    func setupViews() {
        title = String(describing: type(of: self))
        view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        setupCollectionView()
    }
    
    func setupCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPrefetchingEnabled = true
        collectionView.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        
        // Must register a class that cells are instantiated from when reused
        collectionView.register(WeatherInfoCell.self, forCellWithReuseIdentifier: WeatherInfoCell.identifier)
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(70)
            make.bottom.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    // MARK: Network Client Layer
    
    func getDataFromNetworkClient() {
        networkClient.getData() { (weatherResponse: WeatherResponse) in
            self.models = weatherResponse.list
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    // MARK: UICollectionViewDataSource & Delegate
    // Number of rows in a section maybe?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return models?.count ?? 0
    }
    
    //How the cells are sectioned.
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherInfoCell.identifier, for: indexPath) as! WeatherInfoCell
        cell.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        let weather = models![indexPath.row]
        let date = Date(timeIntervalSince1970: weather.date)
        
        cell.configure(with: dateFormatter.string(from: date))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = CGSize(width: collectionView.frame.width, height: 200)
        return size
    }
    
}








