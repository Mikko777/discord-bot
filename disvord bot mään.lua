ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local Webhook = "https://discordapp.com/api/webhooks/" 
local DC_nimi = "Mikon discord botti"					
local DC_kuva = "https://imgur.com/a/qY1QphB"

Citizen.CreateThread(function()
	Citizen.Wait(10000)
	PelaajiaServulla()
end)

function PelaajiaServulla()
	local pelaajia 		= ESX.GetPlayers()
	local pelaajamaara 	= 777 -- PELAAJAMÄÄRÄ
    local pelaajat		= 0
	for i=1, #pelaajia, 1 do
		local xPlayer = ESX.GetPlayerFromId(pelaajia[i])
		pelaajat = pelaajat + 1
    end
	JAUUTOIMII("Status",'```Pelaajia: '..pelaajat..' / ' ..pelaajamaara..' '..'```', 11010819)
	SetTimeout(300000, PelaajiaServulla)
end

function JAUUTOIMII(name, message, color)
	local connect = {  { ["color"] = color, ["title"] = "**".. name .."**", ["description"] = message, ["footer"] = { ["text"] = "", }, } }
	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = DC_nimi, embeds = connect, avatar_url = DC_kuva}), { ['Content-Type'] = 'application/json' })
end
