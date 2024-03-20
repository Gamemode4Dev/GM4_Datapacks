execute unless score hydromancy gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Hydromancy"}
scoreboard players set hydromancy gm4_modules 1

scoreboard objectives add gm4_hy_data dummy
scoreboard players set #3 gm4_hy_data 3
scoreboard players set #4 gm4_hy_data 4
scoreboard players set #5 gm4_hy_data 5
scoreboard players set #6 gm4_hy_data 6
scoreboard players set #10 gm4_hy_data 10
scoreboard players set #15 gm4_hy_data 15
scoreboard players set #20 gm4_hy_data 20
scoreboard players set #25 gm4_hy_data 25
scoreboard players set #49 gm4_hy_data 49
scoreboard players set #100 gm4_hy_data 100
scoreboard players set #250 gm4_hy_data 250
scoreboard players set #900 gm4_hy_data 900
scoreboard players set #3600 gm4_hy_data 3600
scoreboard players set #65536 gm4_hy_data 65536
scoreboard players set #16842752 gm4_hy_data 16842752

scoreboard objectives add gm4_hy_goal dummy
scoreboard objectives add gm4_hy_charge dummy
scoreboard objectives add gm4_hy_next_charge_change dummy
scoreboard objectives add gm4_hy_vine_count dummy
scoreboard objectives add gm4_hy_vine_root_count dummy
scoreboard objectives add gm4_hy_using_spell_trident dummy
scoreboard objectives add gm4_hy_mana_used dummy
scoreboard objectives add gm4_hy_duration dummy
scoreboard objectives add gm4_hy_timer dummy
scoreboard objectives add gm4_hy_id dummy
scoreboard objectives add gm4_hy_regen_cd dummy
scoreboard objectives add gm4_hy_firework_cd dummy

schedule function gm4_hydromancy:tick 1t
schedule function gm4_hydromancy:main 1t
schedule function gm4_hydromancy:clock_coral_core 2s
schedule function gm4_hydromancy:clock_coral_vine 17s
schedule function gm4_hydromancy:clock_tracked_fish 1t

#$moduleUpdateList

# I can't kelp myself
