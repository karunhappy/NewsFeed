//
//  ViewController.swift
//  NewsFeedDemo
//
//  Created by Karun Aggarwal on 26/12/21.
//

import UIKit

class ViewController: UIViewController {
    //: - IBoutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionviewTitles: UICollectionView!
    //: - Properties
    var viewModel = HomeViewModel()
    var arrayNews: [NewsDetail]?
    var selectedIndex = 1
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "News Feed"
        viewModel.delegate = self
        // register collection view
        let nib = UINib(nibName: String(describing: HomeTopCollectionCell.self), bundle: nil)
        collectionviewTitles.register(nib, forCellWithReuseIdentifier: String(describing: HomeTopCollectionCell.self))
        // register table view
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableCell")
        viewModel.getDashboard()
    }
}
// MARK: - ViewController methods
extension ViewController {
    func reloadTable() {
        DispatchQueue.main.async { [weak self] in
            guard let weakSelf = self else { return }
            if weakSelf.selectedIndex == 0 {
                weakSelf.arrayNews = weakSelf.viewModel.dataModel?.breakingNews
            } else if weakSelf.selectedIndex == 1 {
                weakSelf.arrayNews = weakSelf.viewModel.dataModel?.topNews
            } else if weakSelf.selectedIndex == 2 {
                var daily = [NewsDetail]()
                daily.append(contentsOf: weakSelf.viewModel.dataModel?.dailyBriefings?.asia ?? [])
                daily.append(contentsOf: weakSelf.viewModel.dataModel?.dailyBriefings?.eu ?? [])
                daily.append(contentsOf: weakSelf.viewModel.dataModel?.dailyBriefings?.us ?? [])
                
                weakSelf.arrayNews = daily
            } else if weakSelf.selectedIndex == 3 {
                weakSelf.arrayNews = weakSelf.viewModel.dataModel?.technicalAnalysis
            } else {
                weakSelf.arrayNews = weakSelf.viewModel.dataModel?.specialReport
            }
            weakSelf.tableView.reloadData()
            
            // Reload collection view & scroll to selected index
            weakSelf.collectionviewTitles.reloadData()
            weakSelf.collectionviewTitles.layoutIfNeeded()
            if let rect = weakSelf.collectionviewTitles.layoutAttributesForItem(at: IndexPath(row: weakSelf.selectedIndex, section: 0))?.frame {
                weakSelf.collectionviewTitles.scrollRectToVisible(rect, animated: true)
            }
        }
    }
}
extension ViewController: HomeDelegate {
    func fetchNews() {
        reloadTable()
    }
}
// Table View Data Source & Delegate Methods
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    // Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayNews?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = self.arrayNews?[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: NewsDetailVC.self)) as! NewsDetailVC
        vc.detailModel = self.arrayNews?[indexPath.row]
        self.navigationController?.show(vc, sender: nil)
    }
}
// Collection View Data source & Delegate methods
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    // Data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeTopCollectionCell.self), for: indexPath) as! HomeTopCollectionCell
        cell.title = arrayTitle[indexPath.row]
        cell.showBorder = !(selectedIndex == indexPath.row)
        return cell
    }
    
    // Delegate methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        reloadTable()
    }
}
