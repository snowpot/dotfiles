local status, bufferLine = pcall(require, "bufferline")
if not status then
	return
end

bufferLine.setup({})
