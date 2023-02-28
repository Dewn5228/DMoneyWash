RegisterNetEvent('d-moneywash:washingmenu', function()
  local quantity = lib.inputDialog(locale('menu_title'), {
    { type = 'number', label = locale('quantity'), description = locale('menu_desc') }
  })
  if not quantity then return end
  Quantitytowash = quantity[1]
  if Quantitytowash > 0 then
    TriggerServerEvent('d-moneywash:removeblackmoney', Quantitytowash)
  else
    lib.notify({
      title = locale('notification_title'),
      description = locale('noti_invalid_quantity'),
      type = 'error'
    })
  end
end)

RegisterNetEvent('d-moneywash:washprogressbar', function()
  exports.ox_target:disableTargeting(true)
  if lib.progressCircle({
        duration = Quantitytowash * 0.1,
        label = locale('washprogress_label'),
        position = 'middle',
        useWhileDead = false,
        disable = {
          move = true,
          car = true,
          combat = true,
          mouse = true,
        },
      }) then
    TriggerServerEvent('d-moneywash:addmoney')
    exports.ox_target:disableTargeting(false)
  end
end)

RegisterNetEvent('d-moneywash:notenoughmoney', function()
  lib.notify({
    title = locale('notification_title'),
    description = locale('noti_not_enough_money'),
    type = 'error'
  })
end)

RegisterNetEvent('d-moneywash:moneywashed', function()
  lib.notify({
    title = locale('notification_title'),
    description = locale('noti_money_washed'),
    type = 'success'
  })
end)

for k, v in pairs(Config.machineplaces) do
  exports.ox_target:addBoxZone({
    coords = v,
    size = vec3(1, 1, 1),
    rotation = 10,
    groups = 'restaurante',
    options = {
      {
        name = 'washing-machines',
        event = 'd-moneywash:washingmenu',
        icon = 'fa-solid fa-cube',
        label = locale('open_machine'),
      }
    }
  })
end
