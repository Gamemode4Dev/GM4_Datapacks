# check all cauldrons for their structure, branches off into recipe checks
execute as @e[type=area_effect_cloud,tag=gm4_zauber_cauldron] at @s run function gm4_zauber_cauldrons:cauldron/structure_check

# slow clock
scoreboard players add slow_clock gm4_zc_data 1
execute if score slow_clock gm4_zc_data matches 3.. run function gm4_zauber_cauldrons:slow_clock

# player checks
execute as @a[gamemode=!spectator] run function gm4_zauber_cauldrons:player_checks/normal

# restore broken crystals
execute as @e[type=item,tag=!gm4_zc_restored_player_head,nbt={Item:{id:"minecraft:player_head"}}] run function gm4_zauber_cauldrons:recipes/crystals/restore

schedule function gm4_zauber_cauldrons:main 16t
