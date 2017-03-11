//
//  Debug.swift
//  VManga
//
//  Created by Nguyen Le Vu Long on 3/11/17.
//  Copyright © 2017 mac. All rights reserved.
//

func debug() {
    API.getMangaInfo(manga_id: 13821).then { book in
        print(book)
    }
}
