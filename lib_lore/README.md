# lib_lore
lib_lore is a mcfunction library that allows other datapacks to easily search, remove, insert, and replace lines of lore on items.

## How to use
There are 4 operations that can be applied. Each operation uses data storage and scoreboards as inputs and outputs.

### Inputs
There are three data storage inputs, along with two scoreboard inputs. Below are their terminologies (will be used further in this document), as well as their uses and the command to set them.

`Source`: This is a list of the lore that will be modified, typically this would be extracted directly from the item being modified, but can be set manually to a desired set of lore.
```mcfunction
data modify storage gm4_lore:temp Source set from <...>
```

`Target`: This is a single json item (i.e. a single 'line' of lore) that will be found during the operations. This sets the line of lore to be searched, removed, inserted after, or replaced.
```mcfunction
data modify storage gm4_lore:temp Target set from <...>
```

`Input`: This is list of the lore that will be inserted or replaced. This should not be set when simply searching or removing and will be ignored if set while using the search or remove operation.
```mcfunction
data modify storage gm4_lore:temp Input set from <...>
```

`start`: This is an integer that determines where the operation will start. It is essentially the offset for the operations. More specific use cases can be found under each specific operation description.
```mcfunction
scoreboard players set $start gm4_lore <value>
```

`extra`: This is an integer that determines the extra lines to be removed after the initial line. This is only used during the remove operation and will be ignored otherwise. More specific use cases can be found under the remove operation description.
```mcfunction
scoreboard players set $extra gm4_lore <value>
```

### Outputs
There are three outputs to work to work with after running an operation. Each operation uses the three outputs differently, which can be found under the specific operation description. Below are their terminologies (will be used further in this document), as well as their general uses and the command to get them.

`Source`: This is the modified version of the input Source.
```mcfunction
data get storage gm4_lore:temp Source
```

`Dump`: This is extra info about the operation that was used, usually the line of lore that was modified.
```mcfunction
data get storage gm4_lore:temp Dump
```

`index`: This is the index of the lore where the operation took place.
```mcfunction
scoreboard players get $index gm4_lore
```


### Operations
Below are the four operations and how to utilize them. Note that every operation requires `Source` and `Target` to be set.

#### Remove
Removes a specified line of lore

- `start` determines where the removal will start when it finds the `Target` line; this can be negative to start removing before the line or positive to start removing after the line. Defaults to 0.
- `extra` determines how many more lines to remove after the first target line is removed. Must be positive. Defaults to 0. If set to -1, every line after the first target line will be removed.

```mcfunction
function #gm4_lore:remove
```

- `Source` is the updated `Source` without the `Target` line.
- `Dump` is the removed line of lore.
- `index` is the location of first line that was removed.


#### Search
Finds the index of a specified line of lore
- `start` determines where the search will start; must be a positive number. Defaults to 0.

```mcfunction
function #gm4_lore:search
```

- `Source` remains unchanged.
- `Dump` is the found line of lore (`Target`).
- `index` is the location of first line that was found.


#### Insert
Inserts lines of lore after a specified line of lore

- `Input` determines the lines of lore to add after the `Target` line
- `start` determines where the insertion will start when it finds the `Target` line; this can be negative to insert before the line or positive to insert after the line. Defaults to 0.

```mcfunction
function #gm4_lore:insert
```

- `Source` is the updated `Source` with the added lore.
- `Dump` is the added lines of lore (`Input`).
- `index` is the location of first line that was added.


#### Replace
Replaces a specified line of lore with one or more new lines of lore

- `Input ` determines the lines of lore to replace the `Target` line
- `start` determines where the search for the `Target` line will start; must be a positive number. Defaults to 0.

```mcfunction
function #gm4_lore:replace
```

- `Source` is the updated `Source` with the replaced lore
- `Dump` is the replaced line of lore (`Target`)
- `index` is the location of first line that was replaced.


Please note that the `example_pack` must be started by calling `#load:load`, as a proper load implementation is not included.

## Technical Details
- Technically the item isn't modified directly, this means the `Source` and be added to the lore of the item using the default `data modify` operations.
- These operations are technically not limited to lore, but can also be used for any type of list.

## License
This library, and the contents of the `lib_lore` directory on the [github repository](https://github.com/Gamemode4Dev/GM4_Datapacks), is licensed under the MIT License.
