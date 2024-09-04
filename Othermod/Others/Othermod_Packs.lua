-- Skeleton for creating an object
SMODS.Booster { 
    key =  'wumbo_arcana_pack',
    weight = 0.3,
    loc_txt = {
        name = 'Wumbo Arcana Pack',
        text =  {'pick 3 out 7 tarot cards'}
    },
    group_name = "Arcana Pack",
   pos = {
      x = 0,
      y = 0
    },
    cost = 10,
    discovered = false,
    create_card = function(self, card)
        return create_card("Tarot", G.pack_cards, nil, nil, true, true, nil, 'buf')
    end,
    config = {extra = 7, choose = 3},
    draw_hand = true,
    sparkles = {
        colours = {G.C.WHITE, lighten(G.C.GOLD, 0.2)},
        lifespan = 1
    }
}

SMODS.Booster { 
    key =  'wumbo_celestial_pack',
    weight = 0.3,
    loc_txt = {
        name = 'Wumbo Celestial Pack',
        text =  {'pick 3 out 7 planet cards'}
    },
    group_name = "Celestial Pack",
   pos = {
      x = 0,
      y = 0
    },
    cost = 10,
    discovered = false,
    create_card = function(self, card)
        return create_card("Planet", G.pack_cards, nil, nil, true, true, nil, 'buf')
    end,
    config = {extra = 7, choose = 3},
    draw_hand = true,
    sparkles = {
        colours = {G.C.WHITE, lighten(G.C.PURPLE, 0.2)},
        lifespan = 1
    }
}

SMODS.Booster { 
    key =  'wumbo_spectral_pack',
    weight = 0.15,
    loc_txt = {
        name = 'Wumbo Spectral Pack',
        text =  {'pick 3 out 7 spectrals'}
    },
    group_name = "Spectral Pack",
   pos = {
      x = 0,
      y = 0
    },
    cost = 10,
    discovered = false,
    create_card = function(self, card)
        return create_card("Spectral", G.pack_cards, nil, nil, true, true, nil, 'buf')
    end,
    config = {extra = 7, choose = 3},
    draw_hand = true,
    sparkles = {
        colours = {G.C.WHITE, lighten(G.C.BLUE, 0.2)},
        lifespan = 1
    }
}


SMODS.Booster { 
    key =  'wumbo_buffoon_pack',
    weight = 0.2,
    loc_txt = {
        name = 'Wumbo Buffoon Pack',
        text =  {'pick 3 out 7 jokers'}
    },
    group_name = "Buffoon Pack",
   pos = {
      x = 0,
      y = 0
    },
    cost = 10,
    discovered = false,
    create_card = function(self, card)
        return create_card("Joker", G.pack_cards, nil, nil, true, true, nil, 'buf')
    end,
    config = {extra = 7, choose = 3},
    draw_hand = true,
    sparkles = {
        colours = {G.C.WHITE, lighten(G.C.RED, 0.2)},
        lifespan = 1
    }
}