# replace Zombie leaders with replacement zombies
# @s = zombie leader
# at @s
# run from mob/init/base_stats/check_type/zombie

scoreboard players set $modifier_picked gm4_ce_data 1

tag @s add gm4_ce_was_zombie_leader
data remove entity @s Attributes[{Name:"minecraft:generic.max_health"}].Modifiers[{Name:"Leader zombie bonus"}]
