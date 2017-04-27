//
//  Constants.swift
//  Roastbook
//
//  Created by Pradeep Choudhary on 3/29/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import Foundation
import UIKit

let APP_DELEGATE : AppDelegate = UIApplication.shared.delegate as! AppDelegate
let KPAGINATION_COUNT = "10"

//Keys
let KKEY_USER_DETAIL = "UserDetail"
let KKEY_USER_NAME = "User_Name"

//Feed model
let KKEY_FEED = "feed"
let KKEY_FEED_NAME = "feedName"

//WEB SERVICES URL
let BASE_URL = "http://myproject-pkc456.boxfuse.io:8080/"
let MIRROR_URL = "user/page/$/limit/" + KPAGINATION_COUNT
