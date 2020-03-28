# @s = tunnel bore storage aec that has a rail to place and solid groudn beneath
# at tunnel bore minecart
# called by gm4_tunnel_bores:bore/item_consumption/rail/check_solidity

setblock ^ ^ ^1 rail keep
scoreboard players remove @s gm4_bore_rail 1

# playsound
playsound block.lantern.place block @a[distance=..8] ~ ~ ~ 0.5 0.5 0

# store operation
scoreboard players add placed_rail gm4_bore_rail 1
