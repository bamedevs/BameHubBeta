local BameHub = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = BameHub:MakeWindow({Name = "BameDev's Hub v0.1", Color = Color3.fromRGB(110,153,202), HidePremium = false, SaveConfig = true, IntroEnabled = true, IntroText = "BameDev's Hub", ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


Tab:AddSlider({
	Name = "WalkSpeed (DEFAULT - 16)",
	Min = 0,
	Max = 500,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 0.5,
	ValueName = "Speed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})


Tab:AddSlider({
    Name = "JumpPower (DEFAULT - 50)",
    Min = 0,
    Max = 1000,
    Default = 50,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Jump",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
		game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = true	
    end
})

Tab:AddSlider({
    Name = "Height (DEFAULT - 2)",
    Min = 0,
    Max = 400,
    Default = 2,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "HeightPower",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.HipHeight = Value
    end
})

local lTab = Window:MakeTab({
	Name = "Lighting",
	Icon = "http://www.roblox.com/asset/?id=14455469477",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Fly & Noclip (press E)",
	Callback = function()
		lplayer = game:GetService("Players").LocalPlayer
local Mouse = lplayer:GetMouse()
flying = false
local a = 1
Mouse.KeyDown:connect(function(key)
	if key == "e" then
		if a == 1 then
			repeat wait() until lplayer and lplayer.Character and lplayer.Character:FindFirstChild('HumanoidRootPart') and lplayer.Character:FindFirstChild('Humanoid')
			repeat wait() until Mouse
			
			speedfly = 2 --FLY SPEED HERE
			
			local T = lplayer.Character.HumanoidRootPart
			local CONTROL = {F = 0, B = 0, L = 0, R = 0}
			local lCONTROL = {F = 0, B = 0, L = 0, R = 0}
			local SPEED = speedget
			
			local function fly()
				flying = true
				local BG = Instance.new('BodyGyro', T)
				local BV = Instance.new('BodyVelocity', T)
				BG.P = 9e4
				BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
				BG.cframe = T.CFrame
				BV.velocity = Vector3.new(0, 0.1, 0)
				BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
				spawn(function()
					repeat wait()
						lplayer.Character.Humanoid.PlatformStand = true
						if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 then
							SPEED = 50
						elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0) and SPEED ~= 0 then
							SPEED = 0
						end
						if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 then
							BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
							lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
						elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and SPEED ~= 0 then
							BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
						else
							BV.velocity = Vector3.new(0, 0.1, 0)
						end
						BG.cframe = workspace.CurrentCamera.CoordinateFrame
					until not flying
					CONTROL = {F = 0, B = 0, L = 0, R = 0}
					lCONTROL = {F = 0, B = 0, L = 0, R = 0}
					SPEED = 0
					BG:destroy()
					BV:destroy()
					lplayer.Character.Humanoid.PlatformStand = false
				end)
			end
			Mouse.KeyDown:connect(function(KEY)
				if KEY:lower() == 'w' then
					CONTROL.F = speedfly
				elseif KEY:lower() == 's' then
					CONTROL.B = -speedfly
				elseif KEY:lower() == 'a' then
					CONTROL.L = -speedfly
				elseif KEY:lower() == 'd' then
					CONTROL.R = speedfly
				end
			end)
			Mouse.KeyUp:connect(function(KEY)
				if KEY:lower() == 'w' then
					CONTROL.F = 0
				elseif KEY:lower() == 's' then
					CONTROL.B = 0
				elseif KEY:lower() == 'a' then
					CONTROL.L = 0
				elseif KEY:lower() == 'd' then
					CONTROL.R = 0
				end
			end)
			a = 0
			fly()
		else 
			flying = false
			lplayer.Character.Humanoid.PlatformStand = false
			a = 1
		end end end)

wait()

-- NOCLIP

local StealthMode = false
local Indicator
if not StealthMode then
	local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
	Indicator = Instance.new("TextLabel", ScreenGui)
end
local noclip = false
local player = game.Players.LocalPlayer
local character = player.Character
local mouse = player:GetMouse()
mouse.KeyDown:Connect(function(key)
	if key == "e" then
		noclip = not noclip
	end
end)
while true do
	player = game.Players.LocalPlayer
	character = player.Character
	if noclip then
		for _, v in pairs(character:GetDescendants()) do
			pcall(function()
				if v:IsA("BasePart") then
					v.CanCollide = false
				end
			end)
		end
	end
	game:GetService("RunService").Stepped:wait()
end	
		end    
})

local pTab = Window:MakeTab({
	Name = "Player",
	Icon = "http://www.roblox.com/asset/?id=14460533941",
	PremiumOnly = false
})

pTab:AddSlider({
    Name = "Health",
    Min = 0,
    Max = 1500,
    Default = 100,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Health",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.Health = Value
    end
})

lTab:AddSlider({
    Name = "Brightness",
    Min = 0,
    Max = 300,
    Default = 2,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "brightness",
    Callback = function(Value)
        game.Lighting.Brightness = Value
    end
})

lTab:AddSlider({
    Name = "Size Of Sun (if brightness = 0 it wont work)",
    Min = 0,
    Max = 60,
    Default = 11,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "sun size",
    Callback = function(Value)
        game.Lighting.Sky.SunAngularSize = Value
    end
})

pTab:AddSlider({
    Name = "PlayerGravity (Default - 196)",
    Min = 0,
    Max = 800,
    Default = 196.2,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Gravity",
    Callback = function(Value)
        game.Workspace.Gravity = Value
    end
})

local sTab = Window:MakeTab({
	Name = "Settings",
	Icon = "http://www.roblox.com/asset/?id=14460477452",
	PremiumOnly = false
})

sTab:AddButton({
	Name = "Destroy the Hub",
	Callback = function()
		BameHub:Destroy()
  	end    
})

sTab:AddParagraph("❤ ALL CREDITS TO ❤ :","Developer & Coder: BameDev\nHelper: zhevonez")

local oeTab = Window:MakeTab({
	Name = "Visual Effects",
	Icon = "http://www.roblox.com/asset/?id=14460502120",
	PremiumOnly = false
})
oeTab:AddParagraph("Warn!","This effects only work in some places.")

Tab:AddColorpicker({
  Name = "Custom Background",
  Default = Color3.fromRGB(25, 25, 25),
  Callback = function(Value)
    game.CoreGui.Orion.Frame.BackgroundColor3 = Value
  end    
})

oeTab:AddButton({
	Name = "Remove SunRays",
	Callback = function()
		game.Lighting.SunRays.Enabled = false
  	end    
})

oeTab:AddButton({
	Name = "Remove Sun",
	Callback = function()
		game.Lighting.Sky.SunAngularSize = 0
  	end    
})

oeTab:AddButton({
	Name = "Enable SunRays",
	Callback = function()
		game.Lighting.SunRays.Enabled = true
  	end    
})

oeTab:AddButton({
	Name = "Enable Sun :)",
	Callback = function()
		game.Lighting.Sky.SunAngularSize = 24
  	end    
})

oeTab:AddButton({
	Name = "Night",
	Callback = function()
		game.Lighting.TimeOfDay = "00:00"
  	end    
})

oeTab:AddParagraph("STOP!","After turning on the function Day, i recommend re-enter the place.")
oeTab:AddButton({
	Name = "Day",
	Callback = function()
		game.Lighting.TimeOfDay = "-12:40:13"
  	end    
})
oeTab:AddParagraph("STOP!","After turning on the function RTX EVENING, i RECOMMEND(!) re-enter the place.")
oeTab:AddButton({
	Name = "RTX EVENING! (so cool)",
	Callback = function()
		local Vignette = true -- change to false if you don't want a shadow frame



local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local Bloom = Instance.new("BloomEffect")
local Blur = Instance.new("BlurEffect")
local ColorCor = Instance.new("ColorCorrectionEffect")
local SunRays = Instance.new("SunRaysEffect")
local Sky = Instance.new("Sky")
local Atm = Instance.new("Atmosphere")


for i, v in pairs(Lighting:GetChildren()) do
	if v then
		v:Destroy()
	end
end

Bloom.Parent = Lighting
Blur.Parent = Lighting
ColorCor.Parent = Lighting
SunRays.Parent = Lighting
Sky.Parent = Lighting
Atm.Parent = Lighting

if Vignette == true then
	local Gui = Instance.new("ScreenGui")
	Gui.Parent = StarterGui
	Gui.IgnoreGuiInset = true
	
	local ShadowFrame = Instance.new("ImageLabel")
	ShadowFrame.Parent = Gui
	ShadowFrame.AnchorPoint = Vector2.new(0.5,1)
	ShadowFrame.Position = UDim2.new(0.5,0,1,0)
	ShadowFrame.Size = UDim2.new(1,0,1.05,0)
	ShadowFrame.BackgroundTransparency = 1
	ShadowFrame.Image = "rbxassetid://4576475446"
	ShadowFrame.ImageTransparency = 0.3
	ShadowFrame.ZIndex = 10
end

Bloom.Intensity = 0.85
Bloom.Size = 17
Bloom.Threshold = 0.8

Blur.Size = 5

ColorCor.Brightness = 0.1
ColorCor.Contrast = 0.5
ColorCor.Saturation = -0.3
ColorCor.TintColor = Color3.fromRGB(255, 235, 203)

SunRays.Intensity = 0.075
SunRays.Spread = 0.727

Sky.SkyboxBk = "http://www.roblox.com/asset/?id=151165214"
Sky.SkyboxDn = "http://www.roblox.com/asset/?id=151165197"
Sky.SkyboxFt = "http://www.roblox.com/asset/?id=151165224"
Sky.SkyboxLf = "http://www.roblox.com/asset/?id=151165191"
Sky.SkyboxRt = "http://www.roblox.com/asset/?id=151165206"
Sky.SkyboxUp = "http://www.roblox.com/asset/?id=151165227"
Sky.SunAngularSize = 10

Lighting.Ambient = Color3.fromRGB(2,2,2)
Lighting.Brightness = 2.25
Lighting.ColorShift_Bottom = Color3.fromRGB(0,0,0)
Lighting.ColorShift_Top = Color3.fromRGB(0,0,0)
Lighting.EnvironmentDiffuseScale = 0.2
Lighting.EnvironmentSpecularScale = 0.2
Lighting.GlobalShadows = true
Lighting.OutdoorAmbient = Color3.fromRGB(0,0,0)
Lighting.ShadowSoftness = 0.2
Lighting.ClockTime = 17
Lighting.GeographicLatitude = 45
Lighting.ExposureCompensation = 0.5

Atm.Density = 0.364
Atm.Offset = 0.556
Atm.Color = Color3.fromRGB(199, 175, 166)
Atm.Decay = Color3.fromRGB(44, 39, 33)
Atm.Glare = 0.36
Atm.Haze = 1.72
	game.Lighting.Technology.ShadowMap = true

script:Destroy()
  	end    
})

oeTab:AddButton({
	Name = "Custom Third-Person NO WORK",
	Callback = function()
		local player = game.Players.LocalPlayer
local char = player.Character
local RunService = game:GetService("RunService")
local uis = game:GetService("UserInputService")

RunService.RenderStepped:Connect(function(step)

	uis.MouseBehavior = Enum.MouseBehavior.LockCenter

	local ray = Ray.new(char.Head.Position, ((char.Head.CFrame + char.Head.CFrame.LookVector * 2) - char.Head.Position).Position.Unit)
	local ignoreList = char:GetChildren()

	local hit, pos = game.Workspace:FindPartOnRayWithIgnoreList(ray, ignoreList)

	if hit then
		char.Humanoid.CameraOffset = Vector3.new(0, 0, 0)
	else
		char.Humanoid.CameraOffset = Vector3.new(1.5, 0, 0)
	end
end)
  	end    
})

pTab:AddSlider({
    Name = "SlopeAngle",
    Min = 0,
    Max = 500,
    Default = 89,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "slopeangle",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.MaxSlopeAngle = Value
    end
})

oeTab:AddButton({
	Name = "NUKE EM ALL",
	Callback = function()

  	end    
})

local chatTab = Window:MakeTab({
	Name = "Chat",
	PremiumOnly = false
})

chatTab:AddButton({
	Name = "Trash Chattin' (press V)",
	Callback = function()
		local words = {
    "where are you aiming at?",
    "sonned",
    "bad",
    "even my grandma has faster reactions",
    ":clown:",
    "gg = get good",
    "im just better",
    "my gaming chair is just better",
    "clip me",
    "skill",
    ":Skull:",
    "go play adopt me",
    "go play brookhaven",
    "omg you are so good :screm:",
    "awesome",
    "you built like gru",
    "fridge",
    "do not bully pliisss :sobv:",
    "it was your lag ofc",
    "fly high",
    "*cough* *cough*",
    "son",
    "already mad?",
    "please don't report :sobv:",
    "sob harder",
    "sopt be neamn to me :sob :sob: sov:",
	"dont care",
	"try again",
	"trolled",
	"bozo rip",

}

local event = game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest
local player = game.Players.LocalPlayer
local keybind = "v" -- change hotkey here

 player:GetMouse().KeyDown:connect(function(key)
        if key == keybind then
            event:FireServer(words[math.random(1,#words)], "All")
        end
    end)
  	end    
})

chatTab:AddButton({
	Name = "Chat Translator",
	Callback = function()
		if not game['Loaded'] then game['Loaded']:Wait() end; repeat wait(.06) until game:GetService('Players').LocalPlayer ~= nil
local YourLang = "en" 

local googlev = isfile'googlev.txt' and readfile'googlev.txt' or ''

function googleConsent(Body)
    local args = {}

    for match in Body:gmatch('<input type="hidden" name=".-" value=".-">') do
        local k,v = match:match('<input type="hidden" name="(.-)" value="(.-)">')
        args[k] = v
    end
    googlev = args.v
    writefile('googlev.txt', args.v)
end

local function got(url, Method, Body) 
    Method = Method or "GET"
    
    local res = request({
        Url = url,
        Method = Method,
        Headers = {cookie="CONSENT=YES+"..googlev},
        Body = Body
    })
    
    if res.Body:match('https://consent.google.com/s') then
        print('consent')
        googleConsent(res.Body)
        res = request({
            Url = url,
            Method = "GET",
            Headers = {cookie="CONSENT=YES+"..googlev}
        })
    end
    
    return res
end

local languages = {
    auto = "Automatic",
    af = "Afrikaans",
    sq = "Albanian",
    am = "Amharic",
    ar = "Arabic",
    hy = "Armenian",
    az = "Azerbaijani",
    eu = "Basque",
    be = "Belarusian",
    bn = "Bengali",
    bs = "Bosnian",
    bg = "Bulgarian",
    ca = "Catalan",
    ceb = "Cebuano",
    ny = "Chichewa",
    ['zh-cn'] = "Chinese Simplified",
    ['zh-tw'] = "Chinese Traditional",
    co = "Corsican",
    hr = "Croatian",
    cs = "Czech",
    da = "Danish",
    nl = "Dutch",
    en = "English",
    eo = "Esperanto",
    et = "Estonian",
    tl = "Filipino",
    fi = "Finnish",
    fr = "French",
    fy = "Frisian",
    gl = "Galician",
    ka = "Georgian",
    de = "German",
    el = "Greek",
    gu = "Gujarati",
    ht = "Haitian Creole",
    ha = "Hausa",
    haw = "Hawaiian",
    iw = "Hebrew",
    hi = "Hindi",
    hmn = "Hmong",
    hu = "Hungarian",
    is = "Icelandic",
    ig = "Igbo",
    id = "Indonesian",
    ga = "Irish",
    it = "Italian",
    ja = "Japanese",
    jw = "Javanese",
    kn = "Kannada",
    kk = "Kazakh",
    km = "Khmer",
    ko = "Korean",
    ku = "Kurdish (Kurmanji)",
    ky = "Kyrgyz",
    lo = "Lao",
    la = "Latin",
    lv = "Latvian",
    lt = "Lithuanian",
    lb = "Luxembourgish",
    mk = "Macedonian",
    mg = "Malagasy",
    ms = "Malay",
    ml = "Malayalam",
    mt = "Maltese",
    mi = "Maori",
    mr = "Marathi",
    mn = "Mongolian",
    my = "Myanmar (Burmese)",
    ne = "Nepali",
    no = "Norwegian",
    ps = "Pashto",
    fa = "Persian",
    pl = "Polish",
    pt = "Portuguese",
    pa = "Punjabi",
    ro = "Romanian",
    ru = "Russian",
    sm = "Samoan",
    gd = "Scots Gaelic",
    sr = "Serbian",
    st = "Sesotho",
    sn = "Shona",
    sd = "Sindhi",
    si = "Sinhala",
    sk = "Slovak",
    sl = "Slovenian",
    so = "Somali",
    es = "Spanish",
    su = "Sundanese",
    sw = "Swahili",
    sv = "Swedish",
    tg = "Tajik",
    ta = "Tamil",
    te = "Telugu",
    th = "Thai",
    tr = "Turkish",
    uk = "Ukrainian",
    ur = "Urdu",
    uz = "Uzbek",
    vi = "Vietnamese",
    cy = "Welsh",
    xh = "Xhosa",
    yi = "Yiddish",
    yo = "Yoruba",
    zu = "Zulu"
};

function find(lang)
    for i,v in pairs(languages) do
        if i == lang or v == lang then
            return i
        end
    end
end

function isSupported(lang)
    local key = find(lang)
    return key and true or false 
end

function getISOCode(lang)
    local key = find(lang)
    return key
end

function stringifyQuery(dataFields)
    local data = ""
    for k, v in pairs(dataFields) do
        if type(v) == "table" then
            for _,v in pairs(v) do
                data = data .. ("&%s=%s"):format(
                    game.HttpService:UrlEncode(k),
                    game.HttpService:UrlEncode(v)
                )
            end
        else
            data = data .. ("&%s=%s"):format(
                game.HttpService:UrlEncode(k),
                game.HttpService:UrlEncode(v)
            )
        end
    end
    data = data:sub(2)
    return data
end

local reqid = math.random(1000,9999)
local rpcidsTranslate = "MkEWBc"
local rootURL = "https://translate.google.com/"
local executeURL = "https://translate.google.com/_/TranslateWebserverUi/data/batchexecute"
local fsid, bl

do -- init
	print('initialize')
    local InitialReq = got(rootURL)
    fsid = InitialReq.Body:match('"FdrFJe":"(.-)"')
    bl = InitialReq.Body:match('"cfb2h":"(.-)"')
end

local HttpService = game:GetService("HttpService")
function jsonE(o)
    return HttpService:JSONEncode(o)
end
function jsonD(o)
    return HttpService:JSONDecode(o)
end

function translate(str, to, from)
    reqid+=10000
    from = from and getISOCode(from) or 'auto'
    to = to and getISOCode(to) or 'en'

    local data = {{str, from, to, true}, {nil}}

    local freq = {
        {
            {
                rpcidsTranslate, 
                jsonE(data),
                nil,
                "generic"
            }
        }
    }

    local url = executeURL..'?'..stringifyQuery{rpcids = rpcidsTranslate, ['f.sid'] = fsid, bl = bl, hl="en", _reqid = reqid-10000, rt = 'c'}
    local body = stringifyQuery{['f.req'] = jsonE(freq)}
    
    local req = got(url, "POST", body)
	
    local body = jsonD(req.Body:match'%[.-%]\n')
    local translationData = jsonD(body[1][3])
    local result = {
        text = "",
        from = {
            language = "",
            text = ""
        },
        raw = ""
    }
    result.raw = translationData
    result.text = translationData[2][1][1][6][1][1]
    
    result.from.language = translationData[3]
    result.from.text = translationData[2][5][1]

    return result
end

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local StarterGui = game:GetService('StarterGui')
for i=1, 15 do
    local r = pcall(StarterGui["SetCore"])
    if r then break end
    game:GetService('RunService').RenderStepped:wait()
end
wait()

local properties = {
    Color = Color3.new(1,1,0);
    Font = Enum.Font.SourceSansItalic;
    TextSize = 16;
}

game:GetService("StarterGui"):SetCore("SendNotification",
    {
        Title = "Chat Translator",
        Text = "Ported to Google Translate",
        Duration = 3
    }
)
                  
properties.Text = "[TR] To send messages in a language, say > followed by the target language/language code, e.g.: >ru or >russian. To disable (go back to original language), say >d."
StarterGui:SetCore("ChatMakeSystemMessage", properties)

function translateFrom(message)
    local translation = translate(message, YourLang)

    local text
    if translation.from.language ~= YourLang then 
        text = translation.text
    end

    return {text, translation.from.language}
end

function get(plr, msg)
    local tab = translateFrom(msg)
    local translation = tab[1]
    if translation then
        properties.Text = "("..tab[2]:upper()..") ".."[".. plr.Name .."]: "..translation
        StarterGui:SetCore("ChatMakeSystemMessage", properties)
    end
end

for i, plr in ipairs(Players:GetPlayers()) do
    plr.Chatted:Connect(function(msg)
        get(plr, msg)
    end)
end
Players.PlayerAdded:Connect(function(plr)
    plr.Chatted:Connect(function(msg)
        get(plr, msg)
    end)
end)

local sendEnabled = false
local target = ""

function translateTo(message, target)
    target = target:lower() 
    local translation = translate(message, target, "auto")

    return translation.text
end

function disableSend()
    sendEnabled = false
    properties.Text = "[TR] Sending Disabled"
    StarterGui:SetCore("ChatMakeSystemMessage", properties)
end

local CBar, CRemote, Connected = LP['PlayerGui']:WaitForChild('Chat')['Frame'].ChatBarParentFrame['Frame'].BoxFrame['Frame'].ChatBar, game:GetService('ReplicatedStorage').DefaultChatSystemChatEvents['SayMessageRequest'], {}

local HookChat = function(Bar)
    coroutine.wrap(function()
        if not table.find(Connected,Bar) then
            local Connect = Bar['FocusLost']:Connect(function(Enter)
                if Enter ~= false and Bar['Text'] ~= '' then
                    local Message = Bar['Text']
                    Bar['Text'] = '';
                    if Message == ">d" then
                        disableSend()
                    elseif Message:sub(1,1) == ">" and not Message:find(" ") then
                        if getISOCode(Message:sub(2)) then
                            sendEnabled = true
                            target = Message:sub(2)
                        else
                            properties.Text = "[TR] Invalid language"
                            StarterGui:SetCore("ChatMakeSystemMessage", properties)
                        end
                    elseif sendEnabled then
                        Message = translateTo(Message, target)
                        if not _G.SecureChat then
                            game:GetService('Players'):Chat(Message); 
                        end
                        CRemote:FireServer(Message,'All')
                    else
                        if not _G.SecureChat then
                            game:GetService('Players'):Chat(Message); 
                        end
                        CRemote:FireServer(Message,'All')
                    end
                end
            end)
            Connected[#Connected+1] = Bar; Bar['AncestryChanged']:Wait(); Connect:Disconnect()
        end
    end)()
end

HookChat(CBar); local BindHook = Instance.new('BindableEvent')

local MT = getrawmetatable(game); local NC = MT.__namecall; setreadonly(MT, false)

MT.__namecall = newcclosure(function(...)
    local Method, Args = getnamecallmethod(), {...}
    if rawequal(tostring(Args[1]),'ChatBarFocusChanged') and rawequal(Args[2],true) then 
        if LP['PlayerGui']:FindFirstChild('Chat') then
            BindHook:Fire()
        end
    end
    return NC(...)
end)

BindHook['Event']:Connect(function()
    CBar = LP['PlayerGui'].Chat['Frame'].ChatBarParentFrame['Frame'].BoxFrame['Frame'].ChatBar
    HookChat(CBar)
end)
  	end    
})

chatTab:AddParagraph("How-to-use chat translator","Send in chat language with prefix > and send any words and it will be translated")

BameHub:Init()