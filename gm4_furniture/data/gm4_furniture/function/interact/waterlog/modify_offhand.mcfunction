# swap empty bucket for water bucket offhand
# @s = player holding bucket
# at furniture's interacted interaction entity
# run from interact/waterlog/unlog

execute if items entity @s weapon.offhand bucket[count=1] run return run item replace entity @s[gamemode=!creative] weapon.offhand with water_bucket

# stacked buckets
item modify entity @s weapon.offhand {function:"minecraft:set_count",count:-1,add:1b}
execute at @s run summon item ~ ~ ~ {Item:{id:"water_bucket",count:1}}
