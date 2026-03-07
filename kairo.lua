local a = game:GetService("Players")
local b = game:GetService("TweenService")
local c = game:GetService("UserInputService")
local d = game:GetService("StarterGui")
local e = a.LocalPlayer
local f = 1942230194
local g = loadstring(game:HttpGet("https://pastefy.app/vIo4LoaG/raw"))()
local h = g.frame
local i = g.top
local j = g.minimize
local k = g.close
local l = g.avatar
local m = g.textbox
local n = g.button
local o = g.credit
local p = false
local q
local r
local s = false
i.InputBegan:Connect(function(t)
if t.UserInputType == Enum.UserInputType.MouseButton1 then
p = true
q = t.Position
r = h.Position
end
end)
c.InputEnded:Connect(function(t)
if t.UserInputType == Enum.UserInputType.MouseButton1 then
p = false
end
end)
c.InputChanged:Connect(function(t)
if p and t.UserInputType == Enum.UserInputType.MouseMovement then
local u = t.Position - q
h.Position = UDim2.new(r.X.Scale,r.X.Offset + u.X,r.Y.Scale,r.Y.Offset + u.Y)
end
end)
j.MouseButton1Click:Connect(function()
s = not s
if s then
j.Text = "+"
b:Create(h,TweenInfo.new(.25),{Size = UDim2.new(0,340,0,42)}):Play()
l.Visible = false
m.Visible = false
n.Visible = false
o.Visible = false
else
j.Text = "-"
b:Create(h,TweenInfo.new(.25),{Size = UDim2.new(0,340,0,200)}):Play()
l.Visible = true
m.Visible = true
n.Visible = true
o.Visible = true
end
end)
k.MouseButton1Click:Connect(function()
b:Create(h,TweenInfo.new(.25),{Size = UDim2.new(0,0,0,0)}):Play()
task.wait(.25)
h.Parent:Destroy()
end)
local function t(u,v,w)
pcall(function()
d:SetCore("SendNotification",{Title = u,Text = v,Duration = 4,Icon = w or ""})
end)
end
local function u(v)
v = v:lower()
for _,w in pairs(a:GetPlayers()) do
if w.Name:lower() == v or w.DisplayName:lower() == v then
return w
end
if string.sub(w.Name:lower(),1,#v) == v then
return w
end
end
local x,y = pcall(function()
return a:GetUserIdFromNameAsync(v)
end)
if x and y then
return {UserId = y,Name = v}
end
end
local function v(w)
local x = u(w)
if not x then return end
local y = x.UserId
local z,A = pcall(function()
return a:GetUserThumbnailAsync(y,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size420x420)
end)
if z then
l.Image = A
end
end
m:GetPropertyChangedSignal("Text"):Connect(function()
if #m.Text > 2 then
v(m.Text)
end
end)
local function w(x)
local y = x.UserId
if y == e.UserId then
t("Kairo Avatar V1","cannot clone yourself")
return
end
local z = e.Character or e.CharacterAdded:Wait()
local A = z:WaitForChild("Humanoid")
local B,C = pcall(function()
return a:GetHumanoidDescriptionFromUserId(y)
end)
if not B then
t("Kairo Avatar V1","failed to load avatar")
return
end
for _,D in ipairs(z:GetChildren()) do
if D:IsA("Accessory") or D:IsA("Shirt") or D:IsA("Pants") or D:IsA("BodyColors") or D:IsA("ShirtGraphic") then
D:Destroy()
end
end
pcall(function()
A:ApplyDescriptionClientServer(C)
end)
t("Kairo Avatar V1","avatar cloned from "..(x.Name or "user"))
end
n.MouseButton1Click:Connect(function()
local x = m.Text
if x == "" then
t("Kairo Avatar V1","enter a username")
return
end
local y = u(x)
if y then
w(y)
else
t("Kairo Avatar V1","user not found")
end
end)
t(
"Kairo Avatar V1",
"by: glowpllo",
"rbxthumb://type=AvatarHeadShot&id="..f.."&w=150&h=150"
)
