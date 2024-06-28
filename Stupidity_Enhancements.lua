----------------------------------------------
------------MOD CODE -------------------------
-- Skeleton for creating an object



-- editions
SMODS.Edition({
    key = 'silver_foil',
    loc_txt = {
        name = 'Silver Foil',
        text = { 
        "{C:chips} +150{} chips",
        }
    },
    shader = "foil",
    discovered = false,
    unlocked = true,
    config = {chips = 150},
    in_shop = true,
    weight = 1,
    extra_cost = 3,
    apply_to_float = true,
    badge_colour = HEX("8585e0"),
    sound = {sound = "foil1", per = 1.2, vol = 0.4},
    loc_vars = function (self, info_queue)
        return { vars = { self.config.chips}}
    end,
})

SMODS.Shader({key = "foil", path = "foil.fs"})





-- editions
SMODS.Edition({
    key = 'gold_holographic',
    loc_txt = {
        name = 'Gold Holographic',
        text = { 
        "{C:mult} +25{} mult",
        }
    },
    shader = "holo",
    discovered = false,
    unlocked = true,
    config = {mult = 25},
    in_shop = true,
    weight = 1,
    extra_cost = 4,
    apply_to_float = true,
    badge_colour = HEX("8585e0"),
    sound = {sound = "foil1", per = 1.2, vol = 0.4},
    loc_vars = function (self, info_queue)
        return { vars = { self.config.mult}}
    end
})

SMODS.Shader({key = "holo", path = "holo.fs"})

SMODS.Edition({
    key = 'bismuth_polychrome',
    loc_txt = {
        name = 'Bismuth Polychrome',
        text = { 
        "{X:mult, C:white} x2.5{} mult",
        }
    },
    shader = "polychrome",
    discovered = false,
    unlocked = true,
    config = {x_mult = 2.5},
    in_shop = true,
    weight = 1,
    extra_cost = 4,
    apply_to_float = true,
    badge_colour = HEX("8585e0"),
    sound = {sound = "foil1", per = 1.2, vol = 0.4},
    loc_vars = function (self, info_queue)
        return { vars = { self.config.x_mult}}
    end
})

SMODS.Shader({key = "polychrome", path = "polychrome.fs"})

SMODS.Edition({
    key = 'nil',
    loc_txt = {
        name = 'Nil',
        text = { 
        "+2 joker slots",
        }
    },
    shader = "negative", "negative_shine",
    discovered = false,
    unlocked = true,
    config = {card_limit = 2},
    in_shop = true,
    weight = 1,
    extra_cost = 4,
    apply_to_float = true,
    badge_colour = HEX("8585e0"),
    sound = {sound = "foil1", per = 1.2, vol = 0.4},
    loc_vars = function (self, info_queue)
        return { vars = { self.config.card_limit}}
    end
})

SMODS.Shader({key = "negative", path = "negative.fs"})
SMODS.Shader({key = "negative_shine", path = "negative_shine.fs"})

----------------------------------------------
------------MOD CODE END----------------------