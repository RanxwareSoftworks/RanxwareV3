-- executes the same script within multiple place ids (pro servers, vc servers, etc.)

local GameScriptPath = "https://github.com/RanxwareSoftworks/RanxwareV3/raw/refs/heads/main/games/"
local Scripts = {
    ["UntitledTagGame"] = {14044547200},
    ["MVSDuels"] = {12355337193},
    ["PassTheBomb"] = {2961583129},
    ["Planks"] = {140636953470579},
    ["BladeBall"] = {13772394625},
    ["DeathPenalty"] = {15654981113},
    ["Fortblox"] = {16605303570},
    ["Baddies"] = {11158043705}
}

local function LoadScript(Source)
    loadstring(game:HttpGet(`{GameScriptPath}{Source}.luau`))()
end

local PlaceId = game.PlaceId

for Source,Contents in pairs(Scripts) do
    for _,Id in pairs(Contents) do
        if Id == PlaceId then
            task.spawn(LoadScript, Source)
            break
        end
    end
end
