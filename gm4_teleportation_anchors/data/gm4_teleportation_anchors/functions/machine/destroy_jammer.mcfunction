# destroys the teleportation_jammer
# @s = teleportation_jammer marker
# located at @s
# run from gm4_teleportation_anchors:machine/verify_destroy

# kill entities related to machine block
execute positioned ~ ~-0.4 ~ run kill @e[type=armor_stand,tag=gm4_teleportation_jammer_stand,limit=1,distance=..0.01]
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:dropper",Count:1b,tag:{display:{Name:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"color":"#373737","font":"minecraft:default","text":"Teleportation Jammer"},{"font":"gm4:half_scale","extra":[{"font":"gm4:inverted","text":"Teleportation Jammer"},{"font":"gm4:inverted_spacing","text":"Teleportation Jammer"},{"font":"gm4:offscreen","text":"Teleportation Jammer"},{"color":"white","font":"gm4:container_gui","translate":"gui.gm4.teleportation_jammer"},{"font":"gm4:half_scale","text":"Teleportation Jammer"},{"font":"gm4:inverted","text":"Teleportation Jammer"},{"font":"gm4:inverted_spacing","text":"Teleportation Jammer"},{"color":"#373737","font":"minecraft:default","text":"Teleportation Jammer"}],"text":"Teleportation Jammer"}]},{"translate":"%1$s%3427656$s","with":[{"color":"#373737","font":"minecraft:default","translate":"container.gm4.teleportation_jammer"},{"font":"gm4:half_scale","extra":[{"font":"gm4:inverted","translate":"container.gm4.teleportation_jammer"},{"font":"gm4:inverted_spacing","translate":"container.gm4.teleportation_jammer"},{"font":"gm4:offscreen","translate":"container.gm4.teleportation_jammer"},{"color":"white","font":"gm4:container_gui","translate":"gui.gm4.teleportation_jammer"},{"font":"gm4:half_scale","translate":"container.gm4.teleportation_jammer"},{"font":"gm4:inverted","translate":"container.gm4.teleportation_jammer"},{"font":"gm4:inverted_spacing","translate":"container.gm4.teleportation_jammer"},{"color":"#373737","font":"minecraft:default","translate":"container.gm4.teleportation_jammer"}],"translate":"container.gm4.teleportation_jammer"}]}]}'}}}},limit=1,sort=nearest]
kill @s

# drop item (unless broken in creative mode)
particle block purpur_block ~ ~0.6 ~ .1 .25 .1 .05 30 normal @a
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot gm4_teleportation_anchors:items/teleportation_jammer
