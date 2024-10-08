-- Skeleton for creating an object
local Card_set_edition_ref = Card.set_edition
function Card:set_edition(edition,immediate, silent)
    if G.GAME.used_vouchers.v_othe_shinier_foil then
        if edition and edition.foil or edition == "e_foil" then
            edition = "e_othe_silver_foil"
        end
    end
    if G.GAME.used_vouchers.v_othe_virtual_gold then
        if edition and edition.holo or edition == "e_holo" then
            edition = "e_othe_gold_holographic"
        end
    end
    if G.GAME.used_vouchers.v_othe_sB_129_432 then
        if edition and edition.polychrome or edition == "e_polychrome" then
            edition = "e_othe_bismuth_polychrome"
        end
    end
    if G.GAME.used_vouchers.v_othe_opposite_day then
        if edition and edition.negative or edition == "e_negative" then
            edition = "e_othe_nil"
        end
    end
Card_set_edition_ref(self, edition, immediate, silent)
end

SMODS.Voucher {
key = 'shinier_foil',
    loc_txt = {
      name = 'shinier foil',
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
            if v.edition and v.edition.foil then v:set_edition("e_othe_silver_foil") end
        end
        for _, v in pairs(G.jokers.cards) do
            if v.edition and v.edition.foil then v:set_edition("e_othe_silver_foil") end
        end
    end,
    atlas = "shinier_foil"
}
    SMODS.Atlas {
        key = "shinier_foil",
        path = "shinier_foil.png",
        px = 71,
        py = 95
    }

SMODS.Voucher {
key = 'virtual_gold',
    loc_txt = {
      name = 'virtual gold',
      text = {'Holographic cards are upgraded'}
   },
   pos = {
      x = 0,
      y = 0
   },
   cost = 10,
   discovered = true,
   redeem = function(self)
    for _, v in pairs(G.playing_cards) do
        if v.edition and v.edition.holo then v:set_edition("e_othe_gold_holographic") end
    end
    for _, v in pairs(G.jokers.cards) do
        if v.edition and v.edition.holo then v:set_edition("e_othe_gold_holographic") end
    end
end,
atlas = "virtual_gold"
}
SMODS.Atlas {
    key = "virtual_gold",
    path = "virtual_gold.png",
    px = 71,
    py = 95
}

SMODS.Voucher {
key = 'sb_129_432',
    loc_txt = {
      name = 'sb-129 4:32',
      text = {'Polychrome cards are upgraded'}
   },
   pos = {
      x = 0,
      y = 0
   },
   cost = 10,
   discovered = true,
   requires={'v_othe_shinier_foil'},
   redeem = function(self)
    for _, v in pairs(G.playing_cards) do
        if v.edition and v.edition.polychrome then v:set_edition("e_othe_bismuth_polychrome") end
    end
    for _, v in pairs(G.jokers.cards) do
        if v.edition and v.edition.polychrome then v:set_edition("e_othe_bismuth_polychrome") end
    end
end,
atlas = "sb_129_432"
}
SMODS.Atlas {
        key = "sb_129_432",
        path = "sb_129_432.png",
        px = 71,
        py = 95
    }


SMODS.Voucher {
key = 'opposite_day',
    loc_txt = {
      name = 'opposite day',
      text = {'Negative cards are upgraded'}
   },
   pos = {
      x = 0,
      y = 0
   },
   cost = 10 ,
   discovered = true,
   requires={'v_othe_virtual_gold'},
   redeem = function(self)
    for _, v in pairs(G.playing_cards) do
        if v.edition and v.edition.negative then v:set_edition("e_othe_nil") end
    end
    for _, v in pairs(G.jokers.cards) do
        if v.edition and v.edition.negative then v:set_edition("e_othe_nil") end
    end
end,

    atlas = "opposite_day"
}
SMODS.Atlas {
    key = "opposite_day",
    path = "opposite_day.png",
    px = 71,
    py = 95
}

SMODS.Voucher {
    key = 'rng+',
        loc_txt = {
          name = 'Rng+',
          text = {'double chances example {C:green} 1 in 10{} is now {C:green}2 in 10 {}', 'would go good with some drinks'}
       },
       pos = {
          x = 0,
          y = 0
       },
       cost = 10 ,
       discovered = true,
       redeem = function(self)
        for k, v in pairs(G.GAME.probabilities) do 
            G.GAME.probabilities[k] = v*2
       end
    end,
    atlas = "rng+"
}
    SMODS.Atlas {
        key = "rng+",
        path = "shinier_foil.png",
        px = 71,
        py = 95
    }

SMODS.Voucher {
    key = 'rng++',
        loc_txt = {
          name = 'Rng+',
          text = {'double chances once again example{C:green} 2 in 10{} is now {C:green}4 in 10 {}', 'would go really good with some drinks'}
       },
       pos = {
          x = 0,
          y = 0
       },
       cost = 10 ,
       discovered = true,
       requires={'v_othe_rng++'},
       redeem = function(self)
        for k, v in pairs(G.GAME.probabilities) do 
            G.GAME.probabilities[k] = v*2
       end
    end,
    atlas = "rng++"
}
    SMODS.Atlas {
        key = "rng++",
        path = "opposite_day.png",
        px = 71,
        py = 95
    }