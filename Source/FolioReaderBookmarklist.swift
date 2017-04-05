//
//  FolioReaderBookmarklist.swift
//  Pods
//
//  Created by Gabriel Vieira on 4/5/17.
//
//

import Foundation
import UIKit


/// Table Of Contents delegate
@objc protocol FolioReaderBookmarkListDelegate: class {
    /**
     Notifies when the user selected some item on menu.
     */
    func bookmarkList(_ bookmark: Bookmark, didSelectRowAtIndexPath indexPath: IndexPath)
    
    /**
     Notifies when chapter list did totally dismissed.
     */
//    func chapterList(didDismissedChapterList chapterList: FolioReaderChapterList)
}

class FolioReaderBookmarklist: UITableViewController {
    weak var delegate: FolioReaderBookmarkListDelegate?
    var bookmarkList = [Bookmark]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        tableView.register(FolioReaderChapterListCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.backgroundColor = isNight(readerConfig.nightModeMenuBackground, readerConfig.menuBackgroundColor)
        tableView.separatorColor = isNight(readerConfig.nightModeSeparatorColor, readerConfig.menuSeparatorColor)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        
        bookmarkList = Bookmark.allByBookId((kBookId as NSString).deletingPathExtension)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarkList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FolioReaderChapterListCell
        
        let bookmark = bookmarkList[(indexPath as NSIndexPath).row]
//        let isSection = tocReference.children.count > 0
        
        cell.indexLabel.text = "geremias"
        
        // Add audio duration for Media Ovelay
//        if let resource = tocReference.resource {
//            if let mediaOverlay = resource.mediaOverlay {
//                let duration = book.durationFor("#"+mediaOverlay)
//                let durationFormatted = (duration != nil ? duration : "")?.clockTimeToMinutesString()
//                
//                cell.indexLabel.text = cell.indexLabel.text! + (duration != nil ? " - "+durationFormatted! : "");
//            }
//        }
//        
//        // Mark current reading chapter
//        if let currentPageNumber = currentPageNumber, let reference = book.spine.spineReferences[safe: currentPageNumber-1] , tocReference.resource != nil {
//            let resource = reference.resource
//            cell.indexLabel.textColor = tocReference.resource == resource ? readerConfig.tintColor : readerConfig.menuTextColor
//        }
        
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.contentView.backgroundColor =  UIColor.clear
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let bookmark = bookmarkList[(indexPath as NSIndexPath).row]
        
        FolioReader.shared.readerCenter?.changePageWith(page: bookmark.page, andFragment: "")
        dismiss()
//        
//        tableView.deselectRow(at: indexPath, animated: true)
//        
//        dismiss {
//            self.delegate?.bookmarkList(bookmark, didSelectRowAtIndexPath: indexPath)
//        }
    }
}
