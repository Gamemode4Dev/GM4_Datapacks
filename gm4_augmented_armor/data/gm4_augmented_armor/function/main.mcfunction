# main function
# @s = unspecified
# at unspecified
# run from base survival_refightalized module, from function main

# | Armor
# process canine set wolves
execute as @e[type=wolf,tag=gm4_aa_wolf] run function gm4_augmented_armor:armor/augment/type/canine/wolf_process
# sword_ring
execute unless score $keep_tick.sword_ring gm4_aa_keep_tick matches 1 if entity @a[predicate=gm4_augmented_armor:modified_armor/sword_ring,gamemode=!spectator] run schedule function gm4_augmented_armor:clocks/temp/sword_ring 1t
# radiant
execute unless score $keep_tick.radiant gm4_aa_keep_tick matches 1 if entity @a[predicate=gm4_augmented_armor:modified_armor/radiant,gamemode=!spectator] run schedule function gm4_augmented_armor:clocks/temp/radiant 1t
