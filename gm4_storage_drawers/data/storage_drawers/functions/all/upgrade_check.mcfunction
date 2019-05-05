#run from main
#@s = as and at drawer with potential upgrade in range distance=..1

execute if entity @e[type=item, limit=1, sort=nearest, distance=..1, nbt={gm4_storage_drawers_upgrade_stone:1b}] run function storage_drawers:all/upgrade_stone
execute if entity @e[type=item, limit=1, sort=nearest, distance=..1, nbt={gm4_storage_drawers_upgrade_iron:1b}] run function storage_drawers:all/upgrade_iron
execute if entity @e[type=item, limit=1, sort=nearest, distance=..1, nbt={gm4_storage_drawers_upgrade_gold:1b}] run function storage_drawers:all/upgrade_gold
execute if entity @e[type=item, limit=1, sort=nearest, distance=..1, nbt={gm4_storage_drawers_upgrade_diamond:1b}] run function storage_drawers:all/upgrade_diamond
execute if entity @e[type=item, limit=1, sort=nearest, distance=..1, nbt={gm4_storage_drawers_upgrade_emerald:1b}] run function storage_drawers:all/upgrade_emerald