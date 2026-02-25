# summon a wandering trader for the player
# @s = player right clicking bell with emerald
# at block above bell
# run from gm4_calling_bell:check_trader_hitbox

# summon trader
summon wandering_trader ~ ~ ~ {Tags:["gm4_calling_bell_trader"],DespawnDelay:24000}
playsound entity.wandering_trader.reappeared neutral @a[distance=..16] ~ ~ ~ 1 1 0.6
particle happy_villager ~ ~0.5 ~ 0.3 0.3 0.3 1 5
particle large_smoke ~ ~1 ~ 0.25 0.5 0.25 0 10

# consume emerald
item modify entity @s[gamemode=!creative] weapon.mainhand gm4_calling_bell:minus_one

# update player
scoreboard players operation @s gm4_calling_bell = $day gm4_calling_bell
advancement grant @s only gm4:calling_bell
