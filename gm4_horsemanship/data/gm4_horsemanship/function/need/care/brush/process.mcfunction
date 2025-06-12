# process gm4_horses being brushed
# @s = player riding the gm4_horse
# at @s (before mounting)
# run from start_riding_horse

# brushing effect
tag @s add gm4_horse_self
execute on vehicle unless score @s gm4_horse_need.brushing matches 734.. at @s run function gm4_horsemanship:need/care/brush/apply
tag @s remove gm4_horse_self

# restore player location
function gm4_horsemanship:riding/restore_location/prep

# mark this interaction as resolved
scoreboard players set $interaction_resolved gm4_horse_data 1
