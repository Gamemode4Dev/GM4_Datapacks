scoreboard objectives add gm4_swings.id dummy
scoreboard objectives add gm4_swings.angular_velocity dummy
scoreboard objectives add gm4_swings.push_torque dummy
scoreboard objectives add gm4_swings.toggle dummy
scoreboard objectives add gm4_swings.min_velocity dummy
scoreboard objectives add gm4_swings.max_velocity dummy
scoreboard objectives add gm4_swings.length dummy
scoreboard objectives add gm4_swings.dummy dummy

scoreboard objectives add gm4_swings.on_join minecraft.custom:minecraft.leave_game
scoreboard players reset * gm4_swings.on_join
scoreboard players set @a gm4_swings.on_join 0

# constants
data merge storage gm4_swings:constants {gravity:0.08, mass:140, player_torque:1.5, damping:0.01, minimum_oscillation:0.3, max_length:9}

function gm4_swings:tick
function gm4_swings:tick_5s
