# spawn wolf if there is none matching equipped armor
# @s = player to spawn the wolf
# at @s
# run from armor/type/canine/check

# obtain player UUID
data modify storage gm4_combat_expanded:temp uuid set from entity @s UUID

# BPR told me to add this ¯\_(ツ)_/¯ "stupid chunk loading stuff"
kill @e[type=wolf,tag=gm4_ce_new_wolf]
# spawn wolf
execute summon wolf run function gm4_combat_expanded:armor/modifier/type/canine/wolf_initiate

# playsound with cooldown
execute unless score @s gm4_ce_t_wolf matches 1.. run playsound minecraft:entity.wolf.whine neutral @s ~ ~ ~ 0.6 0.8
scoreboard players set @s gm4_ce_t_wolf 1
