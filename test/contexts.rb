module Contexts
    
    def create_employees
      @ed = FactoryBot.create(:employee)
      @cindy = FactoryBot.create(:employee, first_name: "Cindy", last_name: "Crawford", ssn: "084-35-9822", date_of_birth: 17.years.ago.to_date)
      @ralph = FactoryBot.create(:employee, first_name: "Ralph", last_name: "Wilson", date_of_birth: 16.years.ago.to_date)
      @chuck = FactoryBot.create(:employee, first_name: "Chuck", last_name: "Waldo", date_of_birth: 26.years.ago.to_date, active: false)
      @ben = FactoryBot.create(:employee, first_name: "Ben", last_name: "Sisko", role: "manager", :phone => "412-268-2323", ssn: "091361492")
      @kathryn = FactoryBot.create(:employee, first_name: "Kathryn", last_name: "Janeway", role: "manager", ssn: "082 86 9198", date_of_birth: 30.years.ago.to_date)
      @alex = FactoryBot.create(:employee, first_name: "Alex", last_name: "Heimann", role: "admin")
    end
    
    def destroy_employees
      @ed.destroy
      @cindy.destroy
      @ralph.destroy
      @chuck.destroy  
      @ben.destroy
      @kathryn.destroy
      @alex.destroy
    end
    
     def create_stores
      @cmu = FactoryBot.create(:store)
      @oakland = FactoryBot.create(:store, name: "Oakland", phone: "412-268-8211")
      @hazelwood = FactoryBot.create(:store, name: "Hazelwood", active: false)
    end
    
    def destroy_stores
      @cmu.destroy
      @hazelwood.destroy
      @oakland.destroy
    end
    
     def create_assignments
      @assign_ed = FactoryBot.create(:assignment, employee: @ed, store: @cmu)
      @assign_ralph = FactoryBot.create(:assignment, employee: @ralph, store: @oakland, start_date: 10.months.ago.to_date, end_date: nil)
      @assign_cindy = FactoryBot.create(:assignment, employee: @cindy, store: @cmu, start_date: 14.months.ago.to_date, end_date: nil)
      @assign_ben = FactoryBot.create(:assignment, employee: @ben, store: @cmu, start_date: 2.years.ago.to_date, end_date: 6.months.ago.to_date)
      @promote_ben = FactoryBot.create(:assignment, employee: @ben, store: @cmu, start_date: 6.months.ago.to_date, end_date: nil)
      @assign_kathryn = FactoryBot.create(:assignment, employee: @kathryn, store: @oakland, start_date: 10.months.ago.to_date, end_date: nil)
    end
    
    def destroy_assignments
      @assign_ed.destroy
      @assign_ralph.destroy
      @assign_cindy.destroy
      @assign_ben.destroy
      @promote_ben.destroy
      @assign_kathryn.destroy
    end

  
  def create_all
    puts "Building context..."
    create_employees
    puts "Built employees"
    create_stores
    puts "Built stores"
    create_assignments
    puts "Built assignments"
  end
  
end