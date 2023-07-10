# @s = player that just used an glow ink bottle on a sign
# run from advancement use_ink_bottle_on_sign

advancement revoke @s only gm4_standard_liquids:use_glow_ink_bottle_on_sign
summon marker ~ ~ ~ {Tags:["gm4_ink_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[type=marker,tag=gm4_ink_ray,limit=1] ^ ^ ^ ~ ~
scoreboard players set $ray gm4_lt_util 0
execute as @e[tag=gm4_ink_ray,distance=..8] at @s run function gm4_standard_liquids:util/signs/ray
execute at @e[tag=gm4_ink_ray,distance=..8] align xyz run function gm4_standard_liquids:util/signs/front_back_detection
execute at @e[tag=gm4_ink_ray,distance=..8] if block ~ ~ ~ #minecraft:all_signs{is_waxed:1b} run playsound minecraft:block.sign.waxed_interact_fail block @p[distance=..8]
execute if score $sign_front gm4_lt_util matches 1 at @e[tag=gm4_ink_ray,distance=..8] align xyz unless block ~ ~ ~ #minecraft:all_signs{is_waxed:1b} unless block ~ ~ ~ #minecraft:all_signs{front_text:{has_glowing_text:1b}} run function gm4_standard_liquids:util/signs/apply_glow_ink_sac_front
execute if score $sign_front gm4_lt_util matches 0 at @e[tag=gm4_ink_ray,distance=..8] align xyz unless block ~ ~ ~ #minecraft:all_signs{is_waxed:1b} unless block ~ ~ ~ #minecraft:all_signs{back_text:{has_glowing_text:1b}} run function gm4_standard_liquids:util/signs/apply_glow_ink_sac_back
kill @e[tag=gm4_ink_ray,type=marker,distance=..8]
