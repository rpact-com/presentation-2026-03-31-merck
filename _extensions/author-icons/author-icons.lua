-- Lua filter to replace icon placeholders with actual SVGs

local linkedin_icon = '<svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 640 640"><!--!Font Awesome Free v7.0.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.--><path d="M512 96L127.9 96C110.3 96 96 110.5 96 128.3L96 511.7C96 529.5 110.3 544 127.9 544L512 544C529.6 544 544 529.5 544 511.7L544 128.3C544 110.5 529.6 96 512 96zM231.4 480L165 480L165 266.2L231.5 266.2L231.5 480L231.4 480zM198.2 160C219.5 160 236.7 177.2 236.7 198.5C236.7 219.8 219.5 237 198.2 237C176.9 237 159.7 219.8 159.7 198.5C159.7 177.2 176.9 160 198.2 160zM480.3 480L413.9 480L413.9 376C413.9 351.2 413.4 319.3 379.4 319.3C344.8 319.3 339.5 346.3 339.5 374.2L339.5 480L273.1 480L273.1 266.2L336.8 266.2L336.8 295.4L337.7 295.4C346.6 278.6 368.3 260.9 400.6 260.9C467.8 260.9 480.3 305.2 480.3 362.8L480.3 480z"/></svg>'

local orcid_icon = '<svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512"><path fill="#a6ce39" d="M294.8 188.2h-45.9V342h47.5c67.6 0 83.1-51.3 83.1-76.9 0-41.6-26.5-76.9-84.7-76.9zM256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm-80.8 360.8h-29.8v-207.5h29.8zm-14.9-231.1a19.6 19.6 0 1 1 19.6-19.6 19.6 19.6 0 0 1 -19.6 19.6zM300 369h-81V161.3h80.6c76.7 0 110.4 54.8 110.4 103.9C410 318.4 368.4 369 300 369z"/></svg>'

function Str(el)
  if el.text:match('{{LINKEDIN}}') or el.text:match('{{ORCID}}') then
    local replaced = el.text:gsub('{{LINKEDIN}}', linkedin_icon)
    replaced = replaced:gsub('{{ORCID}}', orcid_icon)
    return pandoc.RawInline('html', replaced)
  end
  return el
end

function RawInline(el)
  if el.format == 'html' then
    local replaced = el.text:gsub('{{LINKEDIN}}', linkedin_icon)
    replaced = replaced:gsub('{{ORCID}}', orcid_icon)
    if replaced ~= el.text then
      return pandoc.RawInline('html', replaced)
    end
  end
  return el
end
