#announce module installation
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Installing Moneo Shamir...",{"translate":"text.gm4.modules.update.installing","with":[{"translate":"module.gm4.moneo_shamir"}]}]}]
execute unless entity @a[limit=1] run say GM4: Installing Moneo Shamir...

# There's nothing really here to do at the moment

#announce success
tellraw @a[gamemode=creative] [{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}]},{"translate":"%1$s%3427655$s","with":["Moneo Shamir Installed!",{"translate":"text.gm4.modules.update.installed","with":[{"translate":"module.gm4.moneo_shamir"}]}]}]
execute unless entity @a[limit=1] run say GM4: Moneo Shamir Installed!

#check other modules to make sure they're up to date.
#$moduleUpdateList
