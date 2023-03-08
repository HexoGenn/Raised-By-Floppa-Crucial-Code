game.MarketplaceService.ProcessReceipt = function(receipt)
	game.ReplicatedStorage.Remotes.BoughtProduct:FireClient(game.Players:GetPlayerByUserId(receipt.PlayerId),receipt)
	return Enum.ProductPurchaseDecision.PurchaseGranted
end
