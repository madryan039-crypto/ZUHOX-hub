local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL(data) m=string.sub(data, 0, 55) data=data:gsub(m,'')

data = string.gsub(data, '[^'..b..'=]', '') return (data:gsub('.', function(x) if (x == '=') then return '' end local r,f='',(b:find(x)-1) for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end return r; end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x) if (#x ~= 8) then return '' end local c=0 for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end return string.char(c) end)) end


 


local Library = loadstring(game:HttpGet(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('ImZFpbQvCSZqnAsmxptHWdlJghQsGTdQAcSrULkUCNuIUOoVSnsnOFnaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1JFRFpIVUIvTGlicmFyeVYyL21haW4vc291cmNlLmx1YQ==')))()

local Window = Library:CreateWindow({
    Name = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('eCTzAEYzTqhbXlbEOzRjIDPhAmahOqWKZMXEnHKXwznagpJIwPQvvTgWlVIT1ggSFVC'),
    Mobile = true,
    Color = Color3.fromRGB(255, 0, 0)
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('keVQDaLtflIVyyMvDTPAAWYTERvEysjccYJwnqUVHXMKZMUZQwuSbyfSHVtYW5vaWRSb290UGFydA=='))

local autoFarmEnabled = false
local selectedWeapon = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('sxWBXhuddDXMoLykaoNxfNeqOYbTcnEPIgQnOMXSAcPzFHEOmhqeOgHTWVsZWU=')
local currentTarget = nil

local autoMelee = false
local autoDefense = false
local autoSword = false

local MainTab = Window:CreateTab({
    Name = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('pigDGZiigKFsNKHHbFKAcXcmugBAhteABNIOnXmftdcOagRSplvkDYfTWFpbg=='),
    Icon = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('sLITHuAYnwQgjCKnyXJoxJPAvTaTkLQCqrfnDJlgLQCZmrcevCMrrCrcmJ4YXNzZXRpZDovLzYwMzEwODMxNTI=')
})

local AutoFarmSection = MainTab:CreateSection({
    Name = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('uQIugroTslkQwegBzltIIxtoaSFbFGSUjjMCqQtzzOwCIzkKTDxekdaQXV0byBGYXJtIExldmVs')
})

AutoFarmSection:CreateToggle({
    Name = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('mHcGdSZwNavvlXMHjnowXnOrlgSekCNgKTaXCcrXHsxmyARwkfInglpQXRpdmFyIEF1dG8gRmFybQ=='),
    Description = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('GAaPlLeDFeSYlrTOMdsMaDhFIAdLXNqtKjzwyGHuKYweIQmCfUhtRjzQXV0b21hdGljYW1lbnRlIGZhcm1hIG7DrXZlbCBtYXRhbmRvIE5QQ3M='),
    Flag = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('EHHMqTYEBExshcvmIVNKqfprnxYbmNUMnCkgawkWRHebdtFUbToZvBDQXV0b0Zhcm1Ub2dnbGU='),
    Callback = function(state)
        autoFarmEnabled = state
        if state then
            AutoFarm()
        else
            currentTarget = nil
        end
    end
})

AutoFarmSection:CreateDropdown({
    Name = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('OytUntdsEfcjtSRNmcxFlmfWzOgeDQDNsfZmfXIcMrZjjKQQLGmVLKtU2VsZWNpb25hciBBcm1h'),
    Description = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('NNUNQsyebrEgUakXjUCpcRjjLEMorILkAXdkGLwfRjTGLyyerRoZAodRXNjb2xoYSBxdWFsIGFybWEgdXNhciBubyBmYXJt'),
    Options = {sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('PnzlWpPjYNVJlUYodBNlrkXqcTublphltONtlManqgKuRyoixAoxfyTTWVsZWU='), sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('YWDXaJQCMpNXmqvvNOBfMCCvoXFdSKHOqjitjCNvrBiemiHoLLDjLGVU3dvcmQ='), sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('STzMhxqwTYOovZopOFOURvWGlHigBFffSxiShtfRvINCSBnlAGMROiBRnJ1aXQ=')},
    Current = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('MtlveByZOhLAfdjgHhPvUALShvmPFJoXvHnmoaOYNEoYFvKfHTKBdWuTWVsZWU='),
    Flag = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('KwNLqkcuugxUEsGuduGoMXFogMJviMXCMAgehclvZCnXQplcGnqvxkuV2VhcG9uRHJvcGRvd24='),
    Callback = function(option)
        selectedWeapon = option
    end
})

local StatsTab = Window:CreateTab({
    Name = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('UtjIyIMhcTHDBqdLZYDuEjgwxwfCjRUtuwcWzKTFsEqtSoulLHJvwVBU3RhdHM='),
    Icon = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('nJoLLrKFsygledvxtLJQcelnXJwUICeAAnybQCvSRiaFieEZOqCQHprcmJ4YXNzZXRpZDovLzYwMzEwODMxNTI=')
})

local AutoStatsSection = StatsTab:CreateSection({
    Name = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('ovXxHRhnseNijKfMnAeLfybYPDSZjtUkFZSKnXhxKRkayiBOuOWgVruQXV0byBTdGF0cw==')
})

AutoStatsSection:CreateToggle({
    Name = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('jMJqsxfFncsSziQgUXhQJZsVjiXarUzWnIZATWIBqzMkPDnKwhvjbHiQXV0byBNZWxlZQ=='),
    Description = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('fJsAfqGexdSVLiPSITDcYPyTaCBjYrwifurDolxEGezAFSSlZGFcDxYRGlzdHJpYnVpIHBvbnRvcyBhdXRvbWF0aWNhbWVudGUgZW0gTWVsZWU='),
    Flag = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('zYwQHQVBBqsGDSjisCovZNnannoCCEWnjDLVEtYCCKFOMbZpXEMmisKQXV0b01lbGVlVG9nZ2xl'),
    Callback = function(state)
        autoMelee = state
    end
})

AutoStatsSection:CreateToggle({
    Name = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('dTLCOalTUgdThmjLuWmsSMrluUjGVWTHBTOsylXfdJopbrGSwRMbixYQXV0byBEZWZlbnNl'),
    Description = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('VsBnKskapUmzWlcSEaSMprPqyAfzMZyQqSCYaDHRzlFxmqPqrgMhgxjRGlzdHJpYnVpIHBvbnRvcyBhdXRvbWF0aWNhbWVudGUgZW0gRGVmZW5zZQ=='),
    Flag = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('AfWAoEnULhXNzyaygPmpVeyQSdVAniCZHZiIdyeBoucRWdQkbIAtpzlQXV0b0RlZmVuc2VUb2dnbGU='),
    Callback = function(state)
        autoDefense = state
    end
})

AutoStatsSection:CreateToggle({
    Name = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('qcdDLJFhGHGboVrYnizNUAgIkuETxgjREvJjaRcBdaDbOxwLpdGbaOsQXV0byBTd29yZA=='),
    Description = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('pQGQEsaotzOfOPVuWJACSBELozyCwfEgzrYhcwrXtXJziXXKbAesbvQRGlzdHJpYnVpIHBvbnRvcyBhdXRvbWF0aWNhbWVudGUgZW0gU3dvcmQ='),
    Flag = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('zZlvCchQFAQzHjzhddExpzTVZBxbrkwzMNxvBgAWODXFEmDNsOSHTWZQXV0b1N3b3JkVG9nZ2xl'),
    Callback = function(state)
        autoSword = state
    end
})

local TeleportTab = Window:CreateTab({
    Name = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('phGvyuCCrSzuepzXqWuzlBUBRegSwiOhXpQtOIDKijiCOemJmCWFgDIVGVsZXBvcnQ='),
    Icon = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('forqZEHkUMvcEjTZPlPqGsccmMaUhKFrUQzaKZBZEYNkeKhhhpOUbvGcmJ4YXNzZXRpZDovLzYwMzEwODMxNTI=')
})

local IslandsSection = TeleportTab:CreateSection({
    Name = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('dYmUIRgkzGqrFsbYLXAqYkzzHMtQtJNFFAkmUDtOkWAthpVEOoiRuXHSWxoYXM=')
})

local islands = {
    {sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('jdmgCsZaXFxUELWKyMCzQIKpGVozyADUUElQuTMpSCZuaExBnWNasRzTWFyaW5lIFN0YXJ0ZXI='), CFrame.new(1044.0, 21.0, 1452.0)},
    {sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('MOyxgTjxMEXAdhTMCxFxFQWdEGiOrDDEKsbfJIpahnrezkKSWktfVNsUGlyYXRlIFN0YXJ0ZXI='), CFrame.new(1081.0, 20.0, 1562.0)},
    {sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('PeyaXAcyRBuLAjPbNrbzVlwdUSdqUySBUTCsJksQKDePsunEFwXNsQpSnVuZ2xl'), CFrame.new(-1612.0, 17.0, 141.0)},
    {sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('yQqrRmqVqBmyQAGBpDMqUHbaUOKNYegTvGcqTyjMHZQEducFkiEqndDTWlkZGxlIFRvd24='), CFrame.new(-769.0, 48.0, -1242.0)},
    {sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('CsbnlMZwftGmMrXPrmMSgyviQwMUNcSWnQyAWBRZkqZPaYhtkbLXxmKRnJvemVuIFZpbGxhZ2U='), CFrame.new(1173.0, 27.0, -1231.0)}
}

for _, island in pairs(islands) do
    IslandsSection:CreateButton({
        Name = island[1],
        Description = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('MflBEeEqgtvMgJzEzxSwWmdgCXpmmXoZAlVdVZowUfpabGToLsMuTwaVGVsZXBvcnRhciBwYXJhIA==') .. island[1],
        Callback = function()
            local player = game.Players.LocalPlayer
            local character = player.Character
            if character and character:FindFirstChild(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('NMiucskUlSZRtTVnAoKokKTOceWBcDMYRKGTmjpXCcUQQYBUKpQLWZRSHVtYW5vaWRSb290UGFydA==')) then
                character.HumanoidRootPart.CFrame = island[2]
            end
        end
    })
end

local SettingsTab = Window:CreateTab({
    Name = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('fRWuWYCcSdRQKwVYIUummNpbFcDolObeQzhLeOsPywsPAeRbhkfhSuDU2V0dGluZ3M='),
    Icon = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('itFPAOcrwajbiaTCdBKCctgaTdoSMRKghruvZmULBFvhEvyDbQOXPcGcmJ4YXNzZXRpZDovLzYwMzEwODMxNTI=')
})

local GeneralSection = SettingsTab:CreateSection({
    Name = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('BXQDWogoVMomgtFSrhnAGVXStCxnpVTqyCtBhXOnuJDjFyyOKivsrRmR2VyYWw=')
})

GeneralSection:CreateButton({
    Name = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('jDzEeOPJyYTdPfHjkpbTpHqdxYRwWvdyyKovHEZwWnfVgDdLltzzxfSRmVjaGFyIEludGVyZmFjZQ=='),
    Description = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('JJQoIyvjcETWcVwiXdzGGmeIAkbNhZXYUHNTvdZUddMKGPmcJILIJXvRGVzdHJvaSBhIGphbmVsYSBkbyBodWI='),
    Callback = function()
        Library:Destroy()
    end
})

GeneralSection:CreateButton({
    Name = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('OOkEBbWbwrZvoxqUMHXMWmbDLKTUVnKjEwPQGLnIUgtwtkdFanXVpxOUmVpbmljaWFyIFNjcmlwdA=='),
    Description = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('FeKSfKAFqGiCsNPWVgYlHhdZFAxESMLRfkqccaeavYLimUSozmWIHgcUmVpbmljaWEgdG9kYXMgYXMgY29uZmlndXJhw6fDtWVz'),
    Callback = function()
        autoFarmEnabled = false
        autoMelee = false
        autoDefense = false
        autoSword = false
        selectedWeapon = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('UFbqcmhESyvhZMofrCtMOsHTSBMziVxoSvaQDzYNOHXdzHwTNXbJYYATWVsZWU=')
    end
})

function FindNearestNPC()
    local nearestDistance = math.huge
    local nearestNPC = nil
    local playerPos = humanoidRootPart.Position
    
    for _, npc in pairs(workspace:GetChildren()) do
        if npc:IsA(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('HVlrZkXpDLqaILmKUvdWRazzIzQIDcqmHkZnatsrDADpBZYwCPNjMQuTW9kZWw=')) and npc:FindFirstChild(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('ZqagJfeyEeWVcBeewfLwQIivkdyEidhTuFEJAqrisRwpojnIPEKlRsZSHVtYW5vaWQ=')) and not game.Players:GetPlayerFromCharacter(npc) then
            if npc.Humanoid.Health > 0 then
                local npcPos = npc.HumanoidRootPart.Position
                local distance = (playerPos - npcPos).Magnitude
                
                if distance < nearestDistance then
                    nearestDistance = distance
                    nearestNPC = npc
                end
            end
        end
    end
    
    return nearestNPC
end

function AttackNPC(target)
    if not target or not target:FindFirstChild(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('CboMcFohrkUQnyxAXchbnebUhrvHUBJSwfGnAuUebRPpPTaIauTlebZSHVtYW5vaWQ=')) then return end
    
    if target.Humanoid.Health <= 0 then
        currentTarget = nil
        return
    end
    
    local weapon = player.Character:FindFirstChildWhichIsA(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('HZtboIsdPILCiiBJbGaTWRxTTZJiuxwiAaYDrEPCceVaTwNTRCowsjLVG9vbA=='))
    
    if selectedWeapon == sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('NiJJWxkqMKJyogrnOESywNnxEvZoiySCZYwTWYfvMGfLArCDCWQsNfETWVsZWU=') then
        local args = {
            [1] = target.HumanoidRootPart.Position,
            [2] = target.HumanoidRootPart
        }
        game:GetService(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('ZwKTMngwbjttDWCXmamjOwYXqTIXXFWIBjdZyaxWFJptrnVVJObyyHRUmVwbGljYXRlZFN0b3JhZ2U=')):WaitForChild(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('tuMheJdUAnLXgKnhiWHzMNuatLIgHnZSQHOEparLyXUUxvjiUeRxIsWUmVtb3Rlcw==')):WaitForChild(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('UVNCztqbYqnWwOubJnNrtcWjIGPDtNfycPppJUCQUSkLYcuqSMFuNpoQ29tYmF0')):FireServer(unpack(args))
    elseif selectedWeapon == sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('cZBiypNdOYKfABbkRXpRMnrPYAiJJWbcHZGnGSEWYsQxxHuiJCcdFAeU3dvcmQ=') and weapon then
        weapon:Activate()
    elseif selectedWeapon == sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('CniRFeOQZGGLuDJGwzFVHfphhACNZwUNMGlbsJgpybZnxPQTMmILSLoRnJ1aXQ=') and weapon then
        weapon:Activate()
    end
end

function AutoFarm()
    spawn(function()
        while autoFarmEnabled do
            if not currentTarget or not currentTarget.Parent or currentTarget.Humanoid.Health <= 0 then
                currentTarget = FindNearestNPC()
            end
            
            if currentTarget then
                local tweenService = game:GetService(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('dLsplwztATfcepyjNLARwOIvvcOPTPlSXGwxzyrQqBBUzuPkeTGzHFcVHdlZW5TZXJ2aWNl'))
                local targetPos = currentTarget.HumanoidRootPart.Position
                
                local tweenInfo = TweenInfo.new(
                    (humanoidRootPart.Position - targetPos).Magnitude / 50,
                    Enum.EasingStyle.Linear,
                    Enum.EasingDirection.Out
                )
                
                local goal = {CFrame = CFrame.new(targetPos)}
                local tween = tweenService:Create(humanoidRootPart, tweenInfo, goal)
                tween:Play()
                
                tween.Completed:Wait()
                
                AttackNPC(currentTarget)
                
                wait(0.5)
            else
                wait(1)
            end
            
            wait(0.1)
        end
    end)
end

function AutoStats()
    spawn(function()
        while true do
            wait(1)
            
            local playerStats = player:FindFirstChild(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('uAofiAGRUsWwyKDCSZbIJBRTdRXXpeCaptIxWatJtvckKRGUTjIprfuUGxheWVyU3RhdHM='))
            if playerStats then
                local points = playerStats:FindFirstChild(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('pMwTwHhHbzoyAqLHclESQXLIzjYHMetBSzpLfonHIacNExIuRNopyWjUG9pbnRz'))
                if points and points.Value > 0 then
                    if autoMelee then
                        game:GetService(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('PzqRlZglljqSolKXZxgfJRAFGCUnoDrLLQoijNGigDdOJZFPjYpkYCgUmVwbGljYXRlZFN0b3JhZ2U=')):WaitForChild(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('LqvPXyGpqaGjBQPXqqjVugpLngCBjfQKldNyuowijEnqEwnqSXCseJCUmVtb3Rlcw==')):WaitForChild(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('sWxCbXfACHbdnBOemkQtezSvzLLnMItFxwtHMIMzHAicsVAdVEKxcsxQWRkUG9pbnQ=')):InvokeServer(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('rvfgPYkpYOQlGFRTdvIFhEZhyjVwwGJxaRmDCobnzCVSSucBwlmgLyaTWVsZWU='))
                    end
                    if autoDefense then
                        game:GetService(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('LnqVPvfYiUFiVHIfitfTiKjMFvuOKjbiLBSPifGewljEJdVQljuHhPlUmVwbGljYXRlZFN0b3JhZ2U=')):WaitForChild(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('HqaxOHaicaCktPYiVnBbvyOnYfTLXtCXZcrKkKeVSfRNgVrrDWhutijUmVtb3Rlcw==')):WaitForChild(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('CKQxwOoybpFjdugXCoRagkPinlulwvDfihmTeaSMmNPUetXDLleuQtOQWRkUG9pbnQ=')):InvokeServer(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('bkuuRLHbUcVZiwLXAmrCEnItYXZWLDRvnedrAAgTgtIQeNjTHepmtsjRGVmZW5zZQ=='))
                    end
                    if autoSword then
                        game:GetService(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('GyZzBteXCMJJLCVEbGTzgHXUecokEDcPzhYhNzoaUPYossNcQPGBYALUmVwbGljYXRlZFN0b3JhZ2U=')):WaitForChild(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('sdWvjumwiWZUgcoiuQsqdZyFkkSzJAWXlmOSffNkaXFqKTCzawmVAzCUmVtb3Rlcw==')):WaitForChild(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('mLhRRVZMfapRFvgUsXKYilgjUzuoLPeDuedrtQLYMYEGICIzERmwyznQWRkUG9pbnQ=')):InvokeServer(sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('hqrhuKBbgqRcvZpkubbLzZImZFxHjnfSGqofhdefxOoapSrTytUiFBrU3dvcmQ='))
                    end
                end
            end
        end
    end)
end

AutoStats()

Library:Notify({
    Title = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('egNuLyRTKOSGXEDhxQDDYbuXVqHRlfeYQlPXNGvkkXFSUhniaOGjYovWlVIT1ggSFVC'),
    Description = sBFvaOVxFfiGyspgJTHzHbPnOXEbAAmvMosLTYPcvahLGGmAVahDuSwHOpOlakL('OfqyXESmBKQqqVHHJLKufTwObRfnpMHtECYNidDuJOLGoaCllGKPPPAU2NyaXB0IGNhcnJlZ2FkbyBjb20gc3VjZXNzbyE='),
    Duration = 3
})        
