require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  # Matchers
  should belong_to(:store)
  should belong_to(:employee)

  should validate_presence_of(:store_id)
  should validate_presence_of(:employee_id)
  should allow_value(7.weeks.ago.to_date).for(:start_date)
  should allow_value(2.years.ago.to_date).for(:start_date)
  should_not allow_value(1.week.from_now.to_date).for(:start_date)
  should_not allow_value("bad").for(:start_date)
  should_not allow_value(nil).for(:start_date)

  # Context
  context "Given context" do
    setup do
      create_stores
      create_employees
      create_assignments
    end

    teardown do
      destroy_assignments
      destroy_employees
      destroy_stores
    end

    should "DO NOT REMOVE: AUTOGRADING" do
      assert_equal -3554384015922413861, Assignment.all.first.certify_autograde
    end

    should "have a scope 'for_store' that works" do
      assert_equal 4, Assignment.for_store(@cmu).size
      assert_equal 2, Assignment.for_store(@oakland).size
    end

    should "have a scope 'for_employee' that works" do
      assert_equal 2, Assignment.for_employee(@ben).size
      assert_equal 1, Assignment.for_employee(@kathryn).size
    end


    should "have a scope 'for_role' that works" do
      assert_equal 3, Assignment.for_role("employee").size
      assert_equal 3, Assignment.for_role("manager").size
    end

    should "have all the assignments listed alphabetically by store name" do
      assert_equal ["CMU", "CMU", "CMU", "CMU", "Oakland", "Oakland"], Assignment.by_store.map{|a| a.store.name}
    end

    should "have all the assignments listed chronologically by start date" do
      assert_equal ["Ben", "Ralph", "Kathryn", "Ed", "Cindy", "Ben"], Assignment.chronological.map{|a| a.employee.first_name}
    end

    should "have all the assignments listed alphabetically by employee name" do
      assert_equal ["Crawford", "Gruberman", "Janeway", "Sisko", "Sisko", "Wilson"], Assignment.by_employee.map{|a| a.employee.last_name}
    end

    should "have a scope to find all assignments for a given date" do
      assert_equal 3, Assignment.for_date(11.months.ago.to_date).size
      assert_equal [@assign_ben, @assign_cindy, @assign_ed], Assignment.for_date(11.months.ago.to_date).sort_by{|a| a.employee.first_name}
    end

    should "have a scope to find all current assignments for a store or employee" do
      assert_equal 2, Assignment.current.for_store(@cmu).size
      assert_equal 2, Assignment.current.for_store(@oakland).size
      assert_equal 1, Assignment.current.for_employee(@ben).size
      assert_equal 0, Assignment.current.for_employee(@ed).size
    end

    should "have a scope to find all past assignments for a store or employee" do
      assert_equal 2, Assignment.past.for_store(@cmu).size
      assert_equal 0, Assignment.past.for_store(@oakland).size
      assert_equal 1, Assignment.past.for_employee(@ben).size
      assert_equal 0, Assignment.past.for_employee(@cindy).size
    end

    should "allow for a end date in the past (or today) but after the start date" do
      # Note that we've been testing end_date: nil for a while now so safe to assume works...
      @assign_alex = FactoryBot.build(:assignment, employee: @alex, store: @oakland, start_date: 3.months.ago.to_date, end_date: 1.month.ago.to_date)
      assert @assign_alex.valid?
      @second_assignment_for_alex = FactoryBot.build(:assignment, employee: @alex, store: @oakland, start_date: 3.weeks.ago.to_date, end_date: Time.now.to_date)
      assert @second_assignment_for_alex.valid?
    end

    should "not allow for a end date in the future or before the start date" do
      # since Ed finished his last assignment a month ago, let's try to assign the lovable loser again ...
      @second_assignment_for_ed = FactoryBot.build(:assignment, employee: @ed, store: @oakland, start_date: 2.weeks.ago.to_date, end_date: 3.weeks.ago.to_date)
      deny @second_assignment_for_ed.valid?
      @third_assignment_for_ed = FactoryBot.build(:assignment, employee: @ed, store: @oakland, start_date: 2.weeks.ago.to_date, end_date: 3.weeks.from_now.to_date)
      deny @third_assignment_for_ed.valid?
    end

    should "identify a non-active store as part of an invalid assignment" do
      inactive_store = FactoryBot.build(:assignment, store: @hazelwood, employee: @ed, start_date: 1.day.ago.to_date, end_date: nil)
      deny inactive_store.valid?
    end

    should "identify a non-active employee as part of an invalid assignment" do
      @fred = FactoryBot.build(:employee, :first_name => "Fred", :active => false)
      inactive_employee = FactoryBot.build(:assignment, store: @oakland, employee: @fred, start_date: 1.day.ago.to_date, end_date: nil)
      deny inactive_employee.valid?
    end

    should "end the current assignment if it exists before adding a new assignment for an employee" do
      @promote_kathryn = FactoryBot.create(:assignment, employee: @kathryn, store: @oakland, start_date: 1.day.ago.to_date, end_date: nil)
      assert_equal 1.day.ago.to_date, @kathryn.assignments.first.end_date
      @promote_kathryn.destroy
    end

    should "terminate an assignment effectively as of today" do
      assert_nil @assign_kathryn.end_date
      @assign_kathryn.terminate
      assert_equal Date.current, @assign_kathryn.end_date
    end

    should "not terminate a completed assignment" do
      assert_equal 6.months.ago.to_date, @assign_ben.end_date
      @assign_ben.terminate
      assert_equal 6.months.ago.to_date, @assign_ben.end_date
    end

  end
end
