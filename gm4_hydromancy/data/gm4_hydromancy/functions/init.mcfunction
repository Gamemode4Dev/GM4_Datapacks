execute unless score hydromancy gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Hydromancy"}
scoreboard players set hydromancy gm4_modules 1

scoreboard objectives add gm4_hy_data dummy
scoreboard players set #3 gm4_hy_data 3
scoreboard players set #6 gm4_hy_data 6
scoreboard players set #10 gm4_hy_data 10
scoreboard players set #15 gm4_hy_data 15
scoreboard players set #51 gm4_hy_data 51
scoreboard players set #100 gm4_hy_data 100
scoreboard players set #250 gm4_hy_data 250
scoreboard players set #65536 gm4_hy_data 65536
scoreboard players set #16842752 gm4_hy_data 16842752

scoreboard objectives add gm4_hy_goal dummy
scoreboard objectives add gm4_hy_charge dummy
scoreboard objectives add gm4_hy_next_charge_change dummy
scoreboard objectives add gm4_hy_vine_count dummy
scoreboard objectives add gm4_hy_vine_root_count dummy
scoreboard objectives add gm4_hy_using_spell_trident dummy
scoreboard objectives add gm4_hy_mana_used dummy

schedule function gm4_hydromancy:tick 1t
schedule function gm4_hydromancy:main 1t
schedule function gm4_hydromancy:clock_coral_core 2s
schedule function gm4_hydromancy:clock_coral_vine 17s
schedule function gm4_hydromancy:clock_tracked_fish 1t

#$moduleUpdateList
