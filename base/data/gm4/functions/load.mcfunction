#This function runs every time a world/server is restarted or /reload is run.
#It waits for a player to be online before checking for updates.
execute if entity @a[limit=1] run function gm4:update
execute unless entity @a[limit=1] run schedule function gm4:load 1t
