-- Skeleton for creating an object
function randomly_redeem_voucher(no_random_please) -- xD
    -- local voucher_key = time==0 and "v_voucher_bulk" or get_next_voucher_key(true)
    -- time=1
    local voucher_key = no_random_please or get_next_voucher_key(true)
    local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
    G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W, G.CARD_H, G.P_CARDS.empty, G.P_CENTERS[voucher_key],{bypass_discovery_center = true, bypass_discovery_ui = true})
    card:start_materialize()
    G.play:emplace(card)
    card.cost=0
    card.shop_voucher=false
    local current_round_voucher=G.GAME.current_round.voucher
    card:redeem()
    G.GAME.current_round.voucher=current_round_voucher -- keep the shop voucher unchanged since the voucher bulk may be from voucher pack or other non-shop source
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        --blockable = false,
        --blocking = false,
        delay =  0,
        func = function() 
            card:start_dissolve()
            return true
        end}))   
end

function randomly_create_joker(jokers_to_create,tag,message,extra)
    extra=extra or {}
    G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
    G.E_MANAGER:add_event(Event({
        func = function() 
            for i = 1, jokers_to_create do
                local card = create_card('Joker', G.jokers, nil, 0, nil, nil, nil, tag)
                card:add_to_deck()
                if extra.edition~=nil then
                    card:set_edition(extra.edition,true,false)
                end
                G.jokers:emplace(card)
                card:start_materialize()
                G.GAME.joker_buffer = 0
            
                if message~=nil then
                    card_eval_status_text(card,'jokers',nil,nil,nil,{message=message})
                end
            end
            return true
        end}))   
end
-- Borrowed from betmma
    -- function Card:redeem() -- use redeem instead of apply to run because redeem happens before modification of used_vouchers


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
        text = {'A colorful potion that may do something handy'
        },
    },
    set = 'potion',
    pos = {x = 0,y = 0}, 
    discovered = true,
    cost = 2,
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
    key = 'backpack_brandy',
    loc_txt = {
        name = 'Backpack Brandy',
        text = {'A brand that seems to clear the way'
        },
    },
    set = 'potion',
    pos = {x = 0,y = 0}, 
    discovered = true,
    cost = 2,
    rate = 3,
    can_use = function() return true end,
    loc_vars = function(self, info_queue, card)
        return {vars = {1,2,3}}
    end,
    use = function(self,card,area)

        if pseudorandom('backpack_brandy') < 1/3 then
            G.hand.config.card_limit = G.hand.config.card_limit - 1 
            G.jokers.config.card_limit = G.jokers.config.card_limit - 1
        else
            G.hand.config.card_limit = G.hand.config.card_limit + 1
            G.jokers.config.card_limit = G.jokers.config.card_limit + 1
        
    end
end,
atlas = "backpack_brandy"
}
SMODS.Atlas {
key = 'backpack_brandy',
path = 'backpack_brandy.png',
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
    cost = -1,
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
    cost = 4,
    rate = 1,
    can_use = function() return true end,
    loc_vars = function(self, info_queue, card)
        return {vars = {G.GAME.probabilities.normal*1,G.GAME.probabilities.normal*2,G.GAME.probabilities.normal*3,10}}
    end,
    use = function(self,card,area)
        local Card_redeem_ref = Card.redeem
        if pseudorandom ('voucher_vodka') < G.GAME.probabilities.normal*4/10 then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay =  0,
                func = function() 
                    randomly_redeem_voucher()
                    return true
                end})) 
        if pseudorandom ('voucher_vodka') < G.GAME.probabilities.normal*3/10 then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay =  0,
                func = function() 
                    randomly_redeem_voucher()
                    return true
                end}))
        if pseudorandom ('voucher_vodka') < G.GAME.probabilities.normal*2/10 then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay =  0,
                func = function() 
                    randomly_redeem_voucher()
                    return true
                end}))
        if pseudorandom ('voucher_vodka') < G.GAME.probabilities.normal*1/10 then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay =  0,
                func = function() 
                    randomly_redeem_voucher()
                    return true
                end}))
        end
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

SMODS.Consumable {
    key = 'joker_juice',
    loc_txt = {
        name = 'Joker Juice',
        text = {'A juicebox that tastes funny'
        },
    },
    set = 'potion',
    pos = {x = 0,y = 0}, 
    discovered = true,
    cost = 5,
    rate = 2,
    can_use = function() return true end,
    loc_vars = function(self, info_queue, card)
        return {vars = {1,2,4,8}}
    end,
    use = function(self,card,area)
        local Card_redeem_ref = Card.redeem
        if pseudorandom ('joker_juice') < 1/2 then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay =  0,
                func = function() 
                    local jokers_to_create = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                    randomly_create_joker(jokers_to_create,'target',localize("k_target_generate"),{edition={foil=true}})
                    return true
                end})) 
            elseif pseudorandom ('joker_juice') < 1/4 then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay =  0,
                func = function() 
                    local jokers_to_create = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                    randomly_create_joker(jokers_to_create,'target',localize("k_target_generate"),{edition={holo=true}})
                    return true
                end}))
            elseif pseudorandom ('joker_juice') < 1/8 then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay =  0,
                func = function() 
                    local jokers_to_create = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                    randomly_create_joker(jokers_to_create,'target',localize("k_target_generate"),{edition={polychrome=true}})
                    return true
                end}))
            else 
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay =  0,
                func = function() 
                    local jokers_to_create = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                    randomly_create_joker(jokers_to_create,'target',localize("k_target_generate"),{edition={negative=true}})
                    return true
                end}))
            end
        end,

atlas = 'joker_juice'
}
SMODS.Atlas {
    key = "joker_juice",
    path = "joker_juice.png",
    px = 71,
    py = 95
}

SMODS.Consumable {
    key = 'prosperity_punch',
    loc_txt = {
        name = 'Prosperity Punch',
        text = {'A delicous drink that gives a blessing'
        },
    },
    set = 'potion',
    pos = {x = 0,y = 0}, 
    discovered = true,
    cost = 5,
    rate = 1,
    can_use = function() return true end,
    loc_vars = function(self, info_queue, card)
        return {vars = {1,4,8}}
    end,
    use = function(self,card,area)
        local Card_redeem_ref = Card.redeem
        if pseudorandom('prosperity_punch') < 1/4 then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + 2
            G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
            ease_discard(2)
            ease_hands_played(1)
        if pseudorandom('prosperity_punch') < 1/4 then
            G.hand.config.card_limit = G.hand.config.card_limit + 2
            G.jokers.config.card_limit = G.jokers.config.card_limit + 1 
        if pseudorandom('prosperity_punch') < 1/8 then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay =  0,
                func = function() 
                    randomly_redeem_voucher()
                    return true
                end}))
        if pseudorandom('prosperity_punch') < 1/8 then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay =  0,
                func = function() 
                    local jokers_to_create = math.min(1, G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                    randomly_create_joker(jokers_to_create,'target',localize("k_target_generate"),{edition={negative=true}})
                    return true
                end}))
            end
        end
    end
end
end
end
end,
atlas = 'prosperity_punch'
}
SMODS.Atlas {
    key = "prosperity_punch",
    path = "prosperity_punch.png",
    px = 71,
    py = 95
}

----------------------------------------------
------------MOD CODE END----------------------