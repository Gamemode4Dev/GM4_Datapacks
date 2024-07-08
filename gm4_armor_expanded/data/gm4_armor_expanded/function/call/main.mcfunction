# main function
# @s = unspecified
# at unspecified
# run from base combat_expanded module, from function main

# | Armor
# process canine set wolves
execute as @e[type=wolf,tag=gm4_ae_wolf] run function gm4_armor_expanded:armor/modifier/type/canine/wolf_process
# sword_ring
execute unless score $keep_tick.sword_ring gm4_ae_keep_tick matches 1 if entity @a[predicate=gm4_armor_expanded:modified_armor/sword_ring,gamemode=!spectator] run schedule function gm4_armor_expanded:clocks/temp/sword_ring 1t
# beacon
execute unless score $keep_tick.beacon gm4_ae_keep_tick matches 1 if entity @a[predicate=gm4_armor_expanded:modified_armor/beacon,gamemode=!spectator] run schedule function gm4_armor_expanded:clocks/temp/beacon 1t

# | Players
# sustain armor double speed regen
execute if score $natural_regen gm4_ae_data matches 0 as @a[gamemode=!spectator,tag=gm4_ae_sustain_active] unless score @s[scores={gm4_ae_hunger=18..}] gm4_ae_combat_regen_timer matches 1.. run function gm4_armor_expanded:armor/modifier/type/sustain/extra_regen
