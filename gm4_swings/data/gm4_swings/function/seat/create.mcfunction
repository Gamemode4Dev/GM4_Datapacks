# Create a new swing seat
# @s = Item display, unsetup swing seat
# at @s rotated as swing main body
# run from gm4_swings:swing/setup

# create seat
summon minecraft:item_display ~ ~ ~ {teleport_duration:2,interpolation_duration:2,Tags:["gm4_swings.swing_seat"],Passengers: \
    [ \
        {id:"minecraft:interaction", Tags:["gm4_swings.interaction.interact","gm4_swings.interaction.hit","gm4_swings.interaction.seat"], height:0.8, width:1}, \
        {id:"minecraft:interaction", Tags:["gm4_swings.interaction.interact","gm4_swings.interaction.hit","gm4_swings.interaction.seat"], height:-0.2, width:1} \
    ] \
}
scoreboard players operation @n[type=minecraft:item_display,tag=gm4_swings.swing_seat,distance=..0.1] gm4_swings.id = $global gm4_swings.id
rotate @n[type=minecraft:item_display,tag=gm4_swings.swing_seat,distance=..0.1] ~ ~
