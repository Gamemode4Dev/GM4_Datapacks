# @s = any item entity
# at world spawn
# called from gm4_podzol_rooting_soil:main

# process non-sapling items
execute if entity @s[tag=!gm4_sapling,tag=!gm4_not_a_sapling] run function gm4_podzol_rooting_soil:tag_saplings

# process sapling item
execute if entity @s[tag=gm4_sapling,tag=!gm4_not_a_sapling] run function gm4_podzol_rooting_soil:randomizer_loop
