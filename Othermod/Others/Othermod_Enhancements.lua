----------------------------------------------
------------MOD CODE -------------------------
-- Skeleton for creating an object



-- editions
SMODS.Edition({
    key = 'eremilium',
    loc_txt = {
        name = 'Eremilium',
        label = "Eremilium",
        text = { 
        "{X:mult,C:white} x1.3{} mult,{C:chips} +40 {}chips and {C:mult}+7{} mult"
        }
    },
    shader = "holo2",
    config = {mult = 7, x_mult = 1.3, chips = 40},
    extra_cost = 7,
    weight = 3,
    badge_colour = HEX("8585e0"),
    sound = {sound = "foil1", per = 1.2, vol = 0.4},
    loc_vars = function (self, info_queue)
        return { vars = {self.config.mult, self.config.x_mult, self.config.chips}}
    end
})

SMODS.Shader({key = "holo2", path = "holo2.fs"})

SMODS.Edition({
    key = 'silver_foil',
    loc_txt = {
        name = 'Silver Foil',
        label = "Silver Foil",
        text = { 
        "{C:chips}+#1#{} chips",
        }
    },
    shader = "foil",
    config = {chips = 150},
    extra_cost = 3,
    badge_colour = HEX("8585e0"),
    sound = {sound = "foil1", per = 1.2, vol = 0.4},
    loc_vars = function (self, info_queue)
        return { vars = {self.config.chips}}
    end
})

SMODS.Shader({key = "foil", path = "foil.fs"})

SMODS.Edition({
    key = 'gold_holographic',
    loc_txt = {
        name = 'Gold Holographic',
        label = "Gold Holographic",
        text = { 
        "{C:mult}+#1#{} mult",
        }
    },
    shader = "holo",
    config = {mult = 25},
    extra_cost = 3,
    badge_colour = HEX("8585e0"),
    sound = {sound = "foil1", per = 1.2, vol = 0.4},
    loc_vars = function (self, info_queue)
        return { vars = {self.config.mult}}
    end
})

SMODS.Shader({key = "holo", path = "holo.fs"})

SMODS.Edition({
    key = 'bismuth_polychrome',
    loc_txt = {
        name = 'Bismuth Polychrome',
        label = "Bismuth Polychrome",
        text = { 
        " {X:mult,C:white}x2.5{} mult ",
         }
    },
    shader = "polychrome",
    config = {x_mult = 2.5},
    extra_cost = 3,
    badge_colour = HEX("8585e0"),
    sound = {sound = "foil1", per = 1.2, vol = 0.4},
    loc_vars = function (self, info_queue)
        return { vars = {self.config.x_mult}}
    end
})

SMODS.Shader({key = "polychrome", path = "polychrome.fs"})

SMODS.Edition({
    key = 'nil',
    loc_txt = {
        name = 'Nil',
        label = "Nil",
        text = { 
        "+2 joker slots",
        }
    },
    shader = "negative",
    config = {card_limit = 2},
    extra_cost = 3,
    apply_to_float = true,
    badge_colour = HEX("8585e0"),
    sound = {sound = "foil1", per = 1.2, vol = 0.4},
    loc_vars = function (self, info_queue)
        return { vars = { self.config.card_limit}}
    end
})

SMODS.Shader({key = "negative", path = "negative.fs"})


----------------------------------------------
------------MOD CODE END----------------------