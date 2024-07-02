----------------------------------------------
------------MOD CODE -------------------------
-- Skeleton for creating an object
SMODS.ConsumableType {
    key = 'potion',
    shop_rate = 8,
    collection_rows = { 4,4 },
    primary_colour = G.C.CHIPS,
    secondary_colour = G.C.MULT,
    loc_txt = {
        collection = 'Potion',
        name = 'Potion',
        label = 'Potion',
    }
}

SMODS.Consumable {
    key = 'blue_and_red',
    loc_txt = {
        name = 'Blue and Red',
        text = {'A colorful potion may do something handy'
        },
    },
    set = 'potion',
    pos = {x = 0,y = 0}, 
    discovered = true,
    cost = 0,
    rate = 3,
    can_use = function() return true end,
    loc_vars = function(self, info_queue, card)
        return {vars = {1,2,3}}
    end,
    use = function(self,card,area)

        if pseudorandom('blue_and_red') < 1/3 then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
            G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
            ease_discard(-1)
            ease_hands_played(-1)
        else
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
            G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
            ease_discard(1)
            ease_hands_played(1)
        
    end
end,
atlas = 'blue_and_red'
}
SMODS.Atlas {
    key = "blue_and_red",
    path = "blue_and_red.png",
    px = 71,
    py = 95
}

SMODS.Consumable {
    key = 'midas_mix',
    loc_txt = {
        name = 'Midas Mix',
        text = {'A gold potion with rich texture'
        },
    },
    set = 'potion',
    pos = {x = 0,y = 0}, 
    discovered = true,
    cost = 0,
    rate = 2,
    can_use = function() return true end,
    loc_vars = function(self, info_queue, card)
        return {vars = {2,5}}
    end,
    use = function(self,card,area)
        if pseudorandom('midas_mix') < 2/5 then
            G.GAME.dollars = G.GAME.dollars / 2
        else
            G.GAME.dollars = G.GAME.dollars * 2
    end
end,
atlas = 'midas_mix'
}
SMODS.Atlas {
    key = "midas_mix",
    path = "midas_mix.png",
    px = 71,
    py = 95
}

SMODS.Consumable {
    key = 'voucher_vodka',
    loc_txt = {
        name = 'Voucher Vodka',
        text = {'A vodka bottle with perplexing ingredients'
        },
    },
    set = 'potion',
    pos = {x = 0,y = 0}, 
    discovered = true,
    cost = 0,
    rate = 2,
    can_use = function() return true end,
    loc_vars = function(self, info_queue, card)
        return {vars = {G.GAME.probabilities.normal*1,G.GAME.probabilities.normal*2,G.GAME.probabilities.normal*3,10}}
    end,
    use = function(self,card,area)
        if pseudorandom ('voucher_vodka') < G.GAME.probabilities.normal*3/10 then
            randomly_redeem_voucher()
        if pseudorandom ('voucher_vodka') < G.GAME.probabilities.normal*2/10 then
            randomly_redeem_voucher()
        if pseudorandom ('voucher_vodka') < G.GAME.probabilities.normal*1/10 then
            randomly_redeem_voucher()
            end
        end
    end
end,

atlas = 'voucher_vodka'
}
SMODS.Atlas {
    key = "voucher_vodka",
    path = "voucher_vodka.png",
    px = 71,
    py = 95
}
----------------------------------------------
------------MOD CODE END----------------------