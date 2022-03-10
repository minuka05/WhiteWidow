Config = Config or {}

Config.UseBlips = true

Config.OgKushItemPickUp = 'og-kush'

Config.Job = 'whitewidow'

Config.OgKushItemRecive = 'weed_og-kush'

Config.Ak47ItemPickUp = 'ak-47'

Config.Ak47ItemRecive = 'weed_ak47'

Config.SkunkItemPickUp = 'skunk'

Config.SkunkItemRecive = 'weed_skunk'

Config.WeedItemPickUp = 'cannabis'

Config.WeedItemRecive = 'weed4g'

Config.ScissorsItem = 'weedscissors'

Config.RollingPaperItem = 'rollingpaper'

Config.ColaPrice = 10

Config.ColaContextPrice = "10$"

Config.ColaItem = 'kurkakola'

Config.SnackPrice = 12

Config.SnackItem = 'twerks_candy'

Config.SnackContextPrice = "12$"

Config.WaterPrice = 7

Config.WaterItem = 'water'

Config.WaterContextPrice = "7$"

Config.BongItem = "bong"

Config.UsableItemBong = false --// Want The Bong As A Usable Item? \\--

Config.BlipLocation = {
    {title="White Widow", colour=37, id=140, x = 188.2922, y = -241.0332, z = 54.070499},  -- White Widow
}

--// Shop Items You Can Add As Many As You Like \\--
Config.Items = {
    label = "White Widow Shop",
    slots = 5,
    items = {
        [1] = {
            name = "empty_weed_bag",
            price = 5,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weedscissors",
            price = 5,
            amount = 10,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "rollingpaper",
            price = 5,
            amount = 10,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "bong",
            price = 5,
            amount = 10,
            info = {},
            type = "item",
            slot = 4,
        },
        --[[[5] = {
            name = "joint",
            price = 5,
            amount = 10,
            info = {},
            type = "item",
            slot = 5,
        },--]]
    }
}