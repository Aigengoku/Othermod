--- MOD_NAME: Stupidity Vouchers
--- MOD_ID: StupidityVouchers
--- MOD_AUTHOR: [Ai gen goku]
--- MOD_DESCRIPTION: Stupidity awaits !```
--- MOD_PREFIX: stupidity_vouchers_v
----------------------------------------------
------------MOD CODE -------------------------
-- Skeleton for creating an object
SMODS.Voucher {
key = 'shinier_foil',
    loc_txt = {
      name = 'Shinier Foil',
      text = {'Foil cards are upgraded'}
   },
   pos = {
      x = 0,
      y = 0
   },
   cost = 15,
   discovered = true,
   atlas = "shinier_foil",
    
    SMODS.Atlas {
        key = "shinier_foil",
        path = "shinier_foil.png",
        px = 71,
        py = 95
    },
}

local Card_apply_to_run_ref = Card.apply_to_run
function Card:apply_to_run(center)
    local center_table = {
    name = center and center.name or self and self.ability.name,
    extra = center and center.config.extra or self and self.ability.extra
    }
    if center_table.name == 'Shinier Foil' then
        for k, v in pairs(G.playing_cards) do
            if v.edition.foil then v:set_edition({e_stup_silver_foil=true}) end
        end
    end
    Card_apply_to_run_ref(self, center)
end
function SMODS.Vouchers.shinier_foil.redeem(center_table)
    local Card_set_edition_ref=Card.set_edition
        function Card:set_edition(edition, immediate, silent)
            if  edition and edition.foil then
                edition={e_stup_silver_foil=true}
                end
                Card_set_edition_ref(self, edition, immediate, silent)
            end
        end

SMODS.Voucher {
key = 'virtual_gold',
    loc_txt = {
      name = 'Virtual Gold',
      text = {'Holographic cards are upgraded'}
   },
   pos = {
      x = 0,
      y = 0
   },
   cost = 15,
   discovered = true,
   atlas = "virtual_gold",
    
    SMODS.Atlas {
        key = "virtual_gold",
        path = "virtual_gold.png",
        px = 71,
        py = 95
    },
}

local Card_apply_to_run_ref = Card.apply_to_run
function Card:apply_to_run(center)
    local center_table = {
    name = center and center.name or self and self.ability.name,
    extra = center and center.config.extra or self and self.ability.extra
    }
    if center_table.name == 'Virtual Gold' then
        for k, v in pairs(G.playing_cards) do
            if v.edition.holo then v:set_edition({e_stup_gold_holographic=true}) end
        end
    end
    Card_apply_to_run_ref(self, center)
end
function SMODS.Vouchers.virtual_gold.redeem(center_table)
    local Card_set_edition_ref=Card.set_edition
        function Card:set_edition(edition, immediate, silent)
            if  edition and edition.holo then
                edition={e_stup_gold_holographic=true}
                end
                Card_set_edition_ref(self, edition, immediate, silent)
            end
        end

SMODS.Voucher {
key = 'sB_129_432',
    loc_txt = {
      name = 'SB-129 4:32',
      text = {'Polychrome cards are upgraded'}
   },
   pos = {
      x = 0,
      y = 0
   },
   cost = 15,
   discovered = true,
   requires={'shinier_foil'},
   atlas = "sB_129_432",
    
    SMODS.Atlas {
        key = "sB_129_432",
        path = "sB_129_432.png",
        px = 71,
        py = 95
    },
}

local Card_apply_to_run_ref = Card.apply_to_run
function Card:apply_to_run(center)
    local center_table = {
    name = center and center.name or self and self.ability.name,
    extra = center and center.config.extra or self and self.ability.extra
    }
    if center_table.name == 'SB-129 4:32' then
        for k, v in pairs(G.playing_cards) do
            if v.edition.polychrome then v:set_edition({e_stup_bismuth_polychrome=true}) end
        end
    end
    Card_apply_to_run_ref(self, center)
end
function SMODS.Vouchers.sB_129_432.redeem(center_table)
    local Card_set_edition_ref=Card.set_edition
        function Card:set_edition(edition, immediate, silent)
            if  edition and edition.holo then
                edition={e_stup_bismuth_polychrome=true}
                end
                Card_set_edition_ref(self, edition, immediate, silent)
            end
        end

SMODS.Voucher {
key = 'opposite_day',
    loc_txt = {
      name = 'Opposite Day',
      text = {'Negative cards are upgraded'}
   },
   pos = {
      x = 0,
      y = 0
   },
   cost = 15,
   discovered = true,
   requires={'virtual_gold'},
   atlas = "opposite_day",
    
    SMODS.Atlas {
        key = "opposite_day",
        path = "opposite_day.png",
        px = 71,
        py = 95
    },
}

local Card_apply_to_run_ref = Card.apply_to_run
function Card:apply_to_run(center)
    local center_table = {
    name = center and center.name or self and self.ability.name,
    extra = center and center.config.extra or self and self.ability.extra
    }
    if center_table.name == 'Opposite Day' then
        for k, v in pairs(G.playing_cards) do
            if v.edition.negative then v:set_edition({e_stup_nil=true}) end
        end
    end
    Card_apply_to_run_ref(self, center)
end
    local Card_set_edition_ref=Card.set_edition
        function Card:set_edition(edition, immediate, silent)
            if  edition and edition.holo then
                edition={e_stup_nil=true}
                end
                Card_set_edition_ref(self, edition, immediate, silent)
            end