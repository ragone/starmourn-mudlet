starmourn.utils.skills = starmourn.utils.skills or {}
local ignore = {'Captaincy', 'Hacking', 'Art', 'Fashion', 'Cuisine', 'Jewelry', 'WeaponModding', 'ArmorModding', 'ShipModding', 'Furnishing', 'Mixology'}

function starmourn.utils.skills.get_groups()
  if not starmourn.utils.skills.list then
    starmourn.utils.skills.list = {}
    table.foreach(gmcp.Char.Skills.Groups, function(key, skillset)
      if not table.contains(ignore, skillset.name) then
        sendGMCP(string.format('Char.Skills.Get %s', yajl.to_string({group=skillset.name})))
        starmourn.utils.skills.list[skillset.name] = {
          rank = tonumber(skillset.rank:match('(%d+)/%d+')),
          maxrank = tonumber(skillset.rank:match('%d+/(%d+)')),
          list = {}
        }
      end
    end)
  end
end

function starmourn.utils.skills.get_list()
  table.foreach(gmcp.Char.Skills.List.list, function(key, skill)
    sendGMCP(string.format('Char.Skills.Get %s', yajl.to_string({
      group = gmcp.Char.Skills.List.group:title(),
      name = skill
    })))
  end)
end

function starmourn.utils.skills.info()
  local group = gmcp.Char.Skills.Info.group:title()
  local skill = gmcp.Char.Skills.Info.skill:title()
  local lessons = gmcp.Char.Skills.Info.info:match('(%d+) Lessons')
  starmourn.utils.skills.list[group].list[#starmourn.utils.skills.list[group].list + 1] = {skill, tonumber(lessons)}
  if #starmourn.utils.skills.list[group].list == starmourn.utils.skills.list[group].maxrank then
    table.sort(starmourn.utils.skills.list[group].list, function(a,b) return a[2] < b[2] end)
    local sorted_list = starmourn.utils.skills.list[group].list
    starmourn.utils.skills.list[group].list = {}
    table.foreach(sorted_list, function(key, value)
      starmourn.utils.skills.list[group].list[#starmourn.utils.skills.list[group].list + 1] = value[1]
    end)
  end
end

function starmourn.utils.skills.have(skill, skillset)
  local rank = starmourn.utils.skills.list[skillset].rank
  local skill = table.index_of(starmourn.utils.skills.list[skillset].list, skill)
  return skill <= rank
end

starmourn.utils.events.register('fetch groups', 'gmcp.Char.Skills.Groups', 'starmourn.utils.skills.get_groups')
starmourn.utils.events.register('fetch skills', 'gmcp.Char.Skills.List', 'starmourn.utils.skills.get_list')
starmourn.utils.events.register('parse skills', 'gmcp.Char.Skills.Info', 'starmourn.utils.skills.info')
