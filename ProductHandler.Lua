game.MarketplaceService.ProcessReceipt = function(receipt)
	warn("player bought a thing",receipt)
	game.ReplicatedStorage.Remotes.BoughtProduct:FireClient(game.Players:GetPlayerByUserId(receipt.PlayerId),receipt)
	return Enum.ProductPurchaseDecision.PurchaseGranted
end

game.Lighting.Brightness = 99999999
