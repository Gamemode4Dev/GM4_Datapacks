# @s = lightning rod item on ground after the countdown

execute if block ~ ~-1 ~ spawner{SpawnData:{id:"minecraft:creeper"}} run function lightning_rods:convert_creeper_spawner
execute if block ~ ~-1 ~ purpur_block run function lightning_rods:create_shulker

summon lightning_bolt
kill @s
