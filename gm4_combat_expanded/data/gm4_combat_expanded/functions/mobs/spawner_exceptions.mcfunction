# check mobs marked as from spawners for possible exceptions
# @s = mobs that can be buffed
# at @s
# run from mobs/check_mob

# mobs in water
execute if block ~ ~-0.01 ~ #gm4:water run tag @s remove gm4_ce_from_spawner

# specific mobs that spawn in the air
tag @s[type=blaze] remove gm4_ce_from_spawner
tag @s[type=phantom] remove gm4_ce_from_spawner
tag @s[type=shulker] remove gm4_ce_from_spawner
