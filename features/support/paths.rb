module NavigationHelpers
  def path_to(page_name)
    case page_name
 
    when /the home\s?page/
      '/'
    when /the About Us\s?page/
      about_path
    when /the Contact Us\s?page/
      contact_path
    when /the Privacy\s?page/
      privacy_path
      
    when /the employees\s?page/ 
      employees_path
    when /Ben Sisko details\s?page/
      employee_path(@ben)
    when /Cindy Crawford details\s?page/
      employee_path(@cindy)
    when /Ed Gruberman details\s?page/
      employee_path(@ed)
    when /edit Ben's\s?record/
      edit_employee_path(@ben) 
    when /the new employee\s?page/
      new_employee_path

    when /the stores\s?page/ 
      stores_path
    when /the new store\s?page/
      new_store_path
    when /CMU store details\s?page/
      store_path(@cmu)
    when /Oakland store details\s?page/
      store_path(@oakland)
    when /edit the CMU store\s?/
      edit_store_path(@cmu)

    when /the assignments\s?page/ 
      assignments_path
    when /Cindy's assignment details/
      assignment_path(@assign_cindy)
    when /the new assignment\s?page/
      new_assignment_path

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)