//
//  Bookmark+Helper.swift
//  Pods
//
//  Created by Gabriel Vieira on 4/5/17.
//
//

import Foundation
import RealmSwift

extension Bookmark {
    
    /**
     Save a Highlight with completion block
     
     - parameter completion: Completion block
     */
    public func persist(_ completion: Completion? = nil) {
        do {
            let realm = try! Realm(configuration: readerConfig.realmConfiguration)
            realm.beginWrite()
            realm.add(self, update: true)
            try realm.commitWrite()
            completion?(nil)
        } catch let error as NSError {
            print("Error on persist bookmark: \(error)")
            completion?(error)
        }
    }
    
    public func remove() {
        do {
            let realm = try! Realm(configuration: readerConfig.realmConfiguration)
            realm.beginWrite()
            realm.delete(self)
            try realm.commitWrite()
        } catch let error as NSError {
            print("Error on remove bookmark: \(error)")
        }
    }
    
    /**
     Return a list of Highlights with a given ID
     
     - parameter bookId: Book ID
     - parameter page:   Page number
     
     - returns: Return a list of Highlights
     */
    public static func allByBookId(_ bookId: String) -> [Bookmark] {
        var bookmarks: [Bookmark]?
        let predicate = NSPredicate(format: "bookId = %@", bookId)
        let realm = try! Realm(configuration: readerConfig.realmConfiguration)
        bookmarks = realm.objects(Bookmark.self).filter(predicate).toArray(Bookmark.self)
        return bookmarks!
    }
    
    public static func bookmarkByChapterName(_ chapterName: String) -> Bookmark? {
        var bookmarks: [Bookmark]?
        let predicate = NSPredicate(format: "chapterName = %@", chapterName)
        let realm = try! Realm(configuration: readerConfig.realmConfiguration)
        bookmarks = realm.objects(Bookmark.self).filter(predicate).toArray(Bookmark.self)

        if (bookmarks!.count != 0){
            return bookmarks?[0]
        }
        else
        {
            return nil
        }
    }
    
    
    public static func bookmarkByBookIdAndPage(_ bookId: String, andPage page: NSNumber? = nil) -> Bookmark? {
        var bookmarks: [Bookmark]?
        let predicate = (page != nil) ? NSPredicate(format: "bookId = %@ && page = %@", bookId, page!) : NSPredicate(format: "bookId = %@", bookId)
        let realm = try! Realm(configuration: readerConfig.realmConfiguration)
        bookmarks = realm.objects(Bookmark.self).filter(predicate).toArray(Bookmark.self)
        
        if (bookmarks!.count != 0){
            return bookmarks?[0]
        }
        else
        {
            return nil
        }
        
    }
    
}
