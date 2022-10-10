# summon a wandering trader for the player
# @s = player right clicking bell with emerald
# above bell
# run from gm4_calling_bell:trader/init

# summon trader
summon wandering_trader ~ ~ ~ {Tags:["gm4_calling_bell_trader"],DespawnDelay:24000}
particle happy_villager ~ ~0.5 ~ 0.3 0.3 0.3 1 5
playsound entity.wandering_trader.reappeared neutral @a[distance=..16] ~ ~ ~ 1 1 0.6

# consume emerald
item modify entity @s[gamemode=!creative] weapon.mainhand gm4_calling_bell:minus_one

# set up trader
execute as @e[type=wandering_trader,tag=gm4_calling_bell_trader,tag=!gm4_trader,limit=1,sort=nearest] run function #gm4_trades:wandering_trader/setup_trader

advancement grant @s only gm4:calling_bell
