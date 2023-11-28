# @s = heated {{color}} magicol zauber cauldron with bottled {{color}} magicol recipe inside
# at @s (center of block)
# run from recipes/magicol/bottled/{{bottle}}/{{color}}/select_weather_modifier

# templates/functions/magicol/craft_bottled_magicol.mcfunction

# remove ingredients
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# set flag
scoreboard players set $recipe_success gm4_zc_data 1

# if the moon phase is wrong, spawn vexes instead
execute unless score $current gm4_zc_moon_phase = $preferred gm4_zc_moon_phase run function gm4_zauber_cauldrons:recipes/magicol/bottled/wrong_moon_phase
execute unless score $current gm4_zc_moon_phase = $preferred gm4_zc_moon_phase run return -1

# summon item
loot spawn ~ ~.2 ~ loot gm4_zauber_cauldrons:items/bottled_magicol/{{bottle}}/{{color}}/{{weather_modifier}}

# grant advancement
advancement grant @a[distance=..8,gamemode=!spectator] only gm4:zauber_cauldrons_make_magicol
