module ApplicationHelper
	def sortable(column, title = nil, direction = nil)
	  title ||= column.titleize
	  direction ||= "desc" 
	  link_to title, {:sort => column, :direction => direction}
	end
end
