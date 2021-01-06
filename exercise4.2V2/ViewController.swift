//
//  ViewController.swift
//  exercise4.2V2
//
//  Created by Scores_Main_User on 1/6/21.
//

import UIKit

class ViewController: UIViewController
{

    var dataSource: [String] = [String]()
    var lastIndex: Int = 14

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self

        for index in 1...lastIndex
        {
            self.dataSource.append("\(index)")
        }
    }

    @IBAction func addCellPressed(_ sender: UIButton)
    {

        print("add cell")
        lastIndex += 1
        let lastIndexString: String = "\(lastIndex)"
        self.dataSource.append(lastIndexString)
        let indexPath: IndexPath = IndexPath(item: self.dataSource.count - 1, section: 0)
        self.collectionView.insertItems(at: [indexPath])
    }

}

extension ViewController: UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("deleting at \(indexPath)")
        self.dataSource.remove(at: indexPath.row)
        self.collectionView.deleteItems(at: [indexPath])
    }


}

extension ViewController: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        var cell = UICollectionViewCell()

        if let numberCell: MyCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? MyCollectionViewCell
        {
            numberCell.configure(with: dataSource[indexPath.row])
            cell = numberCell
        }
        return cell
    }

}


