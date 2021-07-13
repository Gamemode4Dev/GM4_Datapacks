# @s = item that is to summon a special entity
# run from reel_in/set_data

execute if entity @s[nbt={Item:{tag:{gm4_end_fishing:{set_data:{id:"end_phantom"}}}}}] run function gm4_end_fishing:reel_in/spawn_phantom
execute if entity @s[nbt={Item:{tag:{gm4_end_fishing:{set_data:{id:"endermite"}}}}}] as @e[type=marker,tag=gm4_ef_loot,limit=1] at @s run summon endermite ^ ^ ^1 {DeathLootTable:"gm4_end_fishing:entities/endermite"}
kill @s
