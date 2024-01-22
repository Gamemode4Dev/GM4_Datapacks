# initiate newly spawned mobs (mobs without any tags)
# @s = mobs that can be buffed
# at @s
# run from main

# mark as from a spawner if mob spawned in the air, unless it is expected to
execute if block ~ ~-0.01 ~ #gm4:no_collision run tag @s[type=!#gm4_combat_expanded:modify_in_air] add gm4_ce_processed

# remove gm4_ce_processed tag if this mob is riding another mob (spider / chicken jockeys)
execute if entity @s[tag=gm4_ce_processed] on vehicle on passengers run tag @s remove gm4_ce_processed

# initiate unless mob is from spawner
execute unless entity @s[tag=gm4_ce_processed] run function gm4_combat_expanded:mob/init/initiate
