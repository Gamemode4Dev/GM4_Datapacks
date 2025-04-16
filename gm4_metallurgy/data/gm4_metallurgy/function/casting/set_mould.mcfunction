# summons a shamir for a destroyed mould which contained a proper recipe
# @s = moulds that needs a band
# at @s positioned ~ ~1.23 ~ (at the x-z location of the mould, just above the surface of the sand)
# run from destroy_mould

# initialise fake players
scoreboard players set $band_applied gm4_ml_data 0

# check metal values
execute if entity @s[scores={gm4_ml_ore_bi=0,gm4_ml_ore_al=23,gm4_ml_ore_ba=0,gm4_ml_ore_th=0}] run function gm4_metallurgy:casting/summon_band/aluminium
execute if entity @s[scores={gm4_ml_ore_bi=0,gm4_ml_ore_al=0,gm4_ml_ore_ba=23,gm4_ml_ore_th=0}] run function gm4_metallurgy:casting/summon_band/barium
execute if entity @s[scores={gm4_ml_ore_bi=0,gm4_ml_ore_al=17,gm4_ml_ore_ba=6,gm4_ml_ore_th=0}] run function gm4_metallurgy:casting/summon_band/barimium
execute if entity @s[scores={gm4_ml_ore_bi=23,gm4_ml_ore_al=0,gm4_ml_ore_ba=0,gm4_ml_ore_th=0}] run function gm4_metallurgy:casting/summon_band/bismuth
execute if entity @s[scores={gm4_ml_ore_bi=0,gm4_ml_ore_al=0,gm4_ml_ore_ba=0,gm4_ml_ore_th=23}] run function gm4_metallurgy:casting/summon_band/thorium
execute if entity @s[scores={gm4_ml_ore_bi=6,gm4_ml_ore_al=0,gm4_ml_ore_ba=0,gm4_ml_ore_th=17}] run function gm4_metallurgy:casting/summon_band/curies_bismium



# apply broken band if all other bands fail
execute if score $band_applied gm4_ml_data matches 0 run summon item ~ ~ ~ {Item:{id:"minecraft:player_head",count:1,components:{"minecraft:custom_model_data":"item/mundane_band","minecraft:profile":"$band/mundane","minecraft:custom_name":{"italic":false,"translate":"item.gm4.metallurgy.obsidian_cast","fallback":"Obsidian Cast"},"minecraft:lore":[{"italic":false,"color":"gray","translate":"item.gm4.metallurgy.mundane_band","fallback":"Mundane Band"}]}}}

# spawn xp if band was applied
execute if score $band_applied gm4_ml_data matches 1 if entity @p[distance=..4,gamemode=!spectator] run summon experience_orb ~ ~ ~ {Value:37s}
