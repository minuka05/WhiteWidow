
--put in your shared lua like this: qb-core > shared > items.lua

["cannabis"] 						 = {["name"] = "cannabis", 			 	  	  	["label"] = "Raw Cannabis", 			["weight"] = 450, 		["type"] = "item", 		["image"] = "cannabis.png", 				["unique"] = false, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Raw Cannabis"},
["skunk"] 						 = {["name"] = "skunk", 			 	  	  	["label"] = "Raw Skunk", 			["weight"] = 450, 		["type"] = "item", 		["image"] = "weedskunk.png", 				["unique"] = false, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Raw Skunk"},
["ak-47"] 						 = {["name"] = "ak-47", 			 	  	  	["label"] = "Raw AK-47", 			["weight"] = 450, 		["type"] = "item", 		["image"] = "weedak47.png", 				["unique"] = false, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Raw AK-47"},
["og-kush"] 						 = {["name"] = "og-kush", 			 	  	  	["label"] = "Raw Og-Kush", 			["weight"] = 450, 		["type"] = "item", 		["image"] = "weedogkush.png", 				["unique"] = false, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Raw Og-Kush"},
["rollingpaper"] 						 = {["name"] = "rollingpaper", 			 	  	  	["label"] = "Rolling Paper For Joints", 			["weight"] = 450, 		["type"] = "item", 		["image"] = "rollingpaper.png", 				["unique"] = false, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Rolling Paper For Joints"},
["bong"] 			         = {["name"] = "bong", 			      	["label"] = "Bong", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "bong.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Bong"},
["weedscissors"] 			         = {["name"] = "weedscissors", 			      	["label"] = "Weed Scissors", 			["weight"] = 1000, 		["type"] = "item", 		["image"] = "weedscissors.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "Weed Scissors"},

--put in your shared lua like this: qb-core > shared > jobs.lua

["whitewidow"] = {
    label = "White Widow",
    defaultDuty = false,
    grades = {
        ['0'] = {
            name = 'Worker',
            payment = 30,
        },
        ['1'] = {
            name = 'Vice Boss',
            payment = 70,
        },
        ['2'] = {
            name = 'Boss',
            payment = 130,
        },
    }
},