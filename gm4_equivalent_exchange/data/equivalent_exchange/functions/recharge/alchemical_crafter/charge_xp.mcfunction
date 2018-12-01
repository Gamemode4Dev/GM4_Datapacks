#@s = alchemical crafter near player giving it xp
#run from recharge/consume_xp

#check and store charge of transmutation stone
execute store result score @s gm4_ee_charge run data get block ~ ~ ~ Items[0].tag.gm4_transmutation_charge

execute if score @s gm4_ee_charge matches ..99 run scoreboard players add @s gm4_ee_charge 1
execute if score @s gm4_ee_charge matches 101.. run scoreboard players set @s gm4_ee_charge 100

#apply new charge
execute store result block ~ ~ ~ Items[0].tag.gm4_transmutation_charge short 1 run scoreboard players get @s gm4_ee_charge