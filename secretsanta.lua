 --------------------------------------------------------------------------
---[[""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""]]---
--[[       secretsanta: a generator for randomized gift-giving          ]]--
--[[  Copyright © 2017 cupantae - Mark O'Neill - cupantae@uineill.net   ]]--
---[[__________________________________________________________________]]---
 --------------------------------------------------------------------------

io.write("\n\n  === WELCOME TO MY SECRET SANTA MATCH GENERATOR ===\n")
io.write("      -- Enter a blank name when you're done. --\n")
io.write("\nEnter the name of one person in the Secret Santa: ")

entry = io.read()
name = entry:match ( "%S+" )

i = 1
people = {}
while name ~= nil do
    people[i] = name
    i = i + 1
    io.write("Write another name: ")
    entry = io.read()
    name = entry:match ( "%S+" )
end

io.write("\n                  -----\n")
total = #people
if total == 0 then
    io.write("\n\nFine then.\n")
    return "If you don't want to use it, that's just fine."
elseif total == 1 then
    io.write("\n\n   You'll have to buy for yourself, " .. people[1] .. ".\n")
    return "LONELY_XMAS"
elseif total == 2 then
    io.write("Well then it's obvious: " .. people[1] .. " and " .. people[2] .. " just buy for each other!")
    return "BESTBUDS"
elseif total > 2 then
    matches = {}        -- same size as people, and matches buyers to buyees
    revmatches = {}        -- reverse of the above
    for i = 1,total do
        while matches[i] == nil do
            matches[i] = math.random(total)
            if matches[i] == i or revmatches [ matches[i] ] ~= nil then
                matches[i] = nil
            else
                revmatches[ matches[i] ] = i
            end
        end
        io.write(people[i] .. " is buying for " .. people[ matches[i] ] .. ".\n" )
    end
    io.write("\n    -----\n\n  Did that work?!?!\n")
    return 0   --> (succesful exit :D )
else io.write("people is of type " .. type(people) .. "\n\n") --> debug
end
