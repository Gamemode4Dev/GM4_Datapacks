# @template gm4:test_platform
# @dummy ~ ~1 ~

setblock ~ ~ ~ dirt_path

await entity @s[nbt={Attributes:[{Name:"minecraft:generic.movement_speed",Modifiers:[{Amount:0.2,Operation:1}]}]}]

tp @s ~1.5 ~1 ~

await entity @s[nbt=!{Attributes:[{Name:"minecraft:generic.movement_speed",Modifiers:[{Amount:0.2,Operation:1}]}]}]
