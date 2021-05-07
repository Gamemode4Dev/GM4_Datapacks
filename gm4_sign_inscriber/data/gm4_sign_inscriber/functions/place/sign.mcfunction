
# initialize
advancement revoke @s only gm4_sign_inscriber:place_inscribed_sign
data modify storage gm4_sign_inscriber:temp/player SignData set from entity @s SelectedItem.tag.BlockEntityTag
advancement grant @s only gm4:sign_inscriber

# raycast
summon area_effect_cloud ~ ~ ~ {Tags:["gm4_si_place_marker"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[tag=gm4_si_place_marker] ^ ^ ^ ~ ~
scoreboard players set raycast_loop gm4_si_data 100
execute as @e[tag=gm4_si_place_marker] run function gm4_sign_inscriber:place/raycast

# modify sign data
execute at @e[tag=gm4_si_place_marker] if block ~ ~ ~ #minecraft:signs run function gm4_sign_inscriber:place/modify

# kill marker
kill @e[tag=gm4_si_place_marker]