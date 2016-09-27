# Hero Reporting Interface
## Setting
We're in the world of Marvel's Civil War. We need to have a way for citizens to report suspected super heroes. (They won't be real until and unless I figure out how to iterate through a hash writing each value in that hash to a database).

We're going to have a table of accused superhero that people ca use to report people with powers. They'll provide their info, what hero they thought they saw, and what power that person possesses.

We'll also have a table of investigators, with state jurisdiction. They'll investigate potential supers in each state.

Ideally, once two people id the same person as the same super, that super is cloned into a lead table with and assigned a state investigator.

## How do we build it?
- Create 3 tables (suspects, investigators, leads) with data from Faker
- Populate investigator table assigning one to each state from an array of states. (this may create the same problem as earlier and if it does, some states may not have inspectors)
- When a new entry is added to the DB check if the hero name matches any others.
  - If it does
    - insert that hero to leads with a randomly generated address
    - update that record with the inspector for that state
  - Else
    - Do nothing
- Report to reporter that the inspector for their state will be in touch.
