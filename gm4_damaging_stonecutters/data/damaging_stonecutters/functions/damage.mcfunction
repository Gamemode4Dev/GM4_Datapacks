#damages entity
#@s - @e[type=!#damaging_stonecutters:stonecutter_immune]
#called by damaging_stonecutters:check_damage

#damage entity
effect give @s minecraft:absorption 1 0 true
effect give @s[type=!#damaging_stonecutters:undead] minecraft:instant_damage 1 0 true
effect give @s[type=#damaging_stonecutters:undead] minecraft:instant_health 1 0 true

#audiovisuals
particle minecraft:block minecraft:stonecutter ~ ~ ~ .25 0 .25 0 10 normal @a
particle minecraft:block minecraft:redstone_block ~ ~ ~ .25 0 .25 0 10 normal @a

playsound minecraft:entity.player.hurt_sweet_berry_bush player @a[distance=..20] ~ ~ ~ 100 0 1
