starmourn.utils.events = starmourn.utils.events or {}
starmourn.utils.events.list = starmourn.utils.events.list or {}

function starmourn.utils.events.register(name, event, func)
  if not starmourn.utils.events.list[name] then
    starmourn.utils.events.list[name] = registerAnonymousEventHandler(event, func)
  end
end

function starmourn.utils.events.kill(name)
  if starmourn.utils.events.list[name] then
    return killAnonymousEventHandler(starmourn.utils.events.list[name])
  end
end
