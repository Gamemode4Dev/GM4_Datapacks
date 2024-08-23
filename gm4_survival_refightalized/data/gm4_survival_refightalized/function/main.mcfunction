schedule function gm4_survival_refightalized:main 16t

# function tag call for expansions to keep clocks sync'd
function #gm4_survival_refightalized:main

# Inititate newly spawned mobs, as long as they are in the modify entity tag list
execute as @e[type=#gm4_survival_refightalized:modify,tag=!smithed.entity,tag=!gm4_sr_processed,nbt=!{PersistenceRequired:1b}] at @s run function gm4_survival_refightalized:mob/init/check_mob
schedule function gm4_survival_refightalized:mob/init/stat/check_damage_cap_schedule 1t

# phantoms drown under water
execute as @e[type=phantom,tag=!smithed.entity] at @s if block ~ ~ ~ #gm4:water run damage @s 2 drown

# restore armor here as well as in player submain to make it happen every 8 ticks
execute as @a[gamemode=!spectator,tag=gm4_sr_armor_reduced,scores={gm4_sr_armor_reduction_timer=0}] run function gm4_survival_refightalized:player/health/regain_armor

# tick down skeleton arrow fire delay
execute as @e[type=#gm4_survival_refightalized:can_fire_arrows,scores={gm4_sr_arrow_fire_delay_left=1..}] run function gm4_survival_refightalized:mob/process/arrow/tick_fire_delay

# schedule player submain 8 ticks from now
schedule function gm4_survival_refightalized:player_submain 8t
