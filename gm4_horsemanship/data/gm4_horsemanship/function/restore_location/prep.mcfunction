# prep restoring the location of this player
# @s = player that just mounted a gm4_horse
# at @s (before mounting)
# run from horse_processing/food/feed_added_food

tag @s add gm4_horse_self
execute summon marker run function gm4_horsemanship:restore_location/restore
tag @s remove gm4_horse_self
