#run from detection_master_main
#@s = as and at drawer with acceptable upgrade

scoreboard players set @s gm4_sd_max 5120
kill @e[type=item, limit=1, sort=nearest, distance=..1, nbt={Item: {tag: {CustomModelData:715124, display: {Name: '{"text":"Storage Upgrade: Gold"}'}}}}]
scoreboard players add @s gm4_sd_upgrade 1