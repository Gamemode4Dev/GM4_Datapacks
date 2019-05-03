#damages entity
#@s - @e[type=!#damaging_stonecutters:no_target]
#called by damaging_stonecutters:check_damage

#damage entity
effect give @s minecraft:absorption 1 0 true
effect give @s[type=!#damaging_stonecutters:undead] minecraft:instant_damage 1 0 true
effect give @s[type=#damaging_stonecutters:undead] minecraft:instant_health 1 0 true

#audiovisuals
function damaging_stonecutters:audiovisuals
