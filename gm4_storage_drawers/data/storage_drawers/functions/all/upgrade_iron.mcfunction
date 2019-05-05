#run from main
#@s = as and at drawer with acceptable upgrade

scoreboard players set @s gm4_sd_max 4096
kill @e[type=item, limit=1, sort=nearest, distance=..1, nbt={gm4_storage_drawers_upgrade_iron:1b}]
scoreboard players add @s gm4_sd_upgrade 1