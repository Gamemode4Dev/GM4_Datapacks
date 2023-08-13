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
execute if score $band_applied gm4_ml_data matches 0 run summon item ~ ~ ~ {Item:{id:"minecraft:player_head",Count:1b,tag:{CustomModelData:3420022,SkullOwner:{Name:"[Drop to Fix Item] gm4_metallurgy:band/mundane/v0",Id:[I;2090045838,1070000930,-1136417339,1085846924],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0ODE2NjMzMzg5MDksInByb2ZpbGVJZCI6IjkxYTBlZmEyM2QxODQ5Y2ZiM2JkMGExNzdjZjM3Nzg4IiwicHJvZmlsZU5hbWUiOiJEdWNrSnIiLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYzQ4MGNjMjY3M2ZmMjhkNTEzNDY0MTMxN2FiYzUzMWU5ZTFjZWU3MTFlYWJmYWY3YzJhZDY1M2E0NmQxZmI3In19fQ=="}]}},display:{Name:'{"italic":false,"translate":"item.gm4.metallurgy.obsidian_cast","fallback":"Obsidian Cast"}',Lore:['{"italic":false,"color":"gray","translate":"item.gm4.metallurgy.mundane_band","fallback":"Mundane Band"}']}}}}

# spawn xp if band was applied
execute if score $band_applied gm4_ml_data matches 1 if entity @p[distance=..4,gamemode=!spectator] run summon experience_orb ~ ~ ~ {Value:37s}
