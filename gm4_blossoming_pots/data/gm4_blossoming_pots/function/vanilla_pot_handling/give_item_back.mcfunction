# Gives player the vanilla flower pot item back that they tried to plant in a custom flower pot
# @s = temp marker inside filled vanilla flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {UUID, id}
# run from vanilla_pot_handling/as_marker

$execute at @p[nbt={UUID:$(UUID)},gamemode=!creative] run summon minecraft:item ~ ~ ~ {Item:{id:"$(id)"}}
    # Note: Possibly, if we exit out of as_marker, this can run as the player and we dont need to select the UUID? We'd need to signal as_player to do this.
