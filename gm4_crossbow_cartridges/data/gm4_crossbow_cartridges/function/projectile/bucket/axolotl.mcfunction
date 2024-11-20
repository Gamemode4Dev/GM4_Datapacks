# Summon axolotl
# @s = player using the crossbow
# at arrow
# run from projectile/bucket

# replace arrow with axolotl and copy data
summon minecraft:axolotl ~ ~ ~ {FromBucket:1b,Tags:["gm4_cb_projectile"],active_effects:[{id:'minecraft:regeneration',amplifier:10,duration:200,show_particles:0b}]}

# TODO 1.20.5: changed to copy all bucket entity data, check if this causes problems
data modify storage gm4_crossbow_cartridges:temp projectile merge from entity @s Inventory[{Slot:-106b}].components."minecraft.bucket_entity_data"
execute as @e[type=minecraft:axolotl,tag=gm4_cb_projectile,limit=1,distance=..1] run function gm4_crossbow_cartridges:projectile/arrow_motion

# axolotl sound
playsound minecraft:entity.axolotl.idle_air player @a[distance=..15] ^ ^ ^1 2 .5

# shoot 2 more if using multishot
execute at @e[tag=gm4_cb_arrow,distance=..1,limit=2] run function gm4_crossbow_cartridges:projectile/bucket/multishot/axolotl
