# summon a wandering trader for the player
# @s = player right clicking bell with emerald
# above bell
# run from gm4_calling_bell:bell/ray/loop

# summon trader
summon wandering_trader ~ ~ ~ {Tags:["gm4_calling_bell_trader"],DespawnDelay:24000}
particle happy_villager ~ ~0.5 ~ 0.3 0.3 0.3 1 5
playsound entity.wandering_trader.reappeared neutral @a[distance=..16] ~ ~ ~ 1 1 0.6
particle minecraft:large_smoke ~ ~1 ~ 0.25 0.5 0.25 0 10

# consume emerald
item modify entity @s[gamemode=!creative] weapon.mainhand gm4_calling_bell:minus_one

# set up trader
function #gm4_trades:register_trades
execute as @e[type=wandering_trader,tag=gm4_calling_bell_trader,tag=!gm4_trader,limit=1,sort=nearest] run function #gm4_trades:modify_external_trader

advancement grant @s only gm4:calling_bell
