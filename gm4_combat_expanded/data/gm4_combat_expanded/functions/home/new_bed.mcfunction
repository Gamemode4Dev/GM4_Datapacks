# spawn a new bed
# @s = player sleeping
# at @s
# run from home/process_sleep

##TODO: this is wrong, the bed might already have a marker, just not with this players id stored

# spawn new marker and init it's array, store player id there
summon marker ~ ~ ~ {Tags:["gm4_ce_bed"],data:{gm4_combat_expanded:{bed_users:[{uses:1,id:-1}]}}}
execute store result entity @e[type=marker,tag=gm4_ce_bed,limit=1,sort=nearest,distance=..0.1] data.gm4_combat_expanded.bed_users[0].id int 1 run scoreboard players get $id gm4_ce_data
