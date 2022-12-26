local status, hierarchy_tree_go = pcall(require, "hierarchy-tree-go")
if not status then
	return
end

hierarchy_tree_go.setup()
