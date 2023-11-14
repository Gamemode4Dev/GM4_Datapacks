# Summon tropical fish
# @s = player using the crossbow
# at arrow
# run from projectile/bucket

# replace arrow with tropical fish and copy data
summon minecraft:tropical_fish ~ ~ ~ {FromBucket:1b,Tags:["gm4_cb_projectile"],active_effects:[{id:'minecraft:regeneration',amplifier:10,duration:200,show_particles:0b}]}

data modify storage gm4_crossbow_cartridges:temp projectile.Variant set from entity @s Inventory[{Slot:-106b}].tag.BucketVariantTag
execute as @e[type=minecraft:tropical_fish,tag=gm4_cb_projectile,limit=1,distance=..1] run function gm4_crossbow_cartridges:projectile/arrow_motion

# fish flop sound
playsound minecraft:entity.tropical_fish.flop player @a[distance=..15] ^ ^ ^1 2 .5

# shoot 2 more if using multishot
execute at @e[tag=gm4_cb_arrow,distance=..1,limit=2] run function gm4_crossbow_cartridges:projectile/bucket/multishot/tropical
