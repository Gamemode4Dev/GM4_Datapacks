#stonecutter damage audiovisuals
#@s - @e[type=!#damaging_stonecutters:no_target]
#called by damaging_stonecutters:check_damage / damaging_stonecutters:damage

#audiovisuals
particle minecraft:block minecraft:stonecutter ~ ~ ~ .25 0 .25 0 10 normal @a
particle minecraft:block minecraft:redstone_block ~ ~ ~ .25 0 .25 0 10 normal @a

playsound minecraft:entity.player.hurt_sweet_berry_bush player @a[distance=..20] ~ ~ ~ 100 0 1
