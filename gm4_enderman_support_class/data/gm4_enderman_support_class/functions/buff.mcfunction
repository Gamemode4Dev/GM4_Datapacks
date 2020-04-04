# @s = mob or player in range of an enderman

# grant advancement to players nearby
advancement grant @s[type=player,gamemode=!spectator] only gm4:enderman_support_class

# apply buff effect to entities in range
effect give @s[type=cave_spider] jump_boost 4 1
effect give @s[type=creeper] regeneration 4 0
effect give @s[type=silverfish] resistance 4 1
effect give @s[type=spider] jump_boost 4 1
effect give @s[type=zombie] speed 4 1
execute at @s[type=skeleton] run effect give @a[gamemode=!spectator,distance=..7] weakness 7 0
execute at @s[type=shulker] run effect give @a[gamemode=!spectator,distance=..7] blindness 3 9
