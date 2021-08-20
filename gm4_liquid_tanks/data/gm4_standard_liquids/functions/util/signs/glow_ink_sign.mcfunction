# @s = player that just used an glow ink bottle on a sign
# run from advancement use_ink_bottle_on_sign

advancement revoke @s only gm4_standard_liquids:use_glow_ink_bottle_on_sign
summon marker ~ ~ ~ {Tags:["gm4_ink_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[type=marker,tag=gm4_ink_ray,limit=1] ^ ^ ^ ~ ~
scoreboard players set $ray gm4_lt_util 0
execute as @e[tag=gm4_ink_ray] at @s run function gm4_standard_liquids:util/signs/ray
execute at @e[tag=gm4_ink_ray] align xyz unless block ~ ~ ~ #minecraft:signs{GlowingText:1b} run function gm4_standard_liquids:util/signs/apply_glow_ink_sac
kill @e[tag=gm4_ink_ray]
