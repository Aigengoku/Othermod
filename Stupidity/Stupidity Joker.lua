--- STEAMODDED HEADER
--- MOD_NAME: Stupidity
--- MOD_ID: Stupidity
--- MOD_AUTHOR: [Steamo, Ai gen goku]
--- MOD_DESCRIPTION: This Mod doesn't do anything !

----------------------------------------------
------------MOD CODE -------------------------

-- Skeleton for creating an object
SMODS.Joker{
  key = 'joker_id',
  loc_txt = {
    name = 'Torture',
    text = {
      '{C:mult}+1{} mult per blind cleared',
    }
  },
  rarity = 1,
  pos = {x = 0, y = 0},
  cost = 3,
  discovered = true,
  calculate = function(self, card, context)
  if context.cardarea == G.jokers and not context.before and not context.after then
    local mult = G.GAME.round - 2
    return {
      message = localize{type='variable',key='a_mult',vars={mult}},
      mult_mod = mult, 
      colour = G.C.MULT
  }
  end end }
----------------------------------------------
------------MOD CODE END----------------------
