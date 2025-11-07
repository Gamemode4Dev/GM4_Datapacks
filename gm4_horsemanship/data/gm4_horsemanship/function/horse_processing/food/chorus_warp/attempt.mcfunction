# code taken from Orb of Ankou - expeditious
# @s = gm4_horse
# at @s
# run from horse_processing/food/chorus_warp/context

tag @s remove gm4_horse_warp_target
tag @s add gm4_horse_warping
execute store result storage gm4_horsemanship:temp check.height float 0.016 run attribute @s scale get 100
execute store result storage gm4_horsemanship:temp check.distance float 0.0069825 run attribute @s scale get 100

# effects where you leave
particle reverse_portal ~ ~0.8 ~ 0.2 0.4 0.2 0.1 16
playsound entity.enderman.teleport player @a ~ ~ ~ 1 1.2

# teleport up to 8 blocks away
execute align y summon marker run function gm4_horsemanship:horse_processing/food/chorus_warp/spawn_marker

data remove storage gm4_horsemanship:temp check
tag @s remove gm4_horse_warping
