
# check for growing up
execute store result score $age gm4_horse_data run data get entity @s Age
execute if score $age gm4_horse_data matches 0.. run return run tag @s remove gm4_horse.foal

# | Increase enrichment
# max of 33750

# gain 11250 as base for being grown from a Foal
    # from gm4_horsemanship:level/tame_horse

# nearby horses +1, up to +10, total max +7500
execute store result score $nearby_horses gm4_horse_data if entity @e[type=#gm4_horsemanship:trainable,distance=0.01..24,limit=10]
scoreboard players operation @s gm4_horse_potential.foal += $nearby_horses gm4_horse_data

# +50 if on leash, up to +7500
execute store success score $on_leash gm4_horse_data if data entity @s leash.UUID
execute if score $on_leash gm4_horse_data matches 1 run scoreboard players add @s[scores={gm4_horse_need.on_leash=1..}] gm4_horse_potential.foal 50
execute if score $on_leash gm4_horse_data matches 1 run scoreboard players remove @s[scores={gm4_horse_need.on_leash=1..}] gm4_horse_need.on_leash 1

# if a player is nearby +4, total max +3000
execute if entity @p[gamemode=!spectator,distance=..24] run scoreboard players add @s gm4_horse_potential.foal 4

# if allowed to graze +3000 once
    # from gm4_horsemanship:need/graze/foal
