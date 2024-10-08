-- Skeleton for creating an object
-- code made so that the joker can add hands to the current amount

SMODS.Joker {
    key = 'red_deck_joker',
    loc_txt = {
      name = 'Red Deck Joker',
      text = {'{C:red}+2{} discards but {C:blue}-1{} hand'}

   },
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   cost = 5,
   discovered = true,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 2
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
        ease_discard(2)
        ease_hands_played(-1)
end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - 2
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
        ease_discard(-2)
        ease_hands_played(1)
end,
atlas = "red_deck_joker"
}
SMODS.Atlas {
    key = "red_deck_joker",
    path = "red_deck_joker.png",
    px = 71,
    py = 95
}


SMODS.Joker {
    key = 'yellow_deck_joker',
    loc_txt = {
      name = 'Yellow Deck Joker',
      text = {'{C:money}+15${} when you beat a boss blind'},

},
   rarity = 3,
   pos = {
      x = 0,
      y = 0
   },
   config = {
    extra = 15

   },
   cost = 9,
   discovered = true,
   loc_vars = function (self,info_queue,center)
        return {
            vars = {center.ability.extra}
        }
   end,
   calculate = function (self,card,context)
    if context.end_of_round and G.GAME.blind.config.blind.boss and not context.repetition and not context.individual then
        card.ability.extra = card.ability.extra
        ease_dollars(15)
    end

   end,


atlas = "yellow_deck_joker"
}
SMODS.Atlas {
    key = "yellow_deck_joker",
    path = "yellow_deck_joker.png",
    px = 71,
    py = 95
}
SMODS.Joker {
    key = 'green_deck_joker',
    loc_txt = {
      name = 'Green Deck Joker',
      text = {'{C:money}+1${} for every remaining hand and discard'}
   },
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   cost = 7,
   discovered = true,
   add_to_deck = function(self, card, from_debuff)
        G.GAME.modifiers.money_per_hand = G.GAME.modifiers.money_per_hand + 1
        G.GAME.modifiers.money_per_discard = G.GAME.modifiers.money_per_discard + 1
end,
   remove_from_deck = function(self, card, from_debuff)
        G.GAME.modifiers.money_per_hand = G.GAME.modifiers.money_per_hand - 1
        G.GAME.modifiers.money_per_discard = G.GAME.modifiers.money_per_discard - 1
end,
atlas = "green_deck_joker"
}
SMODS.Atlas {
    key = "green_deck_joker",
    path = "green_deck_joker.png",
    px = 71,
    py = 95
}


SMODS.Joker {
    key = 'blue_deck_joker',
    loc_txt = {
      name = 'Blue Deck Joker',
      text = {'{C:blue}+2{} hands but {C:red}-1{} discard'}
   },
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   cost = 5,
   discovered = true,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + 2
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
        ease_hands_played(2)
        ease_discard(-1)
end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - 2
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
        ease_hands_played(-2)
        ease_discard(1)
end,

atlas = "blue_deck_joker"
}
SMODS.Atlas {
    key = "blue_deck_joker",
    path = "blue_deck_joker.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'black_deck_joker',
    loc_txt = {
      name = 'Black Deck Joker',
      text = {'{C:attention}+3{} joker slots but', '{C:blue}-1{} hand and {C:red}-1{} discard'}
   },
   rarity = 3,
   pos = {
      x = 0,
      y = 0
   },
   cost = 5,
   discovered = true,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
        G.jokers.config.card_limit = G.jokers.config.card_limit + 3
        ease_discard(-1)
        ease_hands_played(-1)
end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
        G.jokers.config.card_limit = G.jokers.config.card_limit - 3
        ease_discard(1)
        ease_hands_played(1)
end,
atlas = "black_deck_joker"
}
SMODS.Atlas {
    key = "black_deck_joker",
    path = "black_deck_joker.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'painted_deck_joker',
    loc_txt = {
      name = 'Painted Deck Joker',
      text = {'increases hand size by {C:attention}3{}', 'but removes a joker slot'}
   },
   rarity = 1,
   pos = {
      x = 0,
      y = 0
   },
   cost = 3,
   discovered = true,
    add_to_deck = function(self, card, from_debuff)
        G.hand.config.card_limit = G.hand.config.card_limit + 3
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand.config.card_limit = G.hand.config.card_limit - 3
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1

end,
    
atlas = "painted_deck_joker"
}
SMODS.Atlas {
    key = "painted_deck_joker",
    path = "painted_deck_joker.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'zodiac_deck_joker',
    loc_txt = {
      name = 'Zodiac Deck Joker',
      text = {'Planets and Tarots appear {C:attention}2X{} more frequently'}
   },
   rarity = 1,
   pos = {
      x = 0,
      y = 0
   },
   cost = 3,
   discovered = true,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.tarot_rate = G.GAME.tarot_rate*2
        G.GAME.planet_rate = G.GAME.planet_rate*2
end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.tarot_rate = G.GAME.tarot_rate/2
        G.GAME.planet_rate = G.GAME.planet_rate/2
end,
    
atlas = "zodiac_deck_joker"
}
SMODS.Atlas {
    key = "zodiac_deck_joker",
    path = "zodiac_deck_joker.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'magic_deck_joker',
    loc_txt = {
      name = 'Magic Deck Joker',
      text = {'after exiting shop create a fool tarot card'}
   },
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   cost = 3,
   discovered = true,
    calculate = function(self, card, context)
    if context.ending_shop and not context.individual and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        local card_type = 'Tarot'
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
             local fool = SMODS.create_card {key = "c_fool", no_edition = true}
             fool:add_to_deck()
            G.consumeables:emplace(fool)
        end
end,
atlas = "magic_deck_joker"
}
SMODS.Atlas {
    key = "magic_deck_joker",
    path = "magic_deck_joker.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'anaglyph_deck_joker',
    loc_txt = {
      name = 'Anaglyph Deck Joker',
      text = {'after clearing a {C:attention}Blind{} there is a {C:green}#1# in #2#{} chance', 'to gain a {C:attention}Double Tag{}'}
   },
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   cost = 5,
   loc_vars = function(self, info_queue, card)
    return {vars = {G.GAME.probabilities.normal*1,2}}
end,
   discovered = true,
    calculate = function(self, card, context)
    if context.end_of_round and not context.repetition and not context.individual then
        if pseudorandom ('anaglyph_deck_joker') < G.GAME.probabilities.normal*1/2 then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_double'))
                    play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                    return true
                end)
            }))
        end
    end
end,
atlas = "anaglyph_deck_joker"
}
SMODS.Atlas {
    key = "anaglyph_deck_joker",
    path = "anaglyph_deck_joker.png",
    px = 71,
    py = 95
}
SMODS.Joker {
    key = 'magic_deck_joker',
    loc_txt = {
      name = 'Magic Deck Joker',
      text = {'get the fool tarot after exiting shop'}
   },
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   cost = 3,
   discovered = true,
    calculate = function(self, card, context)
    if context.ending_shop and not context.individual and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = (function()
                local card = create_card('The Fool',G.consumeables, nil, nil, nil, nil, nil, 'sea')
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                    G.GAME.consumeable_buffer = 0
                return true
            end)}))
        return {
    message = localize('k_plus_fool'),
    colour = G.C.SECONDARY_SET.Tarot,
    card = self
            }
        end
end,
atlas = "magic_deck_joker"
}
SMODS.Atlas {
    key = "magic_deck_joker",
    path = "magic_deck_joker.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'ghost_deck_joker',
    loc_txt = {
      name = 'Ghost Deck Joker',
      text = {'{C:green}#1# in #2#{}chance to get Spectral after exiting shop'}
   },
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   cost = 3,
   discovered = true,
   loc_vars = function(self, info_queue, card)
    return {vars = {G.GAME.probabilities.normal*1,3}}
end,
    calculate = function(self, card, context)
    if context.ending_shop and not context.individual and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        if pseudorandom ('ghost_deck_joker') < G.GAME.probabilities.normal*1/3 then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = (function()
                local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'sea')
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                    G.GAME.consumeable_buffer = 0
                return true
            end)}))
        return {
    message = localize('k_plus_spectral'),
    colour = G.C.SECONDARY_SET.Spectral,
    card = self
            }
        end
    end
end,
atlas = "ghost_deck_joker"
}
SMODS.Atlas {
    key = "ghost_deck_joker",
    path = "ghost_deck_joker.png",
    px = 71,
    py = 95
}

SMODS.Joker {
  key = 'torture',
  loc_txt = {
      name = 'Torture',
      text = {'{C:mult}+3{} mult per blind cleared'}
  },
  rarity = 3,
  pos = {
      x = 0,
      y = 0
  },
  cost = 7,
  discovered = true,
  calculate = function(self, card, context)
      if context.cardarea == G.jokers and not context.before and not context.after then
          local mult = G.GAME.round - 4
          return {
              message = localize {
                  type = 'variable',
                  key = 'a_mult',
                  vars = {mult}
              },
              mult_mod = mult,
              colour = G.C.MULT
          }
      end
  end,

  atlas = "torture"
}
SMODS.Atlas {
    key = "torture",
    path = "torture.png",
    px = 71,
    py = 95
}

  SMODS.Joker {
    key = 'rich_get_richer',
    loc_txt = {
        name = 'Rich Get Richer',
        text = {'{C:mult}+#1#{} Mult', 'if hand is played', 'with {C:money}$30{} or more'}

    },

    rarity = 2,
    pos = {
        x = 0,
        y = 0
    },
    config = {
        mult = 30,
        money = 30
    },
    discovered = true,
    cost = 3,
    loc_vars = function(self, info_queue, center)
        return {
            vars = {center.ability.mult, center.ability.money}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and not context.before and not context.after then
            if G.GAME.dollars > 30 then
                return {
                    message = localize {
                        type = 'variable',
                        key = 'a_mult',
                        vars = {card.ability.mult}
                    },
                    mult_mod = card.ability.mult,
                    colour = G.C.MULT

                }

            end
        end
    end,
    atlas="rich_get_richer"
}
SMODS.Atlas {
    key = "rich_get_richer",
    path = "rich_get_richer.png",
    px = 71,
    py = 95
}

  SMODS.Joker {
    key = 'joker?',
    loc_txt = {
        name = 'Joker?',
        text = {'...'}

    },
    rarity = 1,
    pos = {
        x = 0,
        y = 0
    },

    discovered = true,
    cost = 2,
    add_to_deck = function(self, card, context)
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+1 Joker!"})
            destroyCard(card)
            G.E_MANAGER:add_event(Event({func = function()
                _card = create_card('Joker', G.jokers, 1, nil, nil, nil, nil, 'stupid_rng')
                card:add_to_deck()
                _card:remove_from_deck()
                _card:start_materialize()
                card = _card
                _card:set_card_area(G.jokers)
                G.jokers:set_ranks()
                G.jokers:align_cards()
                return true end}))
    end,
    atlas="joker?"
   }
SMODS.Atlas {
    key = "joker?",
    path = "joker_.png",
    px = 71,
    py = 95
   }

SMODS.Joker {
    key = 'gambler_m',
    loc_txt = {
        name = 'Gambler M',
        text = {'{C:green}#1#/#2#{} chance to get {C:mult}+30{} mult'}

    },

    rarity = 2,
    pos = {
        x = 0,
        y = 0
    },
    config = {
        mult = 30,
    },
    discovered = true,
    cost = 3,
    loc_vars = function(self, info_queue, center)
        return {
            vars = {G.GAME.probabilities.normal*1,8, center.ability.mult}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and not context.before and not context.after then
        if pseudorandom ('gambler_m') < G.GAME.probabilities.normal*1/8 then
                return {
                    message = localize {
                        type = 'variable',
                        key = 'a_mult',
                        vars = {card.ability.mult}
                    },
                    mult_mod = card.ability.mult,
                    colour = G.C.MULT
                }
            end
        end
    end,
    atlas = "gambler_m"
}
SMODS.Atlas {
    key = "gambler_m",
    path = "joker_.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'gambler_chip',
    loc_txt = {
        name = 'Gambler Chip',
        text = {'{C:green}#1#/#2#{} chance to get {C:blue}+66{} chips'}

    },

    rarity = 2,
    pos = {
        x = 0,
        y = 0
    },
    config = {
        chips = 66,
    },
    discovered = true,
    cost = 3,
    loc_vars = function(self, info_queue, center)
        return {
            vars = {G.GAME.probabilities.normal*1,8, center.ability.mult}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and not context.before and not context.after then
        if pseudorandom ('gambler_chip') < G.GAME.probabilities.normal*1/8 then
                return {
                    message = localize {
                        type = 'variable',
                        key = 'a_chips',
                        vars = {card.ability.chips},
                    },
                    chip_mod = card.ability.chips,
                    colour = G.C.BLUE

            }
            end
        end
    end,
    atlas = "gambler_chip"
}
SMODS.Atlas {
    key = "gambler_chip",
    path = "joker_.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'knurples',
    loc_txt = {
      name = 'Knurples',
      text = {'{C:blue}+40{} chips per hand'},

},
   rarity = 2,
   pos = {
      x = 0,
      y = 0
   },
   config = {
    extra = 40

   },
   cost = 9,
   discovered = true,
   loc_vars = function (self,info_queue,center)
        return {
            vars = {center.ability.extra}
        }
   end,
   calculate = function (self,card,context)
    if context.joker_main then
    if G.GAME.current_round.hands_left > 0 then
        return {
            message = localize{type='variable',key='a_chips',vars={G.GAME.current_round.hands_left*card.ability.extra}},
            chip_mod = G.GAME.current_round.hands_left*card.ability.extra
        }
    end
    end
   end,
atlas = 'knurples'
}
   SMODS.Atlas {
    key = "knurples",
    path = "knurples.png",
    px = 71,
    py = 95
   }

   SMODS.Joker {
    key = 'william',
    loc_txt = {
        name = 'William',
        text = {'{C:mult}+#1#{} mult, {C:blue}+#2#{} chips', 'and {C:attention} +1{} handsize per boss blind'}
    },
    rarity = 4,
    pos = {
        x = 0,
        y = 0
    },
    cost = 7,
    config = {
        mult = 0,
        chips = 0,
        extra = {mult = 10, chips = 100}
      },
    discovered = true,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult, card.ability.extra.chips}}
    end,
    calculate = function(self, card, context)
        if context.end_of_round then
        if not context.individual then
        if G.GAME.blind:get_type() == 'Boss'  and not context.repetition then
            card.ability.mult = card.ability.mult + card.ability.extra.mult
            card.ability.chips = card.ability.chips + card.ability.extra.chips
            G.hand:change_size(1)
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
        end
    end
end
if context.joker_main then
    return {
        message = "William",
        chip_mod = card.ability.chips,
        mult_mod = card.ability.mult,
    }
end
end,
   
  
    atlas = "william"
  }
  SMODS.Atlas {
      key = "william",
      path = "william.png",
      px = 71,
      py = 95
  }

  SMODS.Joker {
    key = 'purple_deck_joker',
    loc_txt = {
      name = 'Purple Deck Joker',
      text = {'{C:red}+3{} discards and {C:blue}+3{} hands', 'A powerful combination of blue and red'}

   },
   rarity = 3,
   pos = {
      x = 0,
      y = 0
   },
   cost = 11,
   discovered = true,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 3
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + 3
        ease_discard(3)
        ease_hands_played(3)
end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - 3
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - 3
        ease_discard(-3)
        ease_hands_played(-3)
end,
atlas = "purple_deck_joker"
}
SMODS.Atlas {
    key = "purple_deck_joker",
    path = "purple_deck_joker.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    key = 'chartreuse_deck_joker',
    loc_txt = {
      name = 'Chartreuse Deck Joker',
      text = {'{C:money}+2${} for every remaining hand', '{C:money}+1${} for every remaining discard', '{C:money}+10{} interest cap ','An intresting combination of yellow and green'}
   },
   rarity = 3,
   pos = {
      x = 0,
      y = 0
   },
   cost = 16,
   discovered = true,
   add_to_deck = function(self, card, from_debuff)
        G.GAME.modifiers.money_per_hand = 2
        G.GAME.modifiers.money_per_discard = 1
        G.GAME.interest_cap = G.GAME.interest_cap + 10
end,
   remove_from_deck = function(self, card, from_debuff)
        G.GAME.modifiers.money_per_hand = G.GAME.modifiers.money_per_hand - 2
        G.GAME.modifiers.money_per_discard = G.GAME.modifiers.money_per_discard - 1
        G.GAME.interest_cap = G.GAME.interest_cap - 10
        

end,
atlas = "chartreuse_deck_joker"
}
SMODS.Atlas {
    key = "chartreuse_deck_joker",
    path = "chartreuse_deck_joker.png",
    px = 71,
    py = 95
}