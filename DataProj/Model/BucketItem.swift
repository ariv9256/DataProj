//
//  BucketItem.swift
//  DataProj
//
//  Created by Rivas, Angela on 11/30/18.
//  Copyright © 2018 CTEC CSP. All rights reserved.
//

import Foundation

public class BucketItem
{
    let itemContents : String
    let itemAuthor : String
    
    init(contents : String, author : String)
    {
        itemContents = contents
        itemAuthor = author
    }
    lazy var bucketList : [BucketItem] =
        {
            return loadBucketListFromFile()
        }()
    private func loadBucketListFromFile() -> [BucketItem]
    {
        var items = [BucketItem]()
        do
        {
            if let filePath = Bundle.main.url(forResource: "bucket18", withExtension: "csv")
            {
                let input = try String(contentsOf: filePath)
                let bucketLines = input.components(seperatedBy: "\n")
                for line in bucketLines
                {
                    let item = line.components(seperatedBy: ",")
                    items.append(BucketItem(contents: item[0], author: item[1]))
                }
            }
        }
        catch
        {
            print("File load error")
        }
        return items
    }
}
