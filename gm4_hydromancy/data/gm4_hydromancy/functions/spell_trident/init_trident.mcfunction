# initialize a newly throw spell trident with mana
# @s = spell trident
# at @s
# run from spell_trident/thrown

execute unless entity @e[type=trident,tag=gm4_hy_spell_trident] run schedule function gm4_hydromancy:spell_trident/clock 1t

tag @s add gm4_hy_spell_trident
tag @s add gm4_hy_spell_trident.in_air

stopsound @a[distance=..16] player minecraft:item.trident.throw
playsound block.conduit.attack.target player @a[distance=..16] ~ ~ ~ 1 1.75
playsound item.trident.riptide_1 player @a[distance=..16] ~ ~ ~ 0.5 0.65


execute store result score $spell_id gm4_hy_data run data get entity @s Trident.tag.gm4_hy_spell_trident.spell_id

# ride trident
#TODO: dismounting, use mana for distance travelled
execute if score $spell_id gm4_hy_data matches 1 run function gm4_hydromancy:spell_trident/ride/initialize
# bonemeal around landing, regrow coral, regen entities
# suck in items, drop when picked up
# firecracker (firework shot, no gravity)
# builders wand



#data modify entity @s SoundEvent set value "item.trident.thunder"
