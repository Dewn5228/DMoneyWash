RegisterNetEvent('d-moneywash:removeblackmoney', function(quantitytowash)
  local quantity = exports.ox_inventory:Search(source, 'count', 'black_money')
  if quantity >= quantitytowash then
    exports.ox_inventory:RemoveItem(source, 'black_money', quantitytowash)
    Recivemoney = quantitytowash * Config.washpercentage
    TriggerClientEvent('d-moneywash:washprogressbar', source)
  else
    TriggerClientEvent('d-moneywash:notenoughmoney', source)
  end
end)

RegisterNetEvent('d-moneywash:addmoney', function()
  exports.ox_inventory:AddItem(source, 'money', Recivemoney)
  TriggerClientEvent('d-moneywash:moneywashed', source)
end)
