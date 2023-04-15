# play vfx for crop growth
# @s = growth marker
# at @s, raycasting down
# run from spell_trident/heal/grow/check_type

particle happy_villager ~ ~-0.8 ~ 0.2 0.1 0.2 0 6
playsound item.bone_meal.use neutral @a ~ ~-0.8 ~ 1 1
fill ~ ~-1 ~ ~ ~-1 ~ farmland[moisture=7] replace farmland
