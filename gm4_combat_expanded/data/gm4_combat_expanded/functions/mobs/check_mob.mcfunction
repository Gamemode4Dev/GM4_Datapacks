# initiate newly spawned mobs (mobs without any tags)
# @s = mobs that can be buffed
# at @s
# run from main

# mark as from a spawner if mob spawned in the air, then check for exceptions
execute if block ~ ~-0.01 ~ #gm4:no_collision run tag @s add gm4_ce_from_spawner
execute if entity @s[tag=gm4_ce_from_spawner] run function gm4_combat_expanded:mobs/spawner_exceptions

# initiate unless mob is from spawner
execute unless entity @s[tag=gm4_ce_from_spawner] run function gm4_combat_expanded:mobs/initiate
