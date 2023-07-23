# @s = moulds that needs a band
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
execute if score $band_applied gm4_ml_data matches 0 run summon item ~ ~ ~ {Item:{id:"minecraft:player_head",Count:1b,tag:{CustomModelData:3420022,SkullOwner:{Name:"[Drop to Fix Item] gm4_metallurgy:band/mundane/v0",Properties:{textures:[{Value:"$band/mundane"}]}},display:{Name:'{"italic":false,"translate":"item.gm4.metallurgy.obsidian_cast","fallback":"Obsidian Cast"}',Lore:['{"italic":false,"color":"gray","translate":"item.gm4.metallurgy.mundane_band","fallback":"Mundane Band"}']}}}}

# spawn xp if band was applied
execute if score $band_applied gm4_ml_data matches 1 if entity @p[distance=..4,gamemode=!spectator] run summon experience_orb ~ ~ ~ {Value:37s}
