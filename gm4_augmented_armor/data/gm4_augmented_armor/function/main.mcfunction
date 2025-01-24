# main function
# @s = unspecified
# at unspecified
# run from base survival_refightalized module, from function main

# | Armor
# process canine set wolves
execute as @e[type=wolf,tag=gm4_aa_wolf] run function gm4_augmented_armor:armor/augment/type/canine/wolf_process
# psychic
execute unless score $keep_tick.psychic gm4_aa_keep_tick matches 1 if entity @a[predicate=gm4_augmented_armor:modified_armor/augment/psychic,gamemode=!spectator] run function gm4_augmented_armor:clocks/temp/psychic
# totem
execute unless score $keep_tick.totemic gm4_aa_keep_tick matches 1 if entity @e[type=armor_stand,tag=gm4_aa_totem] run function gm4_augmented_armor:clocks/temp/totemic
