//
//  HHHomeViewController.swift
//  VManga
//
//  Created by mac on 3/11/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class HHHomeViewController: UIViewController {

    var tView : HHHomeView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBooks()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBooks(){
        var topBooks = [Book]()
        var lastestBooks = [Book]()
        API.getTop().then { (top) -> Void in
            API.getLatest().then { (lastest) -> Void in
                for book in top {
                    topBooks.append(book)
                }
                for book in lastest {
                    lastestBooks.append(book)
                }
                self.tView = Bundle.main.loadNibNamed("HHHomeView", owner: nil, options: nil)?.first as! HHHomeView
                self.tView.lastestBooks = lastestBooks
                self.tView.topBooks = topBooks
                self.tView.setUp()
                self.view.addSubview(self.tView)
                
                }.catch { e in
            }
            }.catch { e in
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}