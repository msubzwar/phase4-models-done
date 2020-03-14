67-272: Creamery Project (Phase 3)
===

This is the starter code for phase 3 the Creamery Project in the spring of 2020 for 67-272.

This particular version is in Rails 5.2.7 because of some callback bugs in the current 6.0 version of Rails.

All models, controllers, and services have 100% test coverage.


Create and populate the database
---
The development database can be created and populated with a large number of realistic, but still fictitious, data by running the command `rails db:populate` on the command line of the main directory.  This will take a few minutes, but will give you:

1. Two admins, Alex and Mark.

2. Seven stores in the Pittsburgh area and a manager that is assigned to each.

3. 250 regular employees; each has one to three assignments. 

Having a decently large set of data in your development database will be helpful for assessing your views and identifying potential weaknesses.


Running Cucumber tests
---
In this phase we will be using [cucumber tests](https://cukes.info/) to verify that much of the basic CRUD functionality is in place.  These are not comprehensive, but should cover a lot of the essential read use cases and, along with controller tests, will count for a large portion of the grade in this phase (over half the grade).  The following command will run these tests:

```
  bundle exec cucumber
```

Note that you will need to run `rails db:test:prepare` before running your first cucumber test.  These tests are pretty broad, but if your design is very different and not able to pass the cucumber tests, you need to discuss it with Prof. H to see if you are eligible for an exception.  (All exceptions to cucumber tests must be granted in advance of the project's due date.)

As mentioned in class, it is strongly recommended you pass all your controller tests prior to running any cucumber tests.


Additional notes
---
More exciting notes to come...
# 67-272_2020_Creamery_P3_Starter
# 67-272_2020_Creamery_P3_Starter
