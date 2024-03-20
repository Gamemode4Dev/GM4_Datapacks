# execute the spell every 10 / 50 ticks
# @s = spell trident
# at @s
# run from spell_trident/heal/process

scoreboard players set @s gm4_hy_duration 0

# track mana used and this trident
scoreboard players set $heal.mana_used gm4_hy_data 0
tag @s add gm4_hy_target

# grow nearby crops / regrow nearby coral, random column each cycle (5 mana per growth,1 for moistening farmland)
execute summon marker run function gm4_hydromancy:spell_trident/heal/grow/init

# regen entities, damage undead (1 mana per entity, 3 per undead, cap of 12), only if trident has mana left
execute if score @s gm4_hy_mana_used < @s gm4_hy_charge as @e[distance=..8,team=!gm4_hy_team_check,predicate=gm4_hydromancy:valid_regen_target,tag=!smithed.strict,limit=12] run function gm4_hydromancy:spell_trident/heal/regen/check_type

# re-use pitch from crop grower to slightly randomize sound
scoreboard players operation $pitch gm4_hy_data %= #4 gm4_hy_data
execute if score $pitch gm4_hy_data matches 0 run playsound minecraft:weather.rain neutral @a[distance=..8] ~ ~ ~ 0.15 0.8 0.25
execute if score $pitch gm4_hy_data matches 1 run playsound minecraft:weather.rain neutral @a[distance=..8] ~ ~ ~ 0.1 1.4 0.25
execute if score $pitch gm4_hy_data matches 2 run playsound minecraft:weather.rain neutral @a[distance=..8] ~ ~ ~ 0.2 0.3 0.25
execute if score $pitch gm4_hy_data matches 3 run playsound minecraft:weather.rain.above neutral @a[distance=..8] ~ ~ ~ 0.2 0.8 0.25

# add mana used to total, DONT stop spell if mana ran out, but stop running the spell
scoreboard players operation @s gm4_hy_mana_used += $heal.mana_used gm4_hy_data

tag @s remove gm4_hy_target
