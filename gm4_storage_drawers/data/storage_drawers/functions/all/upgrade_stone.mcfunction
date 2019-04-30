#run from detection_master_main
#@s = as and at drawer with acceptable upgrade

scoreboard players set @s gm4_sd_max 3072
kill @e[type=item, limit=1, sort=nearest, distance=..1, nbt={Item: {tag: {CustomModelData:1920155, display: {Name: '{"text":"Storage Upgrade: Stone"}'}}}}]
scoreboard players add @s gm4_sd_upgrade 1