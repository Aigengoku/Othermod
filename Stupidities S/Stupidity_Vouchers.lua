----------------------------------------------
------------MOD CODE -------------------------
-- Skeleton for creating an object

local Card_set_edition_ref = Card.set_edition
function Card:set_edition(edition,immediate, silent)
    if G.GAME.used_vouchers.v_stup_shinier_foil then
        if edition and edition.foil or edition == "e_foil" then
            edition = "e_stup_silver_foil"
        end
    end
    if G.GAME.used_vouchers.v_stup_virtual_gold then
        if edition and edition.holo or edition == "e_holo" then
            edition = "e_stup_gold_holographic"
        end
    end
    if G.GAME.used_vouchers.v_stup_sB_129_432 then
        if edition and edition.polychrome or edition == "e_polychrome" then
            edition = "e_stup_bismuth_polychrome"
        end
    end
    if G.GAME.used_vouchers.v_stup_opposite_day then
        if edition and edition.negative or edition == "e_negative" then
            edition = "e_stup_nil"
        end
    end
Card_set_edition_ref(self, edition, immediate, silent)
end

atlas = "shinier_foil"

SMODS.Atlas {
    key = "shinier_foil",
    path = "shinier_foil.png",
    px = 71,
    py = 95
}

atlas = "virtual_gold"

SMODS.Atlas {
    key = "virtual_gold",
    path = "virtual_gold.png",
    px = 71,
    py = 95
}

atlas = "sB_129_432"

SMODS.Atlas {
        key = "sB_129_432",
        path = "sB_129_432.png",
        px = 71,
        py = 95
    }

atlas = "opposite_day"

SMODS.Atlas {
    key = "opposite_day",
    path = "opposite_day.png",
    px = 71,
    py = 95
    }

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
   cost = 10,
   discovered = true,
   redeem = function(self)
        for _, v in pairs(G.playing_cards) do
            if v.edition and v.edition.foil then v:set_edition("e_stup_silver_foil") end
        end
        for _, v in pairs(G.jokers.cards) do
            if v.edition and v.edition.foil then v:set_edition("e_stup_silver_foil") end
        end
    end
}

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
   redeem = function(self)
    for _, v in pairs(G.playing_cards) do
        if v.edition and v.edition.holo then v:set_edition("e_stup_gold_holographic") end
    end
    for _, v in pairs(G.jokers.cards) do
        if v.edition and v.edition.holo then v:set_edition("e_stup_gold_holographic") end
    end
end

}

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
   cost = 20,
   discovered = true,
   requires={'v_stup_shinier_foil'},
   redeem = function(self)
    for _, v in pairs(G.playing_cards) do
        if v.edition and v.edition.polychrome then v:set_edition("e_stup_bismuth_polychrome") end
    end
    for _, v in pairs(G.jokers.cards) do
        if v.edition and v.edition.polychrome then v:set_edition("e_stup_bismuth_polychrome") end
    end
end

}

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
   cost = 25 ,
   discovered = true,
   requires={'v_stup_virtual_gold'},
   redeem = function(self)
    for _, v in pairs(G.playing_cards) do
        if v.edition and v.edition.negative then v:set_edition("e_stup_nil") end
    end
    for _, v in pairs(G.jokers.cards) do
        if v.edition and v.edition.negative then v:set_edition("e_stup_nil") end
    end
end
}