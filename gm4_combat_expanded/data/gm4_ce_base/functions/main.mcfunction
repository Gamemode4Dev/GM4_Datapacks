schedule function gm4_ce_base:main 16t

# | Mobs
# initiate new mobs
execute as @e[type=#gm4_ce_base:modify,tag=!smithed.entity,tag=!gm4_ce_processed,nbt=!{PersistenceRequired:1b}] at @s run function gm4_ce_base:mob/init/check_mob
schedule function gm4_ce_base:mob/init/apply/check_damage_cap_schedule 1t
# phantoms drown under water
execute as @e[type=phantom,tag=!smithed.entity] at @s if block ~ ~ ~ #gm4:water run damage @s 2 drown

# | Players
# player submain
schedule function gm4_ce_base:clocks/player_submain 8t

# DEV: trigger for players with `gm4_ce_dev` tag
execute as @a[tag=gm4_ce_dev] at @s as @e[type=#gm4_ce_base:modify,limit=1,sort=nearest] run function gm4_ce_base:debug/dont_run/dev 
