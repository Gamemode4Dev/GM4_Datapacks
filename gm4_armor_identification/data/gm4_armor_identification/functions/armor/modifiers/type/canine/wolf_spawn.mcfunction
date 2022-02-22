# run from armor/active/canine/check
# @s = player to spawn the wolf
# at @s

# obtain player UUID
data modify storage gm4_armor_identification:temp uuid set from entity @s UUID

# spawn wolf
summon wolf ~ ~ ~ {Invulnerable:1b,CollarColor:15b,Tags:["gm4_ai_wolf","gm4_ai_new_wolf"],Attributes:[{Name:"generic.attack_damage",Base:4}]}
execute as @e[type=wolf,tag=gm4_ai_new_wolf] run function gm4_armor_identification:armor/modifiers/type/canine/wolf_initiate

# playsound with cooldown
execute unless score @s gm4_ai_t_wolf matches 1.. run playsound minecraft:entity.wolf.whine neutral @s ~ ~ ~ 0.6 0.8
scoreboard players set @s gm4_ai_t_wolf 1
