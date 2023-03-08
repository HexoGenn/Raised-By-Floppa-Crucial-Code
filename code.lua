local module = {}
local power:UDim2
local e

module.SetCameraShake = function(enabled,pow:UDim2)
	power = pow
	if enabled then
		if e then
			e:Disconnect()
		end
		e = game:GetService("RunService").RenderStepped:Connect(function()
			workspace.CurrentCamera.CFrame *= CFrame.Angles(math.sin(tick()*power.X.Offset)*power.X.Scale, math.sin(tick()*power.Y.Offset)*power.Y.Scale, 0)
		end)
	else
		if e then
			e:Disconnect()
		end
	end
end

return module
