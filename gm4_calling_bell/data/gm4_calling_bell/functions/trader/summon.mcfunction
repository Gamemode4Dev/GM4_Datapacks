# summon a wandering trader for the player
# @s = marker, tag=gm4_wandering_trader_ray
# at bell
# run from trader/init

summon wandering_trader ~ ~ ~ {Tags:["gm4_calling_bell_trader"],DespawnDelay:24000}

item modify entity @a[gamemode=!creative,tag=gm4_calling_bell_bell_ringer,limit=1] weapon.mainhand gm4_calling_bell:minus_one

execute at @e[type=wandering_trader,tag=gm4_calling_bell_trader,tag=!gm4_trader,limit=1,sort=nearest] run playsound entity.wandering_trader.reappeared neutral @a[distance=..16] ~ ~ ~ 1 1 0.6
execute as @e[type=wandering_trader,tag=gm4_calling_bell_trader,tag=!gm4_trader,limit=1,sort=nearest] run function gm4_trades-1.1:wandering_trader/modify
advancement grant @a[tag=gm4_calling_bell_bell_ringer,limit=1] only gm4:calling_bell