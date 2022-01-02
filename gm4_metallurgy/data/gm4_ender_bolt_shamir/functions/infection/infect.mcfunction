# starts ender bolt on an entity
# @s = a living entity that is not an armor stand
# at source of infection
# run from infection/check_ignore_list

# get and store origin id
scoreboard players operation @s gm4_ender_bolt_foreign_id = $source gm4_ender_bolt_foreign_id

# apply ender bolt
scoreboard players set @s gm4_bolt_time 10
