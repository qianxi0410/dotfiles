---@diagnostic disable: undefined-global

-- show user group of file
function Status:owner()
  local h = cx.active.current.hovered
  if h == nil or ya.target_family() ~= "unix" then
    return ui.Line({})
  end

  return ui.Line({
    ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
    ui.Span(":"),
    ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
    ui.Span(" "),
  })
end

function Status:render(area)
  self.area = area

  local left = ui.Line({ self:mode(), self:size(), self:name() })
  local right = ui.Line({ self:owner(), self:permissions(), self:percentage(), self:position() })
  return {
    ui.Paragraph(area, { left }),
    ui.Paragraph(area, { right }):align(ui.Paragraph.RIGHT),
    table.unpack(Progress:render(area, right:width())),
  }
end

-- show host and username in header
function Header:host()
  if ya.target_family() ~= "unix" then
    return ui.Line({})
  end

  return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
end

function Header:render(area)
  self.area = area

  local chunks = ui.Layout()
      :direction(ui.Layout.HORIZONTAL)
      :constraints({ ui.Constraint.Percentage(50), ui.Constraint.Percentage(50) })
      :split(area)

  local left = ui.Line({ self:host(), self:cwd() })
  local right = ui.Line({ self:tabs() })
  return {
    ui.Paragraph(chunks[1], { left }),
    ui.Paragraph(chunks[2], { right }):align(ui.Paragraph.RIGHT),
  }
end
