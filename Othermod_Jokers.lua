-- Skeleton for creating an object
function destroyCard(card)
    G.E_MANAGER:add_event(Event({
        func = function()
            play_sound('tarot1')
            card.T.r = -0.2
            card:juice_up(0.3, 0.4)
            card.states.drag.is = true
            card.children.center.pinch.x = true
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                func = function()
                        G.jokers:remove_card(card)
                        card:remove()
                        card = nil
                    return true; end})) 
            return true
        end
    })) 
end

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
      text = {'{C:money}+15${} when anything'},
   
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
      text = {'+3 joker slots but', '{C:blue} -1{} hand and {C:red}-1{} discard'}
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
      name = ' Painted Deck Joker',
      text = {'increases handsize by 3', 'but removes a joker slot'}
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
        G.jokers.config.card_limit = G.jokers.config.caG.hand.config.card_limit + 1

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
  key = 'torture',
  loc_txt = {
      name = 'Torture',
      text = {'{C:mult}+1{} mult per blind cleared'}
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
          local mult = G.GAME.round - 2
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
        name = 'Rich get richer',
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
        text = {'{C:green}#1#/#2#{} chance to get {C:mult} +25{}', 'and a holo jolly joker'}

    },

    rarity = 3,
    pos = {
        x = 0,
        y = 0
    },
    config = {
        mult = 25,
    },
    discovered = true,
    cost = 3,
    loc_vars = function(self, info_queue, center)
        return {
            vars = {G.GAME.probabilities.normal*1,10, center.ability.mult}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and not context.before and not context.after then
        if pseudorandom ('gambler_m') < G.GAME.probabilities.normal*1/10 then
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
    end
}

SMODS.Joker {
    key = 'gambler_m',
    loc_txt = {
        name = 'Gambler M',
        text = {'{C:green}#1#/#2#{} chance to get {C:mult} +25{}', 'and a holo jolly joker'}

    },

    rarity = 3,
    pos = {
        x = 0,
        y = 0
    },
    config = {
        mult = 25,
    },
    discovered = true,
    cost = 2,
    loc_vars = function(self, info_queue, center)
        return {
            vars = {G.GAME.probabilities.normal*1,10,14, center.ability.mult}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and not context.before and not context.after then
        if pseudorandom ('gambler_m') < G.GAME.probabilities.normal*1/10 then
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
    end
}

SMODS.Joker {
    key = 'gambler_chip',
    loc_txt = {
        name = 'Gambler Chip',
        text = {'{C:green}#1#/#2#{} chance to get {C:blue}+66 chips'}

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
            vars = {G.GAME.probabilities.normal*1,10, center.ability.mult}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and not context.before and not context.after then
        if pseudorandom ('gambler_chip') < G.GAME.probabilities.normal*1/10 then
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
    end
}


SMODS.Joker {
    key = 'legend_maker',
    loc_txt = {
        name = 'Legend Maker',
        text = {'Does nothing...or does it?'}

    },

    rarity = 3,
    pos = {
        x = 0,
        y = 0
    },
    discovered = false,
    cost = 1,
    loc_vars = function(self, info_queue, center)
        return {
            vars = {G.GAME.probabilities.normal*1,85}
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and not context.before and not context.after then
        if pseudorandom ('legend_maker') < G.GAME.probabilities.normal*1/85 then
            local card = create_card('Joker', G.consumeables, nil, nil, nil, nil, 'the_soul')
            card:set_edition({negative = true}) 
            card:add_to_deck()
            G.consumeables:emplace(card)
            return {completed=true}
            end
        end
    end
}

SMODS.Joker {
    key = 'knurples',
    loc_txt = {
      name = 'knurples',
      text = {'{C:blue}+40{} chips per {C:blue}hand'},
   
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