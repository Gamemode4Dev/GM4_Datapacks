#@s = item that is to summon a special entity
#run from reel_in/set_data

execute if entity @s[nbt={Item:{tag:{gm4_end_fishing:{set_data:{id:"end_phantom"}}}}}] run function gm4_end_fishing:reel_in/spawn_phantom
execute if entity @s[nbt={Item:{tag:{gm4_end_fishing:{set_data:{id:"endermite"}}}}}] as @e[type=area_effect_cloud,tag=gm4_ef_loot,limit=1,sort=nearest] at @s run summon endermite ^ ^ ^1 {DeathLootTable:"gm4_end_fishing:entities/endermite"}
kill @s
