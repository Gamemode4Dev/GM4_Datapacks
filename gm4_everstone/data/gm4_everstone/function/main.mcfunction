execute as @e[type=item] if items entity @s contents minecraft:firework_star[count=1,custom_data~{gm4_everstone:1b}] if entity @s[nbt={OnGround:1b}] at @s run function gm4_everstone:age_locking/check

schedule function gm4_everstone:main 16t
