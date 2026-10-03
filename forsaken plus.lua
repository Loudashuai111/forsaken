--[[
    Naiko Forsaken Plus 汉化脚本
    格式：["英文原文"] = "中文翻译",
]]

local Value = {
    -- ==================== 顶部标题 ====================
    ["Script Made by Naiko"] = "脚本作者 Naiko",
    ["Scripts | V1.81"] = "脚本 | V1.81",

    -- ==================== 菜单分类 ====================
    ["Miscellaneous"] = "杂项",
    ["Visuals"] = "视觉",
    ["Features"] = "功能",
    ["Automation"] = "自动化",

    -- ==================== Miscellaneous（杂项） ====================
    ["Disable Blindness"] = "禁用致盲",
    ["Disables the blindness effect"] = "禁用致盲效果",
    ["Disable Features When Outdated"] = "脚本过期时禁用功能",
    ["Disables all features when the script is outdated/not tested"] = "当脚本过期/未测试时禁用所有功能",
    ["Rejoin"] = "重新加入",
    ["Makes you rejoin the exact same server"] = "让你重新加入完全相同的服务器",
    ["Shows Privacy Info"] = "显示隐私信息",
    ["Shows everyones privacy info"] = "显示所有人的隐私信息",
    ["Hide Injured UI/Effects"] = "隐藏受伤界面/效果",
    ["Hides the injured screen and effects used when you are low health"] = "当生命值低时隐藏受伤界面和效果",
    ["Extended FOV"] = "扩展视野",
    ["A extended version of the FOV inside the normal settings"] = "普通设置中 FOV 的扩展版本",
    ["Extended Zoom Distance"] = "扩展缩放距离",
    ["Extends the Maximum Zoom Distance for the camera"] = "扩展相机的最大缩放距离",
    ["Show Chat"] = "显示聊天",
    ["Shows the Full Chat while in the Round"] = "在回合中显示完整聊天",

    -- ==================== ESP / 颜色设置 ====================
    ["Item(s) Color"] = "物品颜色",
    ["Select a Color for Item(s) (ESP)"] = "为物品选择颜色 (透视)",
    ["Generator(s) Color"] = "发电机颜色",
    ["Select a Color for Generator(s) (ESP)"] = "为发电机选择颜色 (透视)",
    ["Hide Completed Generator(s)"] = "隐藏已完成发电机",
    ["Hides Generator(s) That are Completed (ESP)"] = "隐藏已完成的发电机 (透视)",
    ["Item(s) (ESP)"] = "物品透视",
    ["Enables ESP for the Item(s)"] = "启用物品透视",
    ["Survivor(s) Color"] = "幸存者颜色",
    ["Select a Color for Survivor(s) (ESP)"] = "为幸存者选择颜色 (透视)",
    ["Generator(s) (ESP)"] = "发电机透视",
    ["Enables ESP for the Generator(s)"] = "启用发电机透视",
    ["Killer(s) Color"] = "杀手颜色",
    ["Select a Color for Killer(s) (ESP)"] = "为杀手选择颜色 (透视)",
    ["Survivor(s) (ESP)"] = "幸存者透视",
    ["Enables ESP for the survivor(s)"] = "启用幸存者透视",
    ["Killer(s) (ESP)"] = "杀手透视",
    ["Enables ESP for the killer(s)"] = "启用杀手透视",
    ["ESP"] = "透视",
    ["Track things in the game through walls"] = "透视追踪游戏中的物体",
    ["Show Text"] = "显示文字",
    ["Show text over the highlighted objects"] = "在高亮物体上显示文字",
    ["Disables 007n7's Distracting NPC"] = "禁用 007n7 的干扰 NPC",

    -- ==================== Visuals（视觉） ====================
    ["Override Generator(s) Grid Size"] = "覆盖发电机网格大小",
    ["Overrides the puzzle grid size of the generators"] = "覆盖发电机的拼图网格大小",
    ["Disable Noli's NPC"] = "禁用 Noli 的 NPC",
    ["Disables Noli's Distracting NPC"] = "禁用 Noli 的干扰 NPC",
    ["Disable 007n7's NPC"] = "禁用 007n7 的 NPC",

    -- ==================== Features（功能） ====================
    ["Auto Disarm"] = "自动拆除",
    ["Auto-Disarms Azure's Traps"] = "自动拆除 Azure 的陷阱",
    ["不可战胜"] = "不可战胜",
    ["Makes you invisible & god mode (you can still use abilities)"] = "让你隐身并进入无敌模式（仍可使用技能）",
    ["Disable Killer Walls"] = "禁用杀手墙壁",
    ["Disables Thin Killer Walls"] = "禁用薄杀手墙壁",
    ["Disable John Doe's Trails"] = "禁用 John Doe 的轨迹",
    ["Disables damaging trails for john doe"] = "禁用 John Doe 的伤害轨迹",
    ["Disable John Doe's Footprints"] = "禁用 John Doe 的脚印",
    ["Disables footprints made by john doe"] = "禁用 John Doe 制造的脚印",
    ["Smaller Spike Collisions"] = "更小的尖刺碰撞",
    ["Makes spike collisions smaller for john doe's ability"] = "使 John Doe 技能的尖刺碰撞更小",

    -- ==================== 角色技能强化 ====================
    ["Better Void Rush"] = "更好的虚空冲刺",
    ["Allows you to have better control of Void Rush Ability"] = "让你更好地控制虚空冲刺技能",
    ["Make Coolkidd's Dash Controllable"] = "使 Coolkidd 的冲刺可控",
    ["Allows you to control where the dash goes just like Void Rush Ability"] = "让你控制冲刺方向，就像虚空冲刺技能一样",
    ["访客1337 Auto Block"] = "访客1337 自动格挡",
    ["Uses the block ability automatically when about to get hit (REQUIRES GOOD PING)"] = "即将被击中时自动使用格挡技能（需要良好的延迟）",
    ["访客1337 Auto Punch"] = "访客1337 自动出拳",
    ["Uses the punch ability when you block successfully"] = "成功格挡时使用出拳技能",

    -- ==================== 体力/动画 ====================
    ["Stamina Preset"] = "体力预设",
    ["Select a Stamina Preset"] = "选择体力预设",
    ["原版"] = "原版",
    ["Realistic"] = "真实",
    ["Semi-Realistic"] = "半真实",
    ["Infinite"] = "无限",
    ["Anti Slowness"] = "防减速",
    ["Removes all types of Slowness Effects"] = "移除所有类型的减速效果",
    ["Animation Changer"] = "动画修改",
    ["Select a character/skin to override the animations"] = "选择角色/皮肤来覆盖动画",
    ["Enable Jumping"] = "启用跳跃",
    ["Enables Jumping for when its disabled"] = "在跳跃被禁用时启用跳跃",

    -- ==================== Automation（自动化） ====================
    ["Auto Generator(s)"] = "自动发电机",
    ["Auto Completes Generator Puzzles"] = "自动完成发电机拼图",
    ["Auto Pickup"] = "自动拾取",
    ["Auto-Picks up Items near you"] = "自动拾取你附近的物品",
    ["Auto Escape"] = "自动逃脱",
    ["Auto-Escapes Nosferatu's Hook"] = "自动逃脱 Nosferatu 的钩子",

    -- ==================== 颜色选项 ====================
    ["Gold"] = "金色",
    ["Cyan"] = "青色",
    ["Purple"] = "紫色",
    ["White"] = "白色",
    ["Blue"] = "蓝色",
    ["Green"] = "绿色",
    ["Orange"] = "橙色",
    ["Red"] = "红色",
}

-- 拦截 Text 属性，自动替换为中文
local mt = getrawmetatable(game)
local old = mt.__newindex
setreadonly(mt, false)
mt.__newindex = newcclosure(function(tt, kk, v)
    if kk == "Text" and (tt:IsA("TextLabel") or tt:IsA("TextButton") or tt:IsA("TextBox")) then
        if type(v) == "string" then
            v = Value[v] or v
        end
    end
    return old(tt, kk, v)
end)
setreadonly(mt, true)

-- 提示通知
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Naiko 汉化已加载",
    Text = "翻译功能已生效",
    Duration = 5,
})

-- 加载 Naiko 脚本
loadstring(game:HttpGet("https://naikoexploit.vercel.app/ForsakenPlus"))()