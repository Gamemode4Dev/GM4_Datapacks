# process thrown spell trident
# @s = spell trident
# at @s
# run from spell_trident/process

# suck in items
tag @s add gm4_hy_target
scoreboard players set $hopper.items_sucked gm4_hy_data 0
execute as @e[type=item,distance=..5,tag=!gm4_hy_passenger_item,tag=!smithed.strict] at @s run function gm4_hydromancy:spell_trident/hopper/suck_item
scoreboard players operation @s gm4_hy_mana_used += $hopper.items_sucked gm4_hy_data
tag @s remove gm4_hy_target

# limit to 60 seconds of on ground, when player gets nearby or until mana is empty
scoreboard players add @s[tag=gm4_hy_spell_trident.landed] gm4_hy_duration 1
execute if entity @s[scores={gm4_hy_duration=30..}] run function gm4_hydromancy:spell_trident/hopper/stop
#execute if score @s gm4_hy_duration matches 30.. positioned ~-.5 ~-.2 ~-.5 if entity @a[gamemode=!spectator,dx=0,dy=0,dz=0] run function gm4_hydromancy:spell_trident/hopper/stop
execute if score @s gm4_hy_mana_used >= @s gm4_hy_charge run function gm4_hydromancy:spell_trident/hopper/stop

# vfx
execute facing ~ ~1 ~ run particle sculk_charge_pop ~ ~ ~ ^ ^250000000 ^750000000 0.0000000002 0
execute facing ~ ~1 ~ run particle sculk_charge_pop ~ ~ ~ ^ ^-250000000 ^750000000 0.0000000002 0
execute facing ~ ~1 ~ run particle sculk_charge_pop ~ ~ ~ ^250000000 ^ ^750000000 0.0000000002 0
execute facing ~ ~1 ~ run particle sculk_charge_pop ~ ~ ~ ^-250000000 ^ ^750000000 0.0000000002 0
scoreboard players add @s gm4_hy_timer 1
##TODO: re-enable this, building was broken
#execute if score @s[tag=gm4_hy_spell_trident.landed] gm4_hy_timer matches 1..3 run particle minecraft:shriek 0 ~ ~-0.05 ~ 0.025 0.025 0.025 0 1
scoreboard players set @s[scores={gm4_hy_timer=7..}] gm4_hy_timer 0
