#check players for impulse core
tag @a remove gm4_holding_impulse_core
execute as @a[tag=!gm4_holding_impulse_core,nbt={Inventory:[{Slot:-106b,tag:{gm4_impulse_core:1b},Count:1b}]}] at @s run tag @s add gm4_holding_impulse_core

tag @a[tag=!gm4_holding_impulse_core,tag=gm4_impulse_cores_has_armour] remove gm4_impulse_cores_has_armour
scoreboard players reset @a[tag=!gm4_impulse_cores_has_armour,scores={gm4_ic_chrg_use=1..}] gm4_ic_chrg_use
execute as @a[tag=gm4_holding_impulse_core,gamemode=!spectator] at @s run function impulse_cores:player/holding_impulse_core

#impulse core charging
execute as @e[type=minecraft:item,tag=!gm4_impulse_core_charging,nbt={Item:{id:"minecraft:nether_star",Count:1b},OnGround:1b}] at @s align xyz positioned ~.5 ~.5 ~.5 if block ~ ~ ~ minecraft:player_head{Owner:{Id:"05018caf-146c-480a-9738-f13cbbbbf094"}} if block ~ ~-1 ~ minecraft:beacon run function impulse_cores:item/charge/start

#fix broken items
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:player_head",tag:{SkullOwner:{Id:"05018caf-146c-480a-9738-f13cbbbbf094"}}}},nbt=!{Item:{tag:{gm4_impulse_core:1b}}}] at @s run function impulse_cores:item/fix_broken
