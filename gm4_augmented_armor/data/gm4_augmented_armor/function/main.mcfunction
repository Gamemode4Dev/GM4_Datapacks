# main function
# @s = unspecified
# at unspecified
# run from base survival_refightalized module, from function main

# | Armor
# process canine set wolves
execute as @e[type=wolf,tag=gm4_aa_wolf] run function gm4_augmented_armor:armor/augment/type/canine/wolf_process
# sword_ring
execute unless score $keep_tick.sword_ring gm4_aa_keep_tick matches 1 if entity @a[predicate=gm4_augmented_armor:modified_armor/sword_ring,gamemode=!spectator] run schedule function gm4_augmented_armor:clocks/temp/sword_ring 1t
# beacon
execute unless score $keep_tick.beacon gm4_aa_keep_tick matches 1 if entity @a[predicate=gm4_augmented_armor:modified_armor/beacon,gamemode=!spectator] run schedule function gm4_augmented_armor:clocks/temp/beacon 1t

# | Players
# sustain armor double speed regen
execute if score $natural_regen gm4_aa_data matches 0 as @a[gamemode=!spectator,tag=gm4_aa_sustain_active] unless score @s[scores={gm4_aa_hunger=18..}] gm4_ce_combat_regen_timer matches 1.. run function gm4_augmented_armor:armor/augment/type/sustain/extra_regen
