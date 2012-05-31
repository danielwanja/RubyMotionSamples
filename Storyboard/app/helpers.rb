def retrieve_subview_with_tag(topview,tag)
  retval = topview.view.subviews.find { |v| v.tag == tag }
  raise "tag #{tag} not found in view:#{topview.view}" unless retval
  retval
end
