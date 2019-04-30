#run from detection_master_main
#@s = as and at drawer with acceptable upgrade

scoreboard players set @s gm4_sd_max 6144
kill @e[type=item, limit=1, sort=nearest, distance=..1, nbt={Item: {tag: {CustomModelData:4911315144, display: {Name: '{"text":"Storage Upgrade: Diamond"}'}}}}]
scoreboard players add @s gm4_sd_upgrade 1