# @s = player attempting to apply ink
# at sign block, align xyz
# run from ink_sign and glow_ink_sign

# lookup table converting blockstate to normal direction
execute summon marker run function gm4_standard_liquids:util/signs/sign_normal_lookup

# detection for which side of the sign center-plane is the player on
scoreboard players set $sign_front gm4_lt_util 0
execute at @e[type=marker,tag=gm4_ink_normal,limit=1,distance=..4] positioned ^ ^ ^-1 facing entity @s feet rotated ~ 0 positioned ^ ^ ^1 if entity @e[type=marker,tag=gm4_ink_normal,distance=..1.414] run scoreboard players set $sign_front gm4_lt_util 1

kill @e[tag=gm4_ink_normal,type=marker,distance=..4]
